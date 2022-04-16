# Maintainer: Michael Kogan <michael dot kogan at gmx dot net>
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias funnychar archlinux.org>

pkgname=xfce4-panel-compiz
_realname=xfce4-panel
pkgver=4.16.4
pkgrel=1
pkgdesc="Panel for the Xfce desktop environment with fixes for Compiz"
arch=('i686' 'x86_64')
url="https://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('exo' 'garcon' 'libxfce4ui' 'xfconf' 'libwnck3' 'libdbusmenu-gtk3'
         'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('intltool' 'gobject-introspection' 'vala' 'xfce4-dev-tools')
provides=("$_realname=$pkgver")
conflicts=("$_realname")
source=("https://archive.xfce.org/src/xfce/$_realname/${pkgver%.*}/$_realname-$pkgver.tar.bz2"
	  "xfce4-panel-4.16.1-invert_scroll_workspaces-1.patch"
	  "xfce4-panel-4.16.1-wrap_workspaces_ui-1.patch")
sha256sums=('1faf51a81a655244dba4c6ac9dd33e3ab0d78a9ee096c218b38fed6642c9cd84'
            '1bf92366667f38197ae882c011f2b0380c4548278b419fd004f9c21aab1a587e'
            'c01adcba7bfe94e84253c5748dcab6c9e2b0d5da7d6c7aab64114a70513eafbf')
		
prepare() {
  cd "$srcdir/$_realname-$pkgver"

  # See https://gitlab.xfce.org/xfce/xfwm4/-/issues/6#note_23168
  echo "Applying xfce4-panel-$pkgver-invert_scroll_workspaces-1.patch:"
  patch -p1 -i "$srcdir/xfce4-panel-4.16.1-invert_scroll_workspaces-1.patch"
  
  echo "Applying xfce4-panel-$pkgver-wrap_workspaces_ui-1.patch:"
  patch -p1 -i "$srcdir/xfce4-panel-4.16.1-wrap_workspaces_ui-1.patch"
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
