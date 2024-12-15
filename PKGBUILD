# Maintainer: wowario <wowario[at]protonmail[dot]com>

pkgname=wownero-git
pkgver=0.11.3.0.3e302be710
pkgrel=1
pkgdesc="Wownero: a fairly launched privacy-centric meme coin with no premine and a finite supply"
license=('BSD-3-Clause')
arch=('x86_64')
url="https://wownero.org/"
depends=(
  'gcc-libs'
  'glibc'
  'libboost_program_options.so'
  'libhidapi-libusb.so'
  'libreadline.so'
  'libsodium.so'
  'libssl.so'
  'libunbound.so'
  'libunwind'
  'libusb'
  'libzmq.so'
  'pcsclite'
  'protobuf'
  'gcc13'
)
makedepends=(
  'boost'
  'cmake'
  'git'
  'python'
)
source=(
  "${pkgname}::git+https://codeberg.org/wownero/wownero"
  "git+https://github.com/miniupnp/miniupnp.git"
  "git+https://github.com/Tencent/rapidjson.git"
  "git+https://github.com/trezor/trezor-common.git"
  "git+https://codeberg.org/wownero/RandomWOW.git"
  "git+https://github.com/monero-project/supercop.git"
  "fortify-source.patch"
  "wownero.sysusers"
  "wownero.tmpfiles"
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "${pkgname}"
  git submodule init
  git config submodule.external/miniupnp.url "$srcdir/miniupnp"
  git config submodule.external/rapidjson.url "$srcdir/rapidjson"
  git config submodule.external/trezor-common.url "$srcdir/trezor-common"
  git config submodule.external/randomwow.url "$srcdir/RandomWOW"
  git config submodule.external/supercop.url "$srcdir/supercop"
  git -c protocol.file.allow=always submodule update

  # Fix build with protobuf 23
  sed -e 's|CMAKE_CXX_STANDARD 14|CMAKE_CXX_STANDARD 17|' -e 's|CMAKE_CXX_STANDARD=11|CMAKE_CXX_STANDARD=17|' -i CMakeLists.txt -i cmake/CheckTrezor.cmake

  patch -Np1 -i ../fortify-source.patch
  sed -e 's|std=c++11|std=c++17|g' -i contrib/depends/protobuf.mk
}

build() {
  cd "${pkgname}"
  export CC=gcc-13 CXX=g++-13
  CFLAGS+=" -Wno-implicit-function-declaration -Wno-int-conversion" \
  cmake -B build -D ARCH="default" -D CMAKE_BUILD_TYPE=Release
  make -C build
}

package() {
  backup=('etc/wow.conf')

  cd "${pkgname}"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm644 "utils/conf/wow.conf" "${pkgdir}/etc/wow.conf"
  install -Dm644 "utils/systemd/wownerod.service" "${pkgdir}/usr/lib/systemd/system/wownerod.service"
  install -Dm644 "../wownero.sysusers" "${pkgdir}/usr/lib/sysusers.d/wownero.conf"
  install -Dm644 "../wownero.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/wownero.conf"

  install -Dm755 "build/bin/wownero-wallet-cli" \
                 "build/bin/wownero-wallet-rpc" \
                 "build/bin/wownerod" \
                 -t "${pkgdir}/usr/bin"
}

# vim: ts=2 sw=2 et:
