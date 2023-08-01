# Maintainer: Stephen Power <simpilldev@gmail.com>

pkgname=ubiquity
pkgver=0.4.0
pkgrel=4
pkgdesc="An open-source, cross-platform markdown editor written in Rust using Tauri, Yew, Tailwind and DaisyUI."
arch=('x86_64')
url="https://github.com/opensourcecheemsburgers/ubiquity"
license=('GPL3')
depends=('webkit2gtk' 'libayatana-appindicator')
makedepends=('npm' 'rustup' 'pkgconf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
"${pkgname}.desktop::https://raw.githubusercontent.com/opensourcecheemsburgers/${pkgname}/master/${pkgname}.desktop"
)
sha256sums=(
'cdbb3435eb5082594511a95577b0252e2366eaaeaa1565b4e01a001b45d30ad6'	'80294b66c744e6da117d431a80f6332fde89b7bdc7b33442c6e76e8b76c5b94d'
)

build(){
	cd $srcdir/${pkgname}-${pkgver}
	rustup update nightly-2023-07-07-x86_64-unknown-linux-gnu
	rustup component add rust-src --toolchain nightly-2023-07-07-x86_64-unknown-linux-gnu
    cargo install trunk
    cargo install tauri-cli
    rustup target add wasm32-unknown-unknown
    cd frontend
    npm install
    npx tailwindcss -i ./css/input.css -o ./css/output.css --minify
	cd ..
	cargo tauri build -b none --target x86_64-unknown-linux-gnu -- -Z build-std=std,panic_abort -Z build-std-features=panic_immediate_abort
}
package(){
	cd $srcdir/${pkgname}-${pkgver}
	install -Dm755 target/x86_64-unknown-linux-gnu/release/${pkgname} -t ${pkgdir}/usr/bin
	install -Dm644 src-tauri/icons/icon.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg
	install -Dm644 ${srcdir}/${pkgname}.desktop -t ${pkgdir}/usr/share/applications
}
