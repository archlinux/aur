# Maintainer: futpib-bot <futpib-bot@users.noreply.github.com>
pkgname=claugrep-git
pkgver=r2.142d77a
pkgrel=1
pkgdesc='Browse, search, and export Claude Code conversation transcripts'
arch=('x86_64' 'aarch64')
url='https://github.com/futpib-bot/claugrep'
license=('MIT')
makedepends=('rust' 'cargo')
provides=('claugrep')
conflicts=('claugrep')
source=("$pkgname::git+https://github.com/futpib-bot/claugrep.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --locked
}

package() {
	cd "$pkgname"
	install -Dm755 "target/release/claugrep" "$pkgdir/usr/bin/claugrep"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
