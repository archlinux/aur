# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=asus-hub
pkgname="$_pkgbase"
pkgver=1.0.1
pkgrel=3
pkgdesc='The unofficial MyAsus alternative for Linux'
arch=('x86_64')
url='https://github.com/Traciges/Asus-Hub'
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita')
optdepends=('libkscreen: OLED flicker-free dimming'
						'qt6-tools: KWin and KDE integration'
						'kconfig: OLED Pixel Refresh in KDE'
						'iio-sensor-proxy: Ambient light sensor for auto backlight'
						'swayidle: Keyboard backlight idle timer'
						'asusctl: Battery care, fan profiles, FN key mod'
						'wireplumber: Volume control & boost'
						'easyeffects: Audio sound profiles'
						'glib2: Touchpad toggle on GNOME')
makedepends=('git' 'cargo')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("$_pkgbase::git+https://github.com/Traciges/Asus-Hub.git#tag=v$pkgver")
sha256sums=('944a96ad97cb071e50afd140558eb3ac40af494a4b503719654c02ffa49c531b')

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
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "packaging/de.guido.asus-hub.desktop"
	install -Dm0644 -T "assets/trayicon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/de.guido.asus-hub.png"
	install -Dm0644 -t "$pkgdir/usr/share/metainfo/" "packaging/de.guido.asus-hub.metainfo.xml"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$_pkgbase/" LICENSE
}
