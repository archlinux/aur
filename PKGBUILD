# Maintainer: Daniel Hahler <archlinux+aur@thequod.de>
# Contributor: noonov <noonov@gmail.com>
# Contributor: wtchappell <wtchappell@gmail.com>

_pkgname=awesome
pkgname=awesome-luajit-git
pkgver=3.5.2.2180.g5aa4a16
pkgrel=2
pkgdesc="awesome window manager built with luajit"
arch=('i686' 'x86_64')
url='http://awesome.naquadah.org/'
license=('GPL2')
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'imlib2' 'libxdg-basedir' 'libxkbcommon-x11'
         'luajit' 'luajit-lgi' 'pango' 'startup-notification' 'xcb-util-cursor'
         'xcb-util-keysyms' 'xcb-util-wm' 'xorg-xmessage')
makedepends=('asciidoc' 'cmake' 'docbook-xsl' 'doxygen' 'imagemagick' 'ldoc' 'xmlto')
optdepends=('rlwrap: readline support for awesome-client'
            'dex: autostart your desktop files'
            'vicious: widgets for the Awesome window manager')
provides=('notification-daemon' 'awesome')
conflicts=('awesome')
backup=('etc/xdg/awesome/rc.lua')
source=("$pkgname::git+https://github.com/awesomeWM/awesome.git"
        awesome.desktop
        awesomeksm.desktop)
sha256sums=('SKIP'
            '5c5437448cc9f01be6ccbb298f5c86d0f8c4bcae23a22e6af699aff0d10f642f'
            '8f25957ef5453f825e05a63a74e24843aad945af86ddffcc0a84084ca2cf9928')
install=awesome-luajit.install

pkgver() {
  cd $pkgname
  git describe | sed 's/^v//;s/-/./g'
}

prepare() {
  mkdir -p build
  sed -i 's/^lua/luajit/' $pkgname/build-utils/lgi-check.sh
  sed -i 's/COMMAND lua/COMMAND luajit/' $pkgname/tests/examples/CMakeLists.txt
}

build() {
  cd build

  cmake ../$pkgname \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSYSCONFDIR=/etc \
    -DLUA_INCLUDE_DIR=/usr/include/luajit-2.0 \
    -DLUA_LIBRARY=/usr/lib/libluajit-5.1.so
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir"/$pkgname/awesome.desktop \
    "$pkgdir/usr/share/xsessions/awesome.desktop"

  install -Dm644 "$srcdir"/awesomeksm.desktop \
    "$pkgdir/usr/share/apps/ksmserver/windowmanagers/awesome.desktop"
}
