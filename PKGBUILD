# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=nodejs-lts-iron
pkgver=20.19.4
pkgrel=1
pkgdesc="Evented I/O for V8 javascript (LTS release: Iron)"
arch=(x86_64)
url="https://nodejs.org/"
license=(MIT)
# maybe revert back to openssl-1.1 or internal openssl
# https://github.com/nodejs/node/issues/47852
depends=(openssl zlib icu libuv c-ares brotli libnghttp2) # http-parser v8)
makedepends=(python procps-ng)
optdepends=('npm: nodejs package manager')
options=(!lto)
provides=("nodejs=$pkgver")
conflicts=(nodejs)
source=(https://nodejs.org/dist/v${pkgver}/node-v${pkgver}.tar.xz)
# https://nodejs.org/download/release/latest-iron/SHASUMS256.txt.asc
sha256sums=('b87fd7106013d3906706913ffc63a4403715fbb272c4f83ff4338527353eec0f')

prepare() {
  cd node-v${pkgver}
}

build() {
  cd node-v${pkgver}

  # this uses malloc_usable_size, which is incompatible with fortification level 3
  export CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  export CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  ./configure \
    --prefix=/usr \
    --with-intl=system-icu \
    --without-npm \
    --shared-openssl \
    --shared-zlib \
    --shared-libuv \
    --experimental-http-parser \
    --shared-brotli \
    --shared-cares \
    --shared-nghttp2
    # --shared-v8
    # --shared-http-parser

  make
}

check() {
  cd node-v${pkgver}
  make test-only || :
}

package() {
  cd node-v${pkgver}

  # this uses malloc_usable_size, which is incompatible with fortification level 3
  export CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  export CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
