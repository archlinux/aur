# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=swig
pkgver=4.1.1
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
depends=('pcre2' 'gcc-libs')
checkdepends=('ruby' 'python' 'java-environment' 'tcl' 'php' 'lua' 'r' 'go' 'boost')
source=($pkgname-$pkgver.tar.gz::https://github.com/swig/swig/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('26589a3b1af76db1e9e540760b0baeeff5ddf83e06075716eab1c46c0b49c768b951d9cda8a2061126ebbbeedf194d7724701ee76b4ef1b55073a89b1e60b1b4')

prepare() {
  sed -n '5,32p' $pkgname-$pkgver/LICENSE-UNIVERSITIES > LicenseRef-BSD-Utah-California.txt
  sed -n '37,64p' $pkgname-$pkgver/LICENSE-UNIVERSITIES > LicenseRef-BSD-Chicago.txt
  sed -n '69,94p' $pkgname-$pkgver/LICENSE-UNIVERSITIES > LicenseRef-BSD-Arizona.txt

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
