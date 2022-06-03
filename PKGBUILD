# Maintainer: CaptainYukinoshitaHachiman <CaptainYukinoshitaHachiman at ProtonMail dot com>
pkgname=mellis
pkgver=0.3.6
pkgrel=1
pkgdesc="Official GUI wallet for Themelio"
arch=('x86_64' 'i686' 'aarch64')
url="https://themelio.org/"
license=('unknown')
depends=('melwalletd')
makedepends=('npm' 'cargo' 'git')
source=(
	"git+https://github.com/themeliolabs/mellis.git#tag=v$pkgver"
	"file://ginkou-loader-wrapper"
)
sha256sums=(
	'SKIP'	'c067389bd0331916456c40f7806e7b1203b44edeb57ec3e4c7667badea2b2e05'
)

prepare() {
	cd "$pkgname"
	git submodule init
	git submodule update

	cd "ginkou-loader"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname"

	# build web assets
	cd "ginkou"
	rm package-lock.json
	npm i
	npm run build

	# build loader
	cd "../ginkou-loader"
	export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
	install -Dm755 "ginkou-loader-wrapper" "$pkgdir/usr/bin/ginkou-loader-wrapper"
	cd "$pkgname"
	install -dm755 "$pkgdir/usr/share/mellis"
	cp -r "ginkou/public" -t "$pkgdir/usr/share/mellis"
	install -Dm755 "ginkou-loader/target/release/ginkou-loader" "$pkgdir/usr/bin/ginkou-loader"
	install -D "flatpak/icons/org.themelio.Wallet.desktop" "$pkgdir/usr/share/applications/org.themelio.Wallet.desktop"
	rm "flatpak/icons/org.themelio.Wallet.desktop"
	cp -r "flatpak/icons/" "$pkgdir/usr/share/hicolor"
}
