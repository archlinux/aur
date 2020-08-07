# Maintainer: Stelios Tsampas <loathingkernel @at gmail .dot com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: xduugu
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Vesa Kaihlavirta

pkgname=awesome-luajit
pkgver=4.3
pkgrel=2
pkgdesc='Highly configurable framework window manager'
url='https://awesomewm.org/'
arch=('x86_64')
license=('GPL2')
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'imlib2' 'libxdg-basedir' 'luajit' 'luajit-lgi' 'pango'
         'startup-notification' 'xcb-util-cursor' 'xcb-util-keysyms' 'xcb-util-wm'
         'xorg-xmessage' 'libxkbcommon-x11' 'libxkbcommon' 'xcb-util-xrm')
makedepends=('asciidoc' 'cmake' 'docbook-xsl' 'doxygen' 'imagemagick' 'ldoc' 'xmlto' 'ttf-font')
optdepends=('rlwrap: readline support for awesome-client'
            'dex: autostart your desktop files'
            'vicious: widgets for the Awesome window manager')
provides=('awesome' 'notification-daemon')
conflicts=('awesome')
backup=('etc/xdg/awesome/rc.lua')
source=(https://github.com/awesomeWM/awesome/releases/download/v${pkgver}/awesome-${pkgver}.tar.xz{,.asc})
sha512sums=('c5ef1e8dc593e7783b895d22143154aea8f211beeda24672a7ee4ed5112b4f4284043f848a151f3d3c4f569e91308670367a4353f705b20511b36495b22fa3f5'
            'SKIP')
validpgpkeys=('2BB32F88FF3D1E76E682303F22E428EBCB8FCB06') # Uli Schlachter <psychon@znc.in>

prepare() {
  cd awesome-${pkgver}
  sed -i 's/COMMAND lua /COMMAND luajit /' awesomeConfig.cmake
  sed -i 's| lua | luajit |;s/lua)/luajit)/' tests/examples/CMakeLists.txt
  sed -i '1s|/usr/bin/env lua$|/usr/bin/env luajit|' build-utils/check_for_invalid_requires.lua
  sed -i 's/"lua"/"luajit"/' tests/test-spawn.lua
  mkdir -p build
}

build() {
  cd awesome-${pkgver}/build
  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  cmake .. \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSYSCONFDIR=/etc \
    -DLUA_INCLUDE_DIR=/usr/include/luajit-2.0 \
    -DLUA_LIBRARY=/usr/lib/libluajit-5.1.so
  make
}

package() {
  cd awesome-${pkgver}
  make -C build DESTDIR="${pkgdir}" install
  install -Dm 644 awesome.desktop -t "${pkgdir}/usr/share/xsessions"
}

# vim: ts=2 sw=2 et:
