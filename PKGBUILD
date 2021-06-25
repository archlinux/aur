# Maintainer: wowario <wowario[at]protonmail[dot]com>

pkgname=wownero-git
pkgver=0.10.0.0
pkgrel=1
pkgdesc="a fairly launched privacy-centric meme coin with no premine and a finite supply"
license=('BSD')
arch=('x86_64')
url="https://wownero.org/"
depends=('boost-libs' 'libunwind' 'openssl' 'readline' 'zeromq' 'pcsclite' 'hidapi' 'protobuf' 'libusb' 'libudev.so')
makedepends=('git' 'cmake' 'boost')
source=(
    "${pkgname}"::"git+https://git.wownero.com/wownero/wownero.git#branch=dev-v0.10"
    "git+https://github.com/monero-project/unbound.git"
    "git+https://github.com/monero-project/supercop.git"
    "git+https://github.com/monero-project/miniupnp.git"
    "git+https://github.com/Tencent/rapidjson.git"
    "git+https://git.wownero.com/wownero/RandomWOW.git#branch=1.1.9-wow"
    monero-boost1.76.patch::https://github.com/selsta/monero/commit/c28d2f7c.patch)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "${pkgname}"
  git submodule init
  git config submodule.external/unbound.url "$srcdir/unbound"
  git config submodule.external/supercop.url "$srcdir/supercop"
  git config submodule.external/miniupnp.url "$srcdir/miniupnp"
  git config submodule.external/rapidjson.url "$srcdir/rapidjson"
  git config submodule.external/RandomWOW.url "$srcdir/RandomWOW"
  git submodule update

  patch -p1 < ../monero-boost1.76.patch # Fix build with boost 1.76
}

build() {
  cd "${pkgname}"
  mkdir -p build && cd build
  cmake -D BUILD_TESTS=OFF -D CMAKE_BUILD_TYPE=release -D ARCH=default ../
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
