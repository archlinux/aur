# Maintainer: iff <iff@ik.me>
pkgname="pay-respects"
pkgver=0.6.3
pkgrel=2
pkgdesc="Command suggestions, command-not-found and thefuck replacement written in Rust (All modules)"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/iffse/pay-respects"
license=('AGPL-3.0-or-later ')
provides=('pay-respects')
install="$pkgname.install"
makedepends=('cargo' 'git' 'openssl')
optdepends=(
	'curl: AI requests'
)
source=($pkgname::git+https://github.com/iffse/pay-respects#tag=v$pkgver
	${pkgname}.sh
)

sha1sums=('22fbf46fcc7815d97d39bbf304200b8a5f30667f'
          '5c8fd4903ba5f047f18d79389b6178e4ce0a4a76')

prepare() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export _PR_LIB=/usr/lib/pay-respects
	cargo build --frozen --release --all-features
}

package() {
	install -Dm755 "${pkgname}.sh" "$pkgdir/usr/bin/${pkgname}"
	cd "$pkgname"
	install -Dm755 "target/release/pay-respects" "$pkgdir/opt/pay-respects/bin/pay-respects"
	install -Dm755 "target/release/_pay-respects-module-100-runtime-rules" "$pkgdir/usr/lib/pay-respects/_pay-respects-module-100-runtime-rules"
	install -Dm755 "target/release/_pay-respects-fallback-100-request-ai" "$pkgdir/usr/lib/pay-respects/_pay-respects-fallback-100-request-ai"

	install -Dm644  LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
