# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=nodejs-lts-iron
pkgver=20.11.0
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
source=(${url}/dist/v${pkgver}/node-v${pkgver}.tar.xz)
# https://nodejs.org/download/release/latest-iron/SHASUMS256.txt.asc
sha256sums=('31807ebeeeb049c53f1765e4a95aed69476a4b696dd100cb539ab668d7950b40')

build() {
  cd node-v${pkgver}

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
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
