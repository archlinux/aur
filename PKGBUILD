# Maintainer: Michael Kogan <michael dot kogan at gmx dot net>
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias funnychar archlinux.org>

pkgname=xfce4-panel-compiz
_realname=xfce4-panel
pkgver=4.16.0
pkgrel=1
pkgdesc="Panel for the Xfce desktop environment with fixes for Compiz"
arch=('i686' 'x86_64')
url="https://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('exo' 'garcon' 'libxfce4ui' 'libwnck' 'hicolor-icon-theme'
         'desktop-file-utils' 'libwnck3')
makedepends=('intltool' 'gtk-doc' 'xfce4-dev-tools')
provides=("$_realname=$pkgver")
conflicts=("$_realname")
source=("https://archive.xfce.org/src/xfce/$_realname/${pkgver%.*}/$_realname-$pkgver.tar.bz2"
	  fix-scrolling.patch
	  wrap-workspaces.patch)
sha256sums=('5e979aeeb37d306d72858b1bc67448222ea7a68de01409055b846cd31f3cc53d'
            'bff4205da99f706bf931b5624cfeb5586145203048bd4b27609e46e907051136'
            '3c4720674d4cc3d987a254b2f108892a542d97e351fcbacf6dc4c4af395e0c13')

prepare() {
  cd "$srcdir/$_realname-$pkgver"

  # See https://gitlab.xfce.org/xfce/xfwm4/-/issues/6#note_23168
  echo "Applying fix-scrolling.patch:"
  patch -p1 -i "$srcdir/fix-scrolling.patch"
  
  echo "Applying wrap-workspaces.patch:"
  patch -p1 -i "$srcdir/wrap-workspaces.patch"
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
