# Maintainer: Nicolas F. <aur@fratti.ch>
pkgname=snowmix
pkgver=0.5.1
pkgrel=1
pkgdesc="Dynamic audio and video feed mixer"
arch=('i686' 'x86_64')
url="https://snowmix.sourceforge.net"
license=('GPL')
groups=()
makedepends=('autoconf' 'automake' 'libtool' 'pkg-config' 'awk')
depends=('openbsd-netcat' 'cairo' 'pango' 'gst-libav' 'sdl' 'freeglut' 'libpng'
         'tcl' 'bwidget' 'glu')
source=("https://downloads.sourceforge.net/sourceforge/snowmix/Snowmix-$pkgver.tar.gz"
        "snowmix.sh")
sha256sums=('0f39911243741f9c64a1994c7a0523db41e2e6e24efacd634d0d1f33c9c3e7bd'
            'fce726356bb10aafa30aff1beebb8750159e45c356091330eb3566866a78383c')

build() {
  cd "Snowmix-$pkgver"

  mkdir m4
  aclocal
  autoconf
  libtoolize --force
  automake --add-missing

  ./configure --prefix=/usr --enable-snowmixosmesa --enable-snowmixx11 \
              --enable-snowmixglu --enable-snowmixgui
  export SNOWMIX="/usr/lib/Snowmix-$pkgver"
  make
}

package() {
  cd "Snowmix-$pkgver"
  export SNOWMIX="/usr/lib/Snowmix-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm755 "$srcdir"/snowmix.sh \
    "${pkgdir}"/etc/profile.d/snowmix.sh

  rm -r "$pkgdir/usr/lib/Snowmix-$pkgver/test"
}
