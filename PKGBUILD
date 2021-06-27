# Maintainer: wowario <wowario[at]protonmail[dot]com>

pkgname=wownero-git
pkgver=0.10.0.0.beefa5e62e
pkgrel=1
pkgdesc="a fairly launched privacy-centric meme coin with no premine and a finite supply"
license=('BSD')
arch=('x86_64')
url="https://wownero.org/"
depends=('boost-libs' 'openssl' 'readline' 'zeromq' 'pcsclite' 'protobuf' 'libpgm' 'unbound' 'libsodium')
makedepends=('git' 'cmake' 'boost')
source=(
    "${pkgname}"::"git+https://git.wownero.com/wownero/wownero.git#branch=dev"
    monero-boost1.76.patch::https://github.com/selsta/monero/commit/c28d2f7c.patch)
sha512sums=('SKIP'
            'SKIP')

prepare() {
  cd "${pkgname}"
  git submodule update --init --recursive
  patch -p1 < ../monero-boost1.76.patch # Fix build with boost 1.76
}

build() {
  cd "${pkgname}"
  mkdir -p build && cd build
  cmake -D BUILD_TESTS=OFF -D USE_DEVICE_TREZOR=OFF -D CMAKE_BUILD_TYPE=release -D ARCH=default ../
  make
}

package() {

  cd "${pkgname}"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm755 "build/bin/wownero-wallet-cli" \
                 "build/bin/wownero-wallet-rpc" \
                 "build/bin/wownerod" \
                 -t "${pkgdir}/usr/bin"
}
