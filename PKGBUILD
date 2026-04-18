# Maintainer: futpib <futpib@gmail.com>
pkgname=whitenoise-rs-git
pkgver=r716.2e95b1f
pkgrel=1
pkgdesc="wn — White Noise MLS/Nostr messaging CLI daemon"
arch=('x86_64')
url="https://github.com/marmot-protocol/whitenoise-rs"
license=('MIT')
makedepends=('git' 'rustup' 'pkgconf' 'openssl')
provides=('whitenoise-rs' 'wn' 'wnd')
conflicts=('whitenoise-rs')
options=('!lto')
source=(
	"whitenoise-rs::git+https://github.com/marmot-protocol/whitenoise-rs.git"
	"file-store.patch"
)
sha256sums=(
	'SKIP'
	'c76b397f291f36f50e01d8b75a96ac710b046986ead9d49ebfc6548fc401c150'
)

pkgver() {
	cd whitenoise-rs
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd whitenoise-rs
	# Ensure the toolchain specified in rust-toolchain.toml is available
	rustup show active-toolchain
	# Make prepare() idempotent — makepkg's git reset doesn't touch untracked
	# files, so artifacts of a prior patch application would conflict on
	# rebuild.
	rm -f Cargo.toml.orig src/whitenoise/mod.rs.orig src/whitenoise/file_store.rs
	# Fetch against the pristine lockfile so --locked is satisfied, THEN
	# apply the patch.  The build step runs offline and lets cargo resolve
	# the orphaned linux-keyutils lock entries locally.
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	# Swap the session-scoped linux-keyutils credential store for a plain
	# 0600 file-based store so that `wnd` credentials survive reboot without
	# touching keyutils, gnome-keyring, or D-Bus.
	patch -p0 < "$srcdir/file-store.patch"
}

build() {
	cd whitenoise-rs
	cargo build --release --offline --features cli --bin wn --bin wnd
}

package() {
	cd whitenoise-rs
	install -Dm755 target/release/wn   "$pkgdir/usr/bin/wn"
	install -Dm755 target/release/wnd  "$pkgdir/usr/bin/wnd"
	install -Dm644 LICENSE             "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
