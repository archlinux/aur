# Maintainer: OpenDeck CachyOS maintainers

pkgname=opendeck-cachyos-git
_pkgname=OpenDeck
pkgver=2.12.0.r0.g87dbb51
pkgrel=1
pkgdesc="OpenDeck with Stream Deck profile/action import integration"
arch=("x86_64" "aarch64")
url="https://github.com/myanceyiii/LinuxDeck"
license=("GPL-3.0-or-later")
depends=(
	"cairo"
	"desktop-file-utils"
	"gdk-pixbuf2"
	"glib2"
	"gtk3"
	"hicolor-icon-theme"
	"hidapi"
	"libayatana-appindicator"
	"librsvg"
	"openssl"
	"shared-mime-info"
	"systemd-libs"
	"webkit2gtk-4.1"
)
makedepends=("cargo" "clang" "deno" "git" "nodejs" "pkgconf")
optdepends=(
	"nodejs: run JavaScript Stream Deck plugins"
	"wine: run Windows Stream Deck plugins"
)
provides=("opendeck")
conflicts=("opendeck")
install="${pkgname}.install"
source=("${pkgname}::git+https://github.com/myanceyiii/LinuxDeck.git")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags --long --always | sed "s/^v//;s/-/.r/;s/-/./g"
}

prepare() {
	cd "$srcdir/$pkgname"
	deno install --allow-scripts
}

build() {
	cd "$srcdir/$pkgname"
	deno task build
	cargo build --manifest-path src-tauri/Cargo.toml --release --locked --features custom-protocol

	local _target
	case "$CARCH" in
		x86_64)  _target="x86_64-unknown-linux-gnu" ;;
		aarch64) _target="aarch64-unknown-linux-gnu" ;;
	esac
	pushd plugins/com.amansprojects.starterpack.sdPlugin
	deno run --allow-all build.ts \
		"../../src-tauri/target/plugins/com.amansprojects.starterpack.sdPlugin" \
		"$_target"
	popd
}

package() {
	cd "$srcdir/$pkgname"

	install -Dm755 src-tauri/target/release/opendeck "$pkgdir/usr/bin/opendeck"
	install -Dm644 src-tauri/icons/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/opendeck.png"
	install -Dm644 src-tauri/bundle/opendeck.metainfo.xml "$pkgdir/usr/share/metainfo/opendeck.metainfo.xml"
	install -Dm644 src-tauri/bundle/40-streamdeck.rules "$pkgdir/etc/udev/rules.d/40-streamdeck.rules"
	install -Dm644 src-tauri/bundle/opendeck-streamdeck-import.xml "$pkgdir/usr/share/mime/packages/opendeck-streamdeck-import.xml"

	install -Dm644 src-tauri/bundle/opendeck.desktop "$pkgdir/usr/share/applications/opendeck.desktop"
	sed -i \
		-e "s|{{exec}}|opendeck|g" \
		-e "s|{{icon}}|opendeck|g" \
		-e "s|{{comment}}|Use stream controllers|g" \
		-e "s|{{categories}}|Utility;AudioVideo;|g" \
		"$pkgdir/usr/share/applications/opendeck.desktop"

	if [ -d src-tauri/target/plugins ]; then
		install -d "$pkgdir/usr/lib/opendeck/resources/plugins"
		cp -a src-tauri/target/plugins/. "$pkgdir/usr/lib/opendeck/resources/plugins/"
	fi
}
