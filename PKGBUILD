# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=swig
pkgver=4.0.2
pkgrel=5
pkgdesc="Generate scripting interfaces to C/C++ code"
arch=('x86_64')
url="http://www.swig.org/"
license=('custom')
depends=('pcre' 'gcc-libs')
checkdepends=('ruby' 'python' 'java-environment' 'tcl' 'php' 'lua' 'r' 'go' 'boost')
source=(https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz
        jdk17.patch
        python310.patch)
sha512sums=('05e7da70ce6d9a733b96c0bcfa3c1b82765bd859f48c74759bbf4bb1467acb1809caa310cba5e2b3280cd704fca249eaa0624821dffae1d2a75097c7f55d14ed'
            '06671202b6a1f82e96166ada7982b9dd70ae5365dc90c4f24e81596963f7bd3960913f2eca5250ad76bee4b2e51f10ed922595722036e3da9da63d6aa988cb3e'
            '3de6484d920d8ecf042102d40af3a375ecb1ead3c4e0bc45ae63633e5fd652f52e1938108f747514a654a19d93a783afe2968b141be56957f438162263d62d8a')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 -i ../jdk17.patch

  # https://github.com/swig/swig/issues/2044
  patch -Np1 -i ../python310.patch
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
  install -D -m644 LICENSE-UNIVERSITIES "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE-UNIVERSITIES
}
