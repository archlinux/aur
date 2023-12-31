# Maintainer: Vincent Bernardoff <vb AT luminar.eu.org>
pkgname=nng
pkgver=1.6.0
pkgrel=1
pkgdesc="Rewrite of the SP protocol library known as libnanomsg"
arch=(arm armv6h armv7h aarch64 x86_64 i686)
url="https://nanomsg.github.io/nng/"
license=('MIT')
depends=( 'mbedtls')
makedepends=('cmake' 'ninja' 'asciidoctor')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=
source=("https://github.com/nanomsg/nng/archive/v${pkgver}.tar.gz")
sha256sums=('f639e77911ef935a13e9779d4a18d45490433ba744f89752a15b84c929ce2725')

prepare() {
  cmake -B build -S "${pkgname}-${pkgver}" -G Ninja \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DNNG_ENABLE_TLS=ON \
        -DNNG_ENABLE_DOC=ON \
        -DBUILD_SHARED_LIBS=ON
}

build() {
  cd "${srcdir}/build"
  ninja
}

check() {
  cd "${srcdir}/build"
  ninja test
}

package() {
  cd "${srcdir}/build"
  DESTDIR=${pkgdir} ninja install
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
