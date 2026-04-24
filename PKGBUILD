# Maintainer: iff <iff@ik.me>
pkgname="pay-respects"
pkgver=0.8.7
pkgrel=1
pkgdesc="Command suggestions, command-not-found and thefuck replacement written in Rust (All modules)"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/iffse/pay-respects"
license=('AGPL-3.0-or-later ')
provides=('pay-respects')
install="$pkgname.install"
makedepends=('cargo' 'git')
optdepends=(
	'tmux: tmux integration'
	'screen: screen integration'
	'zellij: zellij integration'
	'wezterm: wezterm integration'
	'kitty: kitty integration'
	'zoxide: zoxide integration')
source=($pkgname::git+https://github.com/iffse/pay-respects#tag=v$pkgver)

sha1sums=('99568d4643efd01451ef3b546a0167d5abd4af5c')

prepare() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export CFLAGS+=" -ffat-lto-objects"
	export _DEF_PR_LIB=/usr/lib/pay-respects
	export _DEF_PR_PACKAGE_MANAGER=pacman
	cargo build --frozen --release --workspace
}

package() {
	cd "$pkgname"
	install -Dm755 "target/release/pay-respects" "$pkgdir/usr/bin/pay-respects"
	install -Dm755 "target/release/_pay-respects-module-100-runtime-rules" "$pkgdir/usr/lib/pay-respects/_pay-respects-module-100-runtime-rules"
	install -Dm755 "target/release/_pay-respects-fallback-100-request-ai" "$pkgdir/usr/lib/pay-respects/_pay-respects-fallback-100-request-ai"

	install -Dm644 "man/pay-respects.1" "$pkgdir/usr/share/man/man1/pay-respects.1"
	install -Dm644 "man/pay-respects-rules.5" "$pkgdir/usr/share/man/man5/pay-respects-rules.5"
	install -Dm644 "man/pay-respects-modules.5" "$pkgdir/usr/share/man/man5/pay-respects-modules.5"

	# install -Dm644  LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ft=sh
