# Maintainer: Nicolas F. <aur@fratti.ch>
pkgname=snowmix
pkgver=0.5.1.1
pkgrel=1
pkgdesc="Dynamic audio and video feed mixer"
arch=('i686' 'x86_64' 'armv7h')
url="https://snowmix.sourceforge.net"
license=('GPL')
groups=()
makedepends=('autoconf' 'automake' 'libtool' 'pkg-config' 'awk')
depends=('openbsd-netcat' 'cairo' 'pango' 'gst-libav' 'sdl' 'freeglut' 'libpng'
         'tcl' 'bwidget' 'glu')
source=("https://downloads.sourceforge.net/sourceforge/snowmix/Snowmix-$pkgver.tar.gz")
sha256sums=('e72d3fdab4b4c03b52787b8641fd6399b3a0a0c8976bf019a959b99f0f0a459d')

build() {
  cd "Snowmix-$pkgver"

  mkdir m4
  aclocal
  autoconf
  libtoolize --force
  automake --add-missing

  ./configure --prefix=/usr --enable-snowmixosmesa --enable-snowmixx11 \
              --enable-snowmixglu --enable-snowmixglut --enable-snowmixgui
  export SNOWMIX="/usr/lib/Snowmix-$pkgver"
  make
  echo "test -f /usr/bin/snowmix &&" \
        "export SNOWMIX=/usr/lib/Snowmix-${pkgver}" > snowmix_env.sh
}

package() {
  cd "Snowmix-$pkgver"
  export SNOWMIX="/usr/lib/Snowmix-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm755 snowmix_env.sh \
    "${pkgdir}"/etc/profile.d/snowmix.sh

  rm -r "$pkgdir/usr/lib/Snowmix-$pkgver/test"
}
