# Maintainer: Nicolas F. <aur@fratti.ch>
pkgname=snowmix
pkgver=0.5.0
pkgrel=2
pkgdesc="Dynamic audio and video feed mixer"
arch=('i686' 'x86_64')
url="https://snowmix.sourceforge.net"
license=('GPL')
groups=()
makedepends=('autoconf' 'automake' 'libtool' 'pkg-config' 'awk')
depends=('openbsd-netcat' 'cairo' 'pango' 'gst-libav' 'sdl' 'freeglut' 'libpng'
         'tcl' 'bwidget' 'glu')
source=("https://downloads.sourceforge.net/sourceforge/snowmix/Snowmix-$pkgver.tar.gz"
        "snowmix.sh"
        "fix-tcldir.patch"
        "fix-ini-data.patch")
sha256sums=('f5e6f250c04ff553470fca8cb22b59dbb54afd45a989b98b1ba51302886d3870'
            'fce726356bb10aafa30aff1beebb8750159e45c356091330eb3566866a78383c'
            'd4d35a310aa28f0ac0a399305cd86e35fecab7520e74364acbbb2e18a2b53908'
            '96f2c7d82e59728b14d1506440a8a76086b458eb515f02c642e5d43e914865d3')

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
