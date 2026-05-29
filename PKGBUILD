# Maintainer: Carlos <prietus@live.com>
pkgname=jelly-git
_pkgname=jelly
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="Native Jellyfin desktop client with bit-perfect audio and HDR/Dolby Vision video (Slint + libmpv)"
arch=('x86_64')
url="https://github.com/prietus/jlfine"
license=('MIT')
# Runtime libraries the binary loads (libmpv, ALSA, D-Bus for the
# keyring, fontconfig + xkbcommon + GL + wayland for the Slint UI).
# Verify/trim with `namcap` against the built package.
depends=('mpv' 'alsa-lib' 'dbus' 'fontconfig' 'libxkbcommon' 'libglvnd' 'wayland')
makedepends=('cargo' 'git')
provides=('jelly')
conflicts=('jelly')
source=("$_pkgname::git+https://github.com/prietus/jlfine.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release -p jelly
}

package() {
	install -Dm755 "$_pkgname/target/release/jelly" "$pkgdir/usr/bin/jelly"
	install -Dm644 "$_pkgname/crates/jelly-ui/ui/icon.png" "$pkgdir/usr/share/pixmaps/jelly.png"
	install -Dm644 "$_pkgname/packaging/jelly.desktop" "$pkgdir/usr/share/applications/jelly.desktop"
	install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
