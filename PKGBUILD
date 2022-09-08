# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

_commit='dc7b4b68eaab6774e67f40960b4d277348ab080b'
pkgname=supersonic
pkgver=2022.09.05
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
b2sums=('e6c4f336daf74ddf6e56ab983b4d76614de4b0d9e4ad7f9ef91944b5717e521e419e6b6a3810112860a10ccf3ab74b5697b1c871d703bc6623783684b3e799e6'
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
