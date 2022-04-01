# Maintainer: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: George Giorgidze <giorgidze (at) gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=antlr2
pkgver=2.7.7
pkgrel=12
arch=('x86_64')
url="https://www.antlr2.org/"
pkgdesc='Language recognition tool providing a framework to build grammatical parsers'
license=('custom')
depends=('java-runtime' 'sh')
provides=("antlr=${pkgver}")
makedepends=('java-environment')
options=('staticlibs')
source=("https://www.antlr2.org/download/antlr-${pkgver}.tar.gz"
        'runantlr2.sh'
        'gcc4.4.patch')
md5sums=('01cc9a2a454dd33dcd8c856ec89af090'
         'e4aa827cf78f97c4e5fae086831192d6'
         '8574c93f40e6477e83c29f9b07de49da')

prepare() {
  cd antlr-${pkgver}
  patch -Np0 -i "${srcdir}"/gcc4.4.patch
}

build() {
  cd antlr-${pkgver}

  sed -i "/^CFLAGS=/d" ./configure
  export CXX_LIB_CMD="ld ${LDFLAGS}"
  export CXX_LINK_CMD="ld ${LDFLAGS}"
  ./configure --prefix=/usr \
    --disable-examples \
    --disable-csharp
  make CXXFLAGS="${CXXFLAGS} -fPIC"
}

package() {
  cd antlr-${pkgver}/lib/cpp
  make prefix="${pkgdir}/usr" install

  install -Dm644 ../../antlr/antlr.jar "${pkgdir}"/usr/share/java/antlr2.jar
  install -Dm755 "${srcdir}"/runantlr2.sh "${pkgdir}"/usr/bin/runantlr2
  install -Dm644 "${srcdir}"/antlr-${pkgver}/LICENSE.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
