# Maintainer: Michael Kogan <michael dot kogan at gmx dot net>
# Contributor: Charles Bos <charlesbos1 AT gmail>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias funnychar archlinux.org>

pkgname=xfce4-panel-compiz
_realname=xfce4-panel
pkgver=4.20.3
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
	  "xfce4-panel-4.20.0-invert_scroll_workspaces-1.patch" "xfce4-panel-4.20.0-viewport_mode-1.patch")
sha256sums=('4006dddf465a4ae02e14355941458c718f6da0896eae68435c9fd24fcd89b6b8'
            'd2190119033b76db69f05f4f32c5aee06ec2e3adc03086baec8781567e02ec8d'
            '0780db28ece10922ffa82eb6b4201441654d10296f17ccfc25c36f3bbef6b501')

prepare() {
  cd "$srcdir/$_realname-$pkgver"

  # See https://gitlab.xfce.org/xfce/xfwm4/-/issues/6#note_23168
  echo "Applying xfce4-panel-$pkgver-viewport_mode-1.patch:"
  patch -p1 -i "$srcdir/xfce4-panel-4.20.0-viewport_mode-1.patch"

  echo "Applying xfce4-panel-$pkgver-invert_scroll_workspaces-1.patch:"
  patch -p1 -i "$srcdir/xfce4-panel-4.20.0-invert_scroll_workspaces-1.patch"
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
