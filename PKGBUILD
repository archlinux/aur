# Maintainer: coffeeowl-labs <noreply@coffeeowl-labs>
pkgname=keyd-viz
pkgver=1.2.0
pkgrel=1
pkgdesc="The visual face of keyd: a native GUI of your keyboard layout with live layers and keypress glow"
arch=('x86_64')
url="https://github.com/coffeeowl-labs/keyd-viz"
license=('MIT')
depends=('keyd' 'systemd-libs' 'fontconfig' 'libxkbcommon' 'libxcb' 'libglvnd' 'wayland')
makedepends=('cargo')
options=('!lto' '!debug')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# On each version bump: re-run `updpkgsums` then `makepkg --printsrcinfo > .SRCINFO`
# (after the matching GitHub release tag exists, so the tarball is downloadable).
sha256sums=('72f1442a62cce4dc35f3c919f1db512ce361cb0c6895d85e44198528db04a59f')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release -p keydviz -p keydviz-helper
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --release --workspace
}

package() {
	cd "$pkgname-$pkgver"

	# binaries: the GUI and the broker daemon
	install -Dm755 target/release/keydviz "$pkgdir/usr/bin/keydviz"
	install -Dm755 target/release/keydviz-helperd "$pkgdir/usr/bin/keydviz-helperd"

	# broker service + dedicated system user (sysusers/systemd alpm hooks pick these up)
	install -Dm644 packaging/systemd/keydviz-helperd.service \
		"$pkgdir/usr/lib/systemd/system/keydviz-helperd.service"
	install -Dm644 packaging/sysusers.d/keyd-viz.conf \
		"$pkgdir/usr/lib/sysusers.d/keyd-viz.conf"
	# keypress glow is opt-in (reads /dev/input); ship the drop-in as a sample, not active
	install -Dm644 packaging/systemd/keydviz-helperd.service.d/keypresses.conf \
		"$pkgdir/usr/share/keyd-viz/keypresses.conf.sample"

	# desktop integration
	install -Dm644 packaging/keyd-viz.desktop \
		"$pkgdir/usr/share/applications/keyd-viz.desktop"
	install -Dm644 assets/keyd-viz.svg \
		"$pkgdir/usr/share/icons/hicolor/scalable/apps/keyd-viz.svg"

	# license + docs
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
