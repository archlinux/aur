# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=leafish-git
pkgver=r90.de2d569
pkgrel=1
pkgdesc="Multi-version Minecraft-compatible client written in Rust."
arch=('x86_64')
url="https://github.com/terrarier2111/leafish"
license=('APACHE')
groups=()
depends=('libxcb' 'openssl')
makedepends=('cargo' 'git')
checkdepends=()
optdepends=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --tags --long 2>/dev/null | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "$srcdir/$pkgname"

	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$pkgname"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$pkgname"

	install -Dm0755 "target/release/${pkgname%-git}" -t "$pkgdir/usr/bin"
}
