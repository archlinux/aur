# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

# Note:
# When bumping major or minor versions, some downstream packages that use somewhat
# unorthodox runtime arrangements need rebuilding to match. After SWIG version
# bumps please rebuild first python-pivy then freecad in addition to usual suspects.
# c.f. https://github.com/FreeCAD/FreeCAD/issues/25048#issuecomment-3627741495
# c.f. https://gitlab.archlinux.org/archlinux/packaging/packages/python-pivy/-/issues/1
# c.f. https://gitlab.archlinux.org/archlinux/packaging/packages/swig/-/issues/2

pkgname=swig
pkgver=4.4.0
pkgrel=2
pkgdesc="Generate scripting interfaces to C/C++ code"
arch=('x86_64')
url="https://www.swig.org/"
license=(
  GPL-3.0-or-later
  LicenseRef-BSD-Arizona
  LicenseRef-BSD-Chicago
  LicenseRef-BSD-Utah-California
)
depends=('gcc-libs' 'glibc' 'pcre2' 'zlib')
checkdepends=('ruby' 'python' 'java-environment' 'tcl' 'php' 'lua' 'r' 'go' 'boost')
makedepends=('git')
source=(git+https://github.com/swig/swig#tag=v$pkgver)
sha512sums=('eed3eb9b8c769661e039718982a17c2a39907023085ec2e7f957664456a8816c376756278cc2667ce73818fe986f26d4479819c7f0d50e43fa5dea012d742c90')

prepare() {
  sed -n '5,32p' $pkgname/LICENSE-UNIVERSITIES > LicenseRef-BSD-Utah-California.txt
  sed -n '37,64p' $pkgname/LICENSE-UNIVERSITIES > LicenseRef-BSD-Chicago.txt
  sed -n '69,94p' $pkgname/LICENSE-UNIVERSITIES > LicenseRef-BSD-Arizona.txt

  # https://github.com/swig/swig/issues/2858
  sed '/stl_no_default_constructor/d' -i $pkgname/Examples/test-suite/common.mk

  # https://github.com/swig/swig/issues/2859
  sed '/li_std_list/d' -i $pkgname/Examples/test-suite/java/Makefile.in

  git -C $pkgname cherry-pick -n b16a7c958a561721d164183f682d1511dc7c900b # Fix crash in R test

  cd $pkgname
  ./autogen.sh
}

build() {
  cd ${pkgname}
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgname}
  make check PY3=y
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 ../*.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
