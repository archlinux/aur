# Maintainer: Nicholas Dahm <(first).(last) at gmail>

_pkgname=xfwm4
pkgname=xfwm4-move-monitor
pkgver=4.16.1
pkgrel=8
pkgdesc="Xfce's window manager"
arch=('x86_64')
url="https://docs.xfce.org/xfce/xfwm4/start"
license=('GPL2')
groups=('xfce4', 'modified')
depends=('libxfce4ui' 'xfconf' 'libwnck3' 'libepoxy' 'libxpresent'
         'hicolor-icon-theme')
provides=('xfwm4')
conflicts=('xfwm4')
makedepends=('intltool')
source=(https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2
        client-Handle-removal-of-GTK_FRAME_EXTENTS.patch
        move-to-monitor.patch)
sha256sums=('b5b24ca04bd73c642db0a4b4df81d262381d758f01b51108257d48b391b8718c'
            'cc49d8c0932dc3f630073e87c8fffaddd811306dc32d74a8127fe0de7baccd4d'
            'ab10657b8e5c628cd04ede23ba2bace0e96320f47b9eb9115087c251b618e741')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  # https://gitlab.xfce.org/xfce/xfwm4/-/issues/603
  patch -Np1 -i ../client-Handle-removal-of-GTK_FRAME_EXTENTS.patch

  # Add move monitor shortcuts
  patch -Np0 < ../../move-to-monitor.patch
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

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
    --enable-debug=yes
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
