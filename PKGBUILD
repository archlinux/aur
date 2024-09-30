# Maintainer: Mike Pento <mpento@darkforge.net>

pkgname=lib32-gtk-engine-equinox
pkgver=1.50
pkgrel=3
pkgdesc="A heavily modified version of the beautiful Aurora engine (lib32)"
url="https://launchpad.net/equinox"
license=('GPL')
arch=('i686' 'x86_64')
depends=('lib32-gtk2' 'gtk-engine-equinox')
makedepends=('libtool')
options=('!libtool')
source=(https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/gtk2-engines-equinox/$pkgver-0ubuntu4/gtk2-engines-equinox_$pkgver.orig.tar.gz)
sha256sums=('0cf8b8cc841e0da7d4a08ab5a70d3bb330fd76bdcb03165a47aaddcd47e02227')

build() {
  cd "$srcdir/equinox-$pkgver"
  # toolbar fix
  sed -i "s/=\( EQUINOX_IS_TOOLBAR\)/= widget \&\&\1/" \
    src/equinox_style.c

  # glib2 fix
  sed -i "/gtimer/d" src/animation.c
        
  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  ./configure --prefix=/usr \
              --libdir=/usr/lib32 \
              --enable-animation
  make
}
package() {
  cd "$srcdir/equinox-$pkgver"
  make DESTDIR="$pkgdir/" install
}
