# Maintainer: ghesy <ehsan at disroot dot org>

pkgname=luastatus-git
pkgver=r773.8d01bdf
pkgrel=2
pkgdesc='universal status bar content generator - git version'
url='https://github.com/shdown/luastatus'
arch=('x86_64')
license=('LGPL3')
provides=('luastatus')
conflicts=('luastatus')
depends=('lua<5.5')
makedepends=(
	'git'
	'cmake'
	'pkg-config'
	'python-docutils'
	'libxcb>=1.10'
	'yajl>=2.0.4'
	'alsa-lib>=1.0.27.2'
	'libpulse>=4.0'
	'libudev.so'
	'libnl>=3.0'
	'glib2>=2.40.2'
	'libx11>=1.6.2'
	'xcb-util>=0.3.8'
	'xcb-util-wm>=0.4.1'
)
optdepends=(
	"luastatus-meta: provides all luastatus dependencies"
	"libxcb>=1.10: for barlib 'dwm' and plugin 'xtitle'"
	"yajl>=2.0.4: for barlib 'i3'"
	"alsa-lib>=1.0.27.2: for plugin 'alsa'"
	"libpulse>=4.0: for plugin 'pulse'"
	"libudev.so: for plugin 'battery-linux', 'backlight-linux' and 'udev'"
	"libnl>=3.0: for plugin 'network'"
	"glib2>=2.40.2: for plugin 'dbus'"
	"libx11>=1.6.2: for plugin 'xkb'"
	"xcb-util>=0.3.8: for plugin 'xtitle'"
	"xcb-util-wm>=0.4.1: for plugin 'xtitle'"
)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd 'luastatus'
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd 'luastatus'
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib \
		-DWITH_LUA_LIBRARY=lua-5.4 -DBUILD_PLUGIN_PULSE=ON \
		-DBUILD_PLUGIN_UNIXSOCK=ON .
	make
}

package() {
	cd 'luastatus'
	make DESTDIR="$pkgdir" install
	install -dm755 "$pkgdir/usr/share/doc/luastatus/"
	install -Dm644 'DOCS/MIGRATION_GUIDE.md' -t "$pkgdir/usr/share/doc/luastatus/" ||:
	cp -r 'examples' -t "$pkgdir/usr/share/doc/luastatus/" ||:
}

# vim:noexpandtab
