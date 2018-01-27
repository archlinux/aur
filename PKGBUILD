# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias funnychar archlinux.org>

pkgname=xfce4-panel-compiz
_realname=xfce4-panel
pkgver=4.12.2
pkgrel=1
pkgdesc="Panel for the Xfce desktop environment with fixes for Compiz"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('exo' 'garcon' 'libxfce4ui' 'libwnck' 'hicolor-icon-theme'
         'desktop-file-utils')
makedepends=('intltool' 'gtk-doc')
provides=("$_realname=$pkgver")
conflicts=("$_realname")
source=(http://archive.xfce.org/src/xfce/$_realname/${pkgver%.*}/$_realname-$pkgver.tar.bz2
        workspace-pager.patch
        button-visibility.patch
        scrolling-viewports.patch)
sha256sums=('42058abb81b8f87691d3999627447de71c3285bcf055f308aab5cefab2de0ce9'
            '006889db18e8579033db32eeb85257b1f55b7c378881b69a7671d708304f91af'
            '556f7ecc22fdf024101d2e8a0416b953efaef48ff4ed649aab97d5b115a94931'
            '8ca306d6fa63e47008223205b6aed887c02ea313fd0db996b40218771c18224e')

prepare() {
  cd "$srcdir/$_realname-$pkgver"

  # See https://bugzilla.xfce.org/show_bug.cgi?id=11697
  patch -p1 -i "$srcdir/workspace-pager.patch"

  # See https://bugzilla.xfce.org/show_bug.cgi?id=10908
  patch -p1 -i "$srcdir/button-visibility.patch"

  # See https://bugzilla.xfce.org/show_bug.cgi?id=3361
  patch -p1 -i "$srcdir/scrolling-viewports.patch"
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
    --enable-gtk3 \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_realname-$pkgver"
  make DESTDIR="$pkgdir" install
}
