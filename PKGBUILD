# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=swig
pkgver=4.2.1
pkgrel=2
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
source=($pkgname-$pkgver.tar.gz::https://github.com/swig/swig/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('5d653333f73356d4d5ba8b615882e49f33f188bc68d8204352116bc4aca7946ec01ce2e02524c5ce805b98c2219ed05e664120485bf18095c5c0785436487074')

prepare() {
  sed -n '5,32p' $pkgname-$pkgver/LICENSE-UNIVERSITIES > LicenseRef-BSD-Utah-California.txt
  sed -n '37,64p' $pkgname-$pkgver/LICENSE-UNIVERSITIES > LicenseRef-BSD-Chicago.txt
  sed -n '69,94p' $pkgname-$pkgver/LICENSE-UNIVERSITIES > LicenseRef-BSD-Arizona.txt

  # https://github.com/swig/swig/issues/2858
  sed '/stl_no_default_constructor/d' -i $pkgname-$pkgver/Examples/test-suite/common.mk

  # https://github.com/swig/swig/issues/2859
  sed '/li_std_list/d' -i $pkgname-$pkgver/Examples/test-suite/java/Makefile.in

  cd $pkgname-$pkgver
  ./autogen.sh
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check PY3=y
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 ../*.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
