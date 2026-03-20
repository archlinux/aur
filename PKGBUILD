# Maintainer: futpib <futpib@gmail.com>
pkgname=whitenoise-rs-git
pkgver=r669.6aff825
pkgrel=1
pkgdesc="wn — White Noise MLS/Nostr messaging CLI daemon"
arch=('x86_64')
url="https://github.com/marmot-protocol/whitenoise-rs"
license=('MIT')
makedepends=('git' 'rustup' 'pkgconf' 'openssl')
provides=('whitenoise-rs' 'wn' 'wnd')
conflicts=('whitenoise-rs')
options=('!lto')
source=("whitenoise-rs::git+https://github.com/marmot-protocol/whitenoise-rs.git")
sha256sums=('SKIP')

pkgver() {
	cd whitenoise-rs
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd whitenoise-rs
	# Ensure the toolchain specified in rust-toolchain.toml is available
	rustup show active-toolchain
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd whitenoise-rs
	cargo build --release --frozen --features cli --bin wn --bin wnd
}

package() {
	cd whitenoise-rs
	install -Dm755 target/release/wn   "$pkgdir/usr/bin/wn"
	install -Dm755 target/release/wnd  "$pkgdir/usr/bin/wnd"
	install -Dm644 LICENSE             "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
