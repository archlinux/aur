# Maintainer: Michael Kogan <michael dot kogan at gmx dot net>
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias funnychar archlinux.org>

pkgname=xfce4-panel-compiz
_realname=xfce4-panel
pkgver=4.20.7
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
	  "xfce4-panel-4.20.7-invert_scroll_workspaces-1.patch" "xfce4-panel-4.20.7-viewport_mode-1.patch")
sha256sums=('696e3eff0b1b5bfa8ba90fd7afdea58f5b06e5547840a7443d11388f2fd578ea'
            'fbb4ba79a761f80eb59615a7bc0f71c10793238e43f26919fe896c0624395ac3'
            'a21a9ff3c68ad6164942163d996613071521e6917a2b28df35c120583d510bcb')

prepare() {
  cd "$srcdir/$_realname-$pkgver"

  # See https://gitlab.xfce.org/xfce/xfwm4/-/issues/6#note_23168
  echo "Applying xfce4-panel-4.20.7-viewport_mode-1.patch:"
  patch -p1 -i "$srcdir/xfce4-panel-4.20.7-viewport_mode-1.patch"

  echo "Applying xfce4-panel-4.20.7-invert_scroll_workspaces-1.patch:"
  patch -p1 -i "$srcdir/xfce4-panel-4.20.7-invert_scroll_workspaces-1.patch"
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
