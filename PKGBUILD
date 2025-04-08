# Maintainer: iff <iff@ik.me>
pkgname="pay-respects"
pkgver=0.7.2
pkgrel=1
pkgdesc="Command suggestions, command-not-found and thefuck replacement written in Rust (All modules)"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/iffse/pay-respects"
license=('AGPL-3.0-or-later ')
provides=('pay-respects')
install="$pkgname.install"
makedepends=('cargo' 'git')
optdepends=()
options=(!debug !lto)
source=($pkgname::git+https://github.com/iffse/pay-respects#tag=v$pkgver)

sha1sums=('55deb72821ab7ffeffb64f1cd660ef422fb1c165')

prepare() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export _DEF_PR_LIB=/usr/lib/pay-respects
	cargo build --release --workspace
}

package() {
	cd "$pkgname"
	install -Dm755 "target/release/pay-respects" "$pkgdir/usr/bin/pay-respects"
	install -Dm755 "target/release/_pay-respects-module-100-runtime-rules" "$pkgdir/usr/lib/pay-respects/_pay-respects-module-100-runtime-rules"
	install -Dm755 "target/release/_pay-respects-fallback-100-request-ai" "$pkgdir/usr/lib/pay-respects/_pay-respects-fallback-100-request-ai"

	install -Dm644  LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ft=sh
