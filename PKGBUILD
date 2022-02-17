# Maintainer: Daniel Hahler <archlinux+aur@thequod.de>
# Contributor: noonov <noonov@gmail.com>
# Contributor: wtchappell <wtchappell@gmail.com>

_pkgname=awesome
pkgname=awesome-luajit-git
pkgver=4.3.1355.gbd776c980
pkgrel=1
pkgdesc="awesome window manager built with luajit"
url='https://awesomewm.org/'
arch=('i686' 'x86_64')
license=('GPL2')
depends=(
  'cairo'
  'dbus'
  'gdk-pixbuf2'
  'libxdg-basedir'
  'libxfixes'
  'libxkbcommon-x11'
  'luajit'
  'luajit-lgi'
  'pango'
  'startup-notification'
  'xcb-util-cursor'
  'xcb-util-keysyms'
  'xcb-util-wm'
  'xcb-util-xrm'
)
makedepends=(
  'asciidoctor'
  'cmake'
  'docbook-xsl'
  'git'
  'gzip'
  'imagemagick'
  'ldoc'
  'lua-penlight'
  'xmlto'
)
optdepends=(
  'dex: autostart your desktop files'
  'librsvg: for displaying SVG files without scaling artifacts'
  'rlwrap: readline support for awesome-client'
  'vicious: widgets for the Awesome window manager'
  'xcb-util-errors: for pretty-printing of X11 errors'
)
provides=('notification-daemon' 'awesome')
conflicts=('awesome')
backup=('etc/xdg/awesome/rc.lua')
source=("$pkgname::git+https://github.com/awesomeWM/awesome.git"
        awesome.desktop
        awesomeksm.desktop)
sha256sums=('SKIP'
            '5c5437448cc9f01be6ccbb298f5c86d0f8c4bcae23a22e6af699aff0d10f642f'
            '8f25957ef5453f825e05a63a74e24843aad945af86ddffcc0a84084ca2cf9928')

_LUAJIT_VERSION=2.1

pkgver() {
  cd $pkgname
  git describe | sed 's/^v//;s/-/./g'
}

build() {
  mkdir -p build
  cd build

  cmake ../$pkgname \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSYSCONFDIR=/etc \
    -DLUA_INCLUDE_DIR=/usr/include/luajit-$_LUAJIT_VERSION \
    -DLUA_LIBRARY=/usr/lib/libluajit-5.1.so \
    -DLUA_EXECUTABLE=/usr/bin/luajit
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
