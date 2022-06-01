pkgname=xfwm4-gaps
pkgver=4.16.1
pkgrel=1
pkgdesc="Xfce's window manager - now with extra gaps"
arch=('x86_64')
url="https://docs.xfce.org/xfce/xfwm4/start"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui' 'xfconf' 'libwnck3' 'libepoxy' 'libxpresent'
         'hicolor-icon-theme')
makedepends=('intltool')
provides=('xfwm4')
conflicts=('xfwm4')
source=(https://archive.xfce.org/src/xfce/xfwm4/${pkgver%.*}/xfwm4-$pkgver.tar.bz2
        client-Handle-removal-of-GTK_FRAME_EXTENTS.patch
        gaps.patch)
sha256sums=('b5b24ca04bd73c642db0a4b4df81d262381d758f01b51108257d48b391b8718c'
            SKIP
            SKIP)

prepare() {
  cd "$srcdir/xfwm4-$pkgver"
  # https://gitlab.xfce.org/xfce/xfwm4/-/issues/603
  patch -Np1 -i ../client-Handle-removal-of-GTK_FRAME_EXTENTS.patch
  patch -Np1 -i ../gaps.patch
}

build() {
  cd "$srcdir/xfwm4-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-startup-notification \
    --enable-randr \
    --enable-compositor \
    --enable-xsync \
    --disable-debug
  make
}

package() {
  cd "$srcdir/xfwm4-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
