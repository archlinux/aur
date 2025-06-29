# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=swig
pkgver=4.3.1
pkgrel=1
pkgdesc="Generate scripting interfaces to C/C++ code"
arch=('x86_64')
url="http://www.swig.org/"
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
sha512sums=('614ae5f9cb6c3c49b44398d93e3c42f837a7b0d62410049085ed10e85bd14b69fd5916c0cbb43afba01ed1f3abcc4a4b6e8d8f85bba4b752a4f0737f4904d118')

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
