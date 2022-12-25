# Maintainer: Michael Kogan <michael dot kogan at gmx dot net>
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias funnychar archlinux.org>

pkgname=xfce4-panel-compiz
_realname=xfce4-panel
pkgver=4.18.0
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
	  "xfce4-panel-4.18.0-invert_scroll_workspaces-1.patch")
sha256sums=('be80023fd546587831bab25ded15ae4c9e346289a75744b6ba4cf4ee53794710'
            'b88569bba5cb5b26c6347d3f0e211244e83868622d1495068bfcf4c9f38cc332')

prepare() {
  cd "$srcdir/$_realname-$pkgver"

  # See https://gitlab.xfce.org/xfce/xfwm4/-/issues/6#note_23168
  echo "Applying xfce4-panel-$pkgver-invert_scroll_workspaces-1.patch:"
  patch -p1 -i "$srcdir/xfce4-panel-4.18.0-invert_scroll_workspaces-1.patch"
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
