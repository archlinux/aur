# Maintainer: kilo

pkgname='kilo-bin'
pkgver=7.4.15
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
sha256sums_aarch64=('59b013cfa8ddadea264e3510029a09a282d0ef6e988dea85a28ba59798a30602')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/Kilo-Org/kilocode/releases/download/v${pkgver}${_subver}/kilo-linux-x64.tar.gz")
sha256sums_x86_64=('d9c2ce0835efc1d8ba9de006b7e7cc7ae673a705076e1a58ed1c28d3f5210543')

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
