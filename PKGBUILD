# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=ayuz
pkgname="$_pkgbase"
pkgver=1.1.8
pkgrel=1
pkgdesc='The unofficial MyAsus alternative for Linux'
arch=('x86_64')
url='https://github.com/Traciges/Ayuz'
license=('GPL-3.0-or-later')
depends=('gtk4' 'gtk4-layer-shell' 'libadwaita')
optdepends=('libkscreen: OLED flicker-free dimming'
						'qt6-tools: KWin and KDE integration'
						'kconfig: OLED Pixel Refresh in KDE'
						'iio-sensor-proxy: Ambient light sensor for auto backlight'
						'swayidle: Keyboard backlight idle timer'
						'asusctl: Battery care, fan profiles, FN key mod'
						'supergfxctl: GPU mode switching'
						'wireplumber: Volume control & boost'
						'easyeffects: Audio sound profiles'
						'brightnessctl: Smart Gestures'
						'playerctl: Media playback control'
						'glib2: Touchpad toggle on GNOME')
makedepends=('git' 'cargo')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
replaces=('asus-hub')
source=("$_pkgbase::git+https://github.com/Traciges/Ayuz.git#tag=v$pkgver")
sha256sums=('c544e94253fbe734c4d66dcd0527cd1f8571190b45728dd73233ef0089bc1b28')

prepare() {
	cd "$_pkgbase"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target host-tuple
}

build() {
	cd "$_pkgbase"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd "$_pkgbase"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgbase"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "packaging/de.guido.ayuz.desktop"
	install -Dm0644 -T "assets/trayicon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/de.guido.ayuz.png"
	install -Dm0644 -t "$pkgdir/usr/share/metainfo/" "packaging/de.guido.ayuz.metainfo.xml"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$_pkgbase/" LICENSE
}
