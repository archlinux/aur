# $Id: PKGBUILD 139172 2011-09-30 22:43:18Z eric $
# Maintainer: Kyle Keen <keenerd@gmail.com>
# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=xscreensaver-hacks
_srcname=xscreensaver
pkgver=5.32
pkgrel=1
pkgdesc="Standalone apps from xscreensaver, including phosphor and apple2 terminals."
arch=('i686' 'x86_64')
url="http://www.jwz.org/xscreensaver/"
_watch="http://www.jwz.org/xscreensaver/download.html"
license=('BSD')
conflicts=('xscreensaver')
depends=('libxxf86vm' 'libglade' 'mesa' 'pam' 'libxmu')
#depends=('libxxf86vm' 'libglade' 'mesa' 'pam' 'xorg-appres' 'libxmu' 'perl-libwww')
makedepends=('bc')
source=(http://www.jwz.org/xscreensaver/$_srcname-$pkgver.tar.gz \
        LICENSE)
sha1sums=('3131d45295b9a18a2901737c9b95f1c5434f53a6'
          '4209ea586b204fd1d81c382a0522c654f9fd9134')

build() {
  cd "$srcdir/$_srcname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib --with-x-app-defaults=/usr/share/X11/app-defaults \
    --without-pam --without-motif --with-gtk --with-gl \
    --without-gle --with-pixbuf --with-jpeg --disable-locking \
    --with-hackdir=/usr/bin --with-configdir=/usr/share/xscreensaver-hacks/config

  sed -i 's/utils driver hacks/utils hacks/' Makefile
  make
}

# possible graphical utilities to add:
# vidwhacker webcollage xflame
# glx/photopile glx/glslideshow glx/fliptext glx/gltext glx/starwars glx/molecule glx/carousel barcode fontglide twang
# pretty, but not utility:
# binaryring intermomentary interaggregate fireworkx galaxy substrate wormhole
# glx/cityflow glx/flurry
# cute:
# glx/companioncube glx/skytentacles glx/timetunnel

package() {
  cd "$srcdir/$_srcname-$pkgver"
  cd hacks
  make install_prefix="$pkgdir" install
  cd glx
  make install_prefix="$pkgdir" install
  cd ../..
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Keep only the terminal related apps.
  # If you think something should be added to this list, just ask.
  find "$pkgdir" -type f ! \( \
        -name '*bsod*'   -or -name '*xmatrix*'  -or \
        -name '*pong*'   -or -name '*phosphor*' -or \
        -name '*apple2*' -or -name '*glmatrix*' -or \
        -name '*m6502*'  -or -name '*xanalogtv*' -or \
        -name '*sonar*'  -or -name '*lcdscrub*' -or \
        -name '*boing*'  -or -name '*tronbit*' -or \
        -name '*memscroller*' -or \
        -name '*unknownpleasures*' \) -delete
  # fix some conflicts
  mv "$pkgdir/usr/bin/bsod" "$pkgdir/usr/bin/bsod-ss"
}
