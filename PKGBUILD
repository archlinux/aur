# Maintainer: Stelios Tsampas <loathingkernel @at gmail .dot com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: xduugu
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Vesa Kaihlavirta

pkgname=awesome-luajit
pkgver=4.3
pkgrel=3
pkgdesc='Highly configurable framework window manager'
url='https://awesomewm.org'
arch=(x86_64)
license=(GPL2)
depends=(cairo
         dbus
         gdk-pixbuf2
         imlib2
         libxdg-basedir
         libxkbcommon
         libxkbcommon-x11
         luajit
         luajit-lgi
         pango
         startup-notification
         xcb-util-cursor
         xcb-util-keysyms
         xcb-util-wm
         xcb-util-xrm
         xorg-xmessage)
makedepends=(asciidoctor
             cmake
             docbook-xsl
             doxygen
             imagemagick
             ldoc
             ttf-font
             xmlto)
optdepends=('rlwrap: readline support for awesome-client'
            'dex: autostart your desktop files'
            'vicious: widgets for the Awesome window manager')
provides=(notification-daemon awesome)
conflicts=(awesome)
backup=('etc/xdg/awesome/rc.lua')
_archive="awesome-$pkgver"
source=("https://github.com/awesomeWM/awesome/releases/download/v$pkgver/$_archive.tar.xz"{,.asc})
sha512sums=('c5ef1e8dc593e7783b895d22143154aea8f211beeda24672a7ee4ed5112b4f4284043f848a151f3d3c4f569e91308670367a4353f705b20511b36495b22fa3f5'
            'SKIP')
validpgpkeys=('2BB32F88FF3D1E76E682303F22E428EBCB8FCB06') # Uli Schlachter <psychon@znc.in>

prepare() {
	cd "$_archive"
	sed -i 's/COMMAND lua /COMMAND luajit /' awesomeConfig.cmake
	sed -i 's| lua | luajit |;s/lua)/luajit)/' tests/examples/CMakeLists.txt
	sed -i '1s|/usr/bin/env lua$|/usr/bin/env luajit|' build-utils/check_for_invalid_requires.lua
	sed -i 's/"lua"/"luajit"/' tests/test-spawn.lua
}

build() {
	cd "$_archive"
	CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
	cmake -B build \
		-DCMAKE_BUILD_TYPE=RELEASE \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DSYSCONFDIR=/etc \
		-DLUA_LIBRARY=/usr/lib/libluajit-5.1.so \
		-DLUA_INCLUDE_DIR=/usr/include/luajit-2.0
	make -C build
}

package() {
	cd "$_archive"
	make -C build DESTDIR="$pkgdir" install
	install -Dm0644 -t "$pkgdir/usr/share/xsessions/" awesome.desktop
}
