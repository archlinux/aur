# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=leafish-git
pkgver=r207.b3b467c
pkgrel=1
pkgdesc="Multi-version Minecraft-compatible client written in Rust."
arch=('x86_64')
url="https://github.com/Lea-fish/Leafish"
license=('APACHE')
groups=()
depends=('libxcb' 'openssl')
makedepends=('cargo' 'git' 'desktop-file-utils')
checkdepends=()
optdepends=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("$pkgname::git+$url.git" "leafish.desktop")
sha256sums=(
	'SKIP'
	'c9de3b7a74ba7ec863809d23dc61f44e744eddb98ba66f2c0f946081215dfd91'
)

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --tags --long 2>/dev/null | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "$srcdir/$pkgname"

	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$pkgname"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications/" "leafish.desktop"

	cd "$srcdir/$pkgname"

	install -Dm755 "target/release/${pkgname%-git}" -t "$pkgdir/usr/bin"
	install -Dm644 "resources/assets/leafish/logo/leafish-logo.svg" -t "$pkgdir/usr/share/pixmaps"
}
