# Maintainer: Jaeho Cho <jaeho2025@gmail.com>
pkgname=reel-git
_pkgname=reel
pkgver=0.1.0
pkgrel=1
pkgdesc="Manage trip footage: ingest, review, cut, back up (Tauri desktop app)"
arch=('x86_64')
url="https://github.com/jaehho/reel"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'ffmpeg' 'rclone' 'gst-libav' 'gst-plugins-good')
makedepends=('git' 'rustup')
provides=('reel')
conflicts=('reel')
options=('!lto' '!debug')
source=("git+https://github.com/jaehho/reel.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	local desc
	if desc=$(git describe --long --tags --abbrev=7 2>/dev/null); then
		# tagged: v1.2.3-4-gabcdef -> 1.2.3.r4.gabcdef
		printf '%s' "$desc" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	else
		# no tags yet: 0.1.0.r<commits>.g<short>
		printf '0.1.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	fi
}

build() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	# Keep the volatile build path out of the binary (reproducible, no $srcdir leak).
	export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/"
	# Frontend is static and embedded by tauri-build at compile time, so a plain
	# cargo build produces a self-contained binary — no tauri-cli / npm needed.
	cargo build --release --locked -p reel-tauri
}

package() {
	cd "$_pkgname"
	install -Dm755 target/release/reel "$pkgdir/usr/bin/reel"
	install -Dm644 packaging/reel.desktop "$pkgdir/usr/share/applications/reel.desktop"
	install -Dm644 src-tauri/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/reel.png"
	install -Dm644 src-tauri/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/reel.png"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
