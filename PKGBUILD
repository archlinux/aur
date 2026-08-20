# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.4.23
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/Kilo-Org/kilocode'
arch=('aarch64' 'x86_64')
license=('MIT' 'LGPL-2.0-or-later')
provides=('kilo')
conflicts=('kilo')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-arm64.tar.gz")
sha256sums_aarch64=('1c5a5c62011cc953e6ec0fb7f34ef79c4bf55a85263002bf8340f97321d27c1f')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('160ee9d78bc8a9337d4bd92d4cd85f7f0c11162e350cb1bad779fce48a4dc36f')

package() {
  install -Dm755 ./kilo "${pkgdir}/usr/lib/kilo/kilo"
  install -Dm755 ./bwrap "${pkgdir}/usr/lib/kilo/bwrap"
  install -Dm644 ./kilo-sandbox-mutation-worker.js "${pkgdir}/usr/lib/kilo/kilo-sandbox-mutation-worker.js"
  install -dm755 "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/kilo/tree-sitter" "${pkgdir}/usr/share/licenses/kilo"
  cp -r ./tree-sitter/. "${pkgdir}/usr/lib/kilo/tree-sitter/"
  cp -r ./licenses/. "${pkgdir}/usr/share/licenses/kilo/"
  printf '%s\n' '#!/bin/sh' 'export KILO_TREE_SITTER_WASM_DIR=/usr/lib/kilo/tree-sitter' 'exec /usr/lib/kilo/kilo "$@"' > "${pkgdir}/usr/bin/kilo"
  chmod 755 "${pkgdir}/usr/bin/kilo"
}
