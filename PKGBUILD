# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_commit='4daffb63b0a42fd9379caf688d5c2d50d525706b'
pkgname=supersonic
pkgver=2026.11.06
pkgrel=1
pkgdesc='A Subsonic music server implemented in C++'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/davidgfnet/supersonic-cpp'
license=('Unlicense')
depends=('fcgi' 'openssl' 'sqlite' 'taglib')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/davidgfnet/${pkgname}-cpp/archive/${_commit}.tar.gz"
        "argparse.hpp::https://raw.githubusercontent.com/hbristow/argparse/43edb8acf2135509590631a0ac4582e3741016bf/argparse.hpp"
        "${pkgname}.install"
        "${pkgname}.service"
        "${pkgname}.socket")
b2sums=('e1844d8482462689bbfb23c9a9719b9aa246eeda076d9ef3db6bac64dd868927ef9e5d1ba247f1d8fc7866e0a18a7dd1b4846dee18712a93f858ec3f8311beb7'
        '16cd71894f0fa201fea1bb56f19a7fbfbf6fb793f80b14b3d07c2e226306e30efb142ad4b08e9d44fb43abff4386ce6f9b5798afbe9a6acb116fea96145de55d'
        '74bb9e4dbb14ec1e08d939c5c4ceee9467e92c71e575df3fa989b44b615e9959312145bef6ed86d0232e6e834b549b2f2861a3d84dda5a68072bca9eae1de278'
        'a2d78990749a8d4079a83733cbb6d2a1e087619740eb6c7c8df31bd53a2d43e85241beec530cea11548226d863fbafead69b2eedeef91149abec1e8199fd649a'
        '576340cce12df7a1494316758b4f8ff5424a50dae3119da4e25f55290785c84517fb43afeefe25748c1afd2a5beeef7a1d6d19d5dcdf5f2e6e24afb4a7e928a9')

prepare() {
  mv argparse.hpp "${pkgname}-cpp-${_commit}"/argparse
}

build() {
  cd "${pkgname}-cpp-${_commit}"
  make
}

package() {
  # binaries
  install -D -m755 "${srcdir}/${pkgname}-cpp-${_commit}/supersonic-scanner" \
    "${pkgdir}/usr/bin/supersonic-scanner"
  install -D -m755 "${srcdir}/${pkgname}-cpp-${_commit}/supersonic-server" \
    "${pkgdir}/usr/bin/supersonic-server"

  # readme
  install -Dm644 "${srcdir}/${pkgname}-cpp-${_commit}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # service
  install -D -m644 "${srcdir}/${pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -D -m644 "${srcdir}/${pkgname}.socket" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.socket"
}
