# Maintainer: William Harrell <wharrell1 at protonmail dot com>

pkgname=walksnail-osd-tool
pkgdesc="Tool for rendering OSDs over Walksnail DVR recordings"
pkgver=0.3.0
pkgrel=1
arch=(x86_64)
url="https://github.com/avsaase/walksnail-osd-tool"
license=('GPL-3.0')
# need to download with git because it's required for the build
source=("$pkgname::git+https://github.com/avsaase/walksnail-osd-tool.git")
# skip because the latest is fetched so can't verify
sha256sums=('SKIP')
depends=(
	'ffmpeg'
)
makedepends=(
	'cargo'
	'git'
	'gtk3'
)
# linking fails without disabling lto
options=('!lto')

prepare() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$srcdir/$pkgname"
	git checkout "v$pkgver"

	# bump poll-promise because 0.2.0 is broken
	#sed -i 's/poll-promise = "0.2.0"/poll-promise = "0.2.1"/' "$srcdir/$pkgname/Cargo.toml"

	# fix the bad parsing of the version number
	sed -i '251s/parse(s)/parse(\&s[1..])/' "$srcdir/$pkgname/ui/src/util.rs"

	cargo fetch --target "$CARCH-unknown-linux-gnu"
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

