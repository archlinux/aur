# Maintainer: Stephen Power <simpilldev@gmail.com>

pkgbase=ubiquity
pkgname=ubiquity-git
pkgver=0.3.0
pkgrel=3
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
	'599705cf58c494e655c26cff8c25594f67310daea4095eea5348d6f3d21d95fc'
	'80294b66c744e6da117d431a80f6332fde89b7bdc7b33442c6e76e8b76c5b94d'
)

build(){
	cd $srcdir/${pkgname}-${pkgver}
	rustup install nightly-2023-07-07
	rustup component add rust-src --toolchain nightly-2023-07-07-x86_64-unknown-linux-gnu
    cargo install trunk
    cargo install tauri-cli
    rustup target add wasm32-unknown-unknown
    cd frontend
    npm install
	cd ..
	cargo tauri build -b none --target x86_64-unknown-linux-gnu -- -Z build-std=std,panic_abort -Z build-std-features=panic_immediate_abort
}
package(){
	cd $srcdir/${pkgname}-${pkgver}
	install -Dm755 target/x86_64-unknown-linux-gnu/release/${pkgname} -t ${pkgdir}/usr/bin
	install -Dm644 src-tauri/icons/icon.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg
	install -Dm644 ${srcdir}/${pkgname}.desktop -t ${pkgdir}/usr/share/applications
}

