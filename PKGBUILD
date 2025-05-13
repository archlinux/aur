# Maintainer: Michael Kogan <michael dot kogan at gmx dot net>
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias funnychar archlinux.org>

pkgname=xfce4-panel-compiz
_realname=xfce4-panel
pkgver=4.20.4
pkgrel=1
pkgdesc="Panel for the Xfce desktop environment with fixes for Compiz"
arch=('i686' 'x86_64')
url="https://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('exo' 'garcon' 'libxfce4ui' 'xfconf' 'libwnck3' 'libdbusmenu-gtk3'
         'hicolor-icon-theme' 'desktop-file-utils' 'libxfce4windowing')
makedepends=('intltool' 'gobject-introspection' 'vala' 'xfce4-dev-tools' 'glib2-devel')
provides=("$_realname=$pkgver")
conflicts=("$_realname")
source=("https://archive.xfce.org/src/xfce/$_realname/${pkgver%.*}/$_realname-$pkgver.tar.bz2"
	  "xfce4-panel-4.20.4-invert_scroll_workspaces-1.patch" "xfce4-panel-4.20.4-viewport_mode-1.patch")
sha256sums=('695b23af490719e734c8659394821b43cc94d3bee69994bafdc42ef40daa0d2c'
            '15dd2f1b91b87971059dddfba8b08b72f53d0e66b4f0a17a5c29f7719636a0c2'
            'ed7e779275a945cf127b0a30a73fa8bc9b2819f9aee7ff2368fe6233674efa61')

prepare() {
  cd "$srcdir/$_realname-$pkgver"

  # See https://gitlab.xfce.org/xfce/xfwm4/-/issues/6#note_23168
  echo "Applying xfce4-panel-4.20.4-viewport_mode-1.patch:"
  patch -p1 -i "$srcdir/xfce4-panel-4.20.4-viewport_mode-1.patch"

  echo "Applying xfce4-panel-4.20.4-invert_scroll_workspaces-1.patch:"
  patch -p1 -i "$srcdir/xfce4-panel-4.20.4-invert_scroll_workspaces-1.patch"
}

build() {
  cd "$srcdir/$_realname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-gio-unix \
    --enable-gtk-doc \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_realname-$pkgver"
  make DESTDIR="$pkgdir" install
}
