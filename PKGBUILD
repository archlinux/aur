# Maintainer: Ruben De Smet <me at rubdos dot be>

pkgname='allium-tools'
pkgver="3.5.3"
pkgrel=2
pkgdesc='LLM-native language for specifying what systems should do'
url='https://github.com/juxt/allium-tools'
license=(
 'LGPL3+'
 'CC0'
)
source=(
 "https://github.com/juxt/allium-tools/archive/refs/tags/v${pkgver}.tar.gz"
)
provides=(
 "allium"
 "allium-lsp"
)
sha512sums=('a8294550f8dff4310366bf26b1558d6863f7a9a14cdaa754f32fc6134b9c70d38fab27a34f168907e52437fb6f40e7178b3a701085f6a4799813240c164b100c')
arch=(
 'x86_64'
 'i686'
)
depends=(
 'glibc'
 'gcc-libs'
 'nodejs'
)
makedepends=(
 'rust'
 'cargo'
 'rust-wasm'
 'wasm-pack'
 'binaryen'
 'npm'
)

build() {
 pushd "${pkgname}-${pkgver}"
 cargo build --release

 wasm-pack build crates/allium-wasm --target nodejs --out-dir ../../packages/allium-parser-wasm
 node -e "const p=require('./packages/allium-parser-wasm/package.json');p.name='allium-parser-wasm';p.scripts={build:'echo ok',test:'echo ok',lint:'echo ok'};require('fs').writeFileSync('./packages/allium-parser-wasm/package.json',JSON.stringify(p,null,2)+'\n')"
 npm ci
 npm run --workspace packages/allium-lsp build
 popd
}

package() {
 mkdir -p $pkgdir/usr/bin/
 install "${srcdir}/${pkgname}-${pkgver}/target/release/allium" "$pkgdir/usr/bin/"

 # allium-lsp resolves the wasm parser as a sibling of its own realpath, so the
 # three files move together and /usr/bin gets a symlink rather than a copy.
 install -Dm755 "${srcdir}/${pkgname}-${pkgver}/packages/allium-lsp/dist/bin.js" "$pkgdir/usr/lib/allium-lsp/allium-lsp"
 install -Dm644 "${srcdir}/${pkgname}-${pkgver}/packages/allium-lsp/dist/allium_wasm.js" "$pkgdir/usr/lib/allium-lsp/allium_wasm.js"
 install -Dm644 "${srcdir}/${pkgname}-${pkgver}/packages/allium-lsp/dist/allium_wasm_bg.wasm" "$pkgdir/usr/lib/allium-lsp/allium_wasm_bg.wasm"
 ln -s /usr/lib/allium-lsp/allium-lsp "$pkgdir/usr/bin/allium-lsp"
}
