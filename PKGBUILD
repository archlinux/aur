# Maintainer: Stelios Tsampas <loathingkernel @at gmail .dot com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: xduugu
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Vesa Kaihlavirta

pkgname=awesome-luajit
pkgver=4.2
pkgrel=1
pkgdesc='Highly configurable framework window manager'
url='https://awesomewm.org/'
arch=('x86_64')
license=('GPL2')
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'imlib2' 'libxdg-basedir' 'luajit' 'luajit-lgi' 'pango'
         'startup-notification' 'xcb-util-cursor' 'xcb-util-keysyms' 'xcb-util-wm'
         'xorg-xmessage' 'libxkbcommon-x11' 'libxkbcommon' 'xcb-util-xrm')
makedepends=('asciidoc' 'cmake' 'docbook-xsl' 'doxygen' 'imagemagick' 'ldoc' 'xmlto')
optdepends=('rlwrap: readline support for awesome-client'
            'dex: autostart your desktop files'
            'vicious: widgets for the Awesome window manager')
provides=('awesome' 'notification-daemon')
conflicts=('awesome')
backup=('etc/xdg/awesome/rc.lua')
source=(https://github.com/awesomeWM/awesome/releases/download/v${pkgver}/awesome-${pkgver}.tar.xz{,.asc})
sha512sums=('134dd3625c86243861b3d0701cc8bfd8c00986d7027f0832016c3f5e59e6b9a1ef2f677bb0d1d66ece63449533e4b13d8d7388e96e6f9014212030a79f163e09'
            'SKIP')
validpgpkeys=('2BB32F88FF3D1E76E682303F22E428EBCB8FCB06') # Uli Schlachter <psychon@znc.in>

prepare() {
  cd awesome-${pkgver}
  sed -i 's/COMMAND lua\b/COMMAND luajit/' awesomeConfig.cmake tests/examples/CMakeLists.txt
  sed -i 's/LUA_COV_RUNNER lua\b/LUA_COV_RUNNER luajit/' tests/examples/CMakeLists.txt
  mkdir -p build
}

build() {
  cd awesome-${pkgver}/build
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
