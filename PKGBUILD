# Maintainer: Vincent Bernardoff <vb AT luminar.eu.org>
pkgname=nng
pkgver=1.4.0
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
md5sums=('124c94f9cbfabfecd3b18fdcefa66576')

prepare() {
  cmake -B build -S "${pkgname}-${pkgver}" -G Ninja \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DNNG_ENABLE_TLS=ON \
        -DNNG_ENABLE_DOC=ON \
        -DNNG_STATIC_LIB=OFF \
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
