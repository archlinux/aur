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
source=(https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('1cea1918455a75ebc9b2653dd1715bd5dcd974554955f324295c6a6f14c0a715651b221b85fad4a8af5197e0c75bfe7b590bc6ba7178c26245fbbd9a7e110100')

prepare() {
  sed -n '5,32p' $pkgname-$pkgver/LICENSE-UNIVERSITIES > LicenseRef-BSD-Utah-California.txt
  sed -n '37,64p' $pkgname-$pkgver/LICENSE-UNIVERSITIES > LicenseRef-BSD-Chicago.txt
  sed -n '69,94p' $pkgname-$pkgver/LICENSE-UNIVERSITIES > LicenseRef-BSD-Arizona.txt
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
