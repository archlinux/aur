# Maintainer: Koen Hendriks <info@koenhendriks.nl>

pkgname=claude-sessions
pkgver=0.1.2
pkgrel=1
pkgdesc="Fuzzy finder for every Claude Code session on this machine, continues the one you pick"
arch=('x86_64')
url="https://github.com/koenhendriks/claude-sessions"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=('claude-code: the Claude Code CLI that sessions are opened with')
_src="$pkgname-$pkgver"
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('b2072bf6fbdfd5fcc568d92150e390223beae77726c9c9f540f465865cb94937')

prepare() {
	cd "$_src"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_src"
	export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "$_src"
	export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
	cargo test --frozen
}

package() {
	cd "$_src"
	# tools/aur-pkgbuild.sh --bin points this at the binary in the release's binary tarball.
	local bin="target/release/claude-sessions"
	install -Dm755 "$bin" "$pkgdir/usr/bin/claude-sessions"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/claude-sessions/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/claude-sessions/README.md"
}
