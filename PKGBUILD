# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=nodejs-lts-iron
pkgver=20.9.0
pkgrel=1
pkgdesc="Evented I/O for V8 javascript (LTS release: Hydrogen)"
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
sha256sums=('a23d96810abf0455426b349d47ce5310f33095b7bc0571b9cc510f481c3a4519')

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
