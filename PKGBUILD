# Maintainer: wowario <wowario[at]protonmail[dot]com>

pkgname=wownero-git
pkgver=0.11.0.0.6b28de1cdc
pkgrel=3
pkgdesc="Wownero: a fairly launched privacy-centric meme coin with no premine and a finite supply"
license=('BSD')
arch=('x86_64')
url="https://wownero.org/"
depends=('boost-libs' 'libunwind' 'openssl' 'readline' 'zeromq' 'pcsclite' 'hidapi' 'protobuf' 'libusb' 'libudev.so' 'libunbound.so')
makedepends=('boost' 'cmake' 'git' 'python')
source=(
    "${pkgname}"::"git+https://git.wownero.com/wownero/wownero.git"
    "git+https://github.com/monero-project/unbound.git"
    "git+https://github.com/monero-project/supercop.git"
    "git+https://github.com/monero-project/miniupnp.git"
    "git+https://github.com/Tencent/rapidjson.git"
    "git+https://git.wownero.com/wownero/RandomWOW.git"
    "wownero.sysusers"
    "wownero.tmpfiles"
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '29f050d4063b6309885f1d675c96f2e45cbe8565c74240e5db4e3ac2cecbc7ebf643f948a05e4273607fae528302d525398fdb9e6bf330dcd88890e55a7a482f'
            'a7c8170462e7578eced13908a27955128cc0c002c4bcff0d8c42719f1d7ee0dd33fa793c86c7ded52215cd22ba884569d69043c4d008d2597e33eb7ca1df9972')

prepare() {
  cd "${pkgname}"
  git checkout dev
  git submodule init
  git config submodule.external/unbound.url "$srcdir/unbound"
  git config submodule.external/supercop.url "$srcdir/supercop"
  git config submodule.external/miniupnp.url "$srcdir/miniupnp"
  git config submodule.external/rapidjson.url "$srcdir/rapidjson"
  git config submodule.external/RandomWOW.url "$srcdir/randomwow"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${pkgname}"
  mkdir -p build && cd build
  cmake -D BUILD_TESTS=OFF -D CMAKE_BUILD_TYPE=release -D ARCH=default ../
  make
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

# vim: ts=2 sw=2 et:][;pl.;o0;-lkm
