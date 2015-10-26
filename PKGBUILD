# Maintainer: Nicolas F. <aur@fratti.ch>
pkgname=snowmix
pkgver=0.5.0
pkgrel=1
pkgdesc="Dynamic audio and video feed mixer"
arch=('i686' 'x86_64')
url="http://snowmix.sourceforge.net"
license=('GPL')
groups=()
makedepends=('autoconf' 'automake' 'libtool' 'pkg-config' 'awk')
depends=('openbsd-netcat' 'cairo' 'pango' 'gst-libav' 'sdl' 'freeglut' 'libpng'
         'tcl' 'bwidget' 'glu')
source=("http://sourceforge.net/projects/snowmix/files/Snowmix-$pkgver.tar.gz"
        "snowmix.sh"
        "fix-tcldir.patch"
        "fix-ini-data.patch")
md5sums=('2e474171e84dda413f3587dfa1cf61f9'
         '89a14ff28c05f5261910ac7b06d4055b'
         '9cb3b2a30c6b2084536636340b1da92a'
         '84e31e0ab2b298ddfd4ffaca3d57e3a0')

prepare() {
  cd "Snowmix-$pkgver"
  patch -p0 -i "$srcdir"/fix-tcldir.patch
  patch -p0 -i "$srcdir"/fix-ini-data.patch
}

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
