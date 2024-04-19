# Maintainer: éclairevoyant

pkgname=yambar
pkgver=1.11.0
pkgrel=1
pkgdesc='Modular status panel for X11 and Wayland, inspired by polybar'
arch=(x86_64)
url="https://codeberg.org/dnkl/$pkgname"
license=(MIT)
depends=(fcft libpulse libudev.so libxcb libyaml libpipewire-0.3.so pipewire pixman
         wayland wayland-protocols xcb-util xcb-util-cursor xcb-util-wm)
optdepends=('alsa-lib: ALSA module'
            'json-c: XKB module'
            'libmpdclient: MPD module'
            'xcb-util-errors: better X error messages')
makedepends=(git meson scdoc tllist xorgproto)
source=("git+$url.git?signed#commit=a2d30b96fbb026621ec11692272f0117f35a00fd")
b2sums=('SKIP')
validpgpkeys=('B19964FBBA09664CC81027ED5BBD4992C116573F') # Daniel Eklöf (Git signing) <daniel@ekloef.se>

prepare() {
	mkdir build
}

build() {
	cd build
	meson ../$pkgname \
		--buildtype=release \
		--prefix=/usr \
		--wrap-mode=nofallback \
		-Db_lto=true \
		-Dbackend-x11=enabled \
		-Dbackend-wayland=enabled
	ninja
}

package() {
	cd build
	DESTDIR="$pkgdir" ninja install

	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s '/usr/share/doc/yambar/LICENSE' "$pkgdir/usr/share/licenses/$pkgname/"
}
