# Maintainer: William Harrell <wharrell1@protonmail.com>

pkgname=walksnail-osd-tool-git
pkgdesc="Tool for rendering OSDs over Walksnail DVR recordings"
pkgver=r222.1044026
pkgrel=1
arch=(x86_64)
url="https://github.com/avsaase/walksnail-osd-tool"
license=('GPL-3.0')
source=("$pkgname::git+https://github.com/avsaase/walksnail-osd-tool.git")
sha256sums=('SKIP')
depends=(
	'ffmpeg'
)
makedepends=(
	'cargo'
	'git'
	'gtk3'
)
options=('!lto')

pkgver() {
	cd "$srcdir/$pkgname"
	echo r$(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$srcdir/$pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$srcdir/$pkgname"
	cargo build --frozen --release --all-features
}

check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$srcdir/$pkgname"
	cargo test --frozen --all-features --workspace
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin" "target/release/walksnail-osd-tool"

	mkdir -p "$pkgdir/usr/share/applications"
	cat <<EOF > "$pkgdir/usr/share/applications/walksnail-osd-tool.desktop"
[Desktop Entry]
Name=Walksnail OSD Tool
Comment=Tool for rendering OSDs over Walksnail DVR recordings
Exec=walksnail-osd-tool
Icon=walksnail-osd-tool
Type=Application
Categories=AudioVideo;Video;
EOF
	mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps"
	cp "$srcdir/$pkgname/resources/icons/app-icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/walksnail-osd-tool.svg"
}

