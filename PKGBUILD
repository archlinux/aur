# $Id$
# Maintainer: physkets <physkets@tutanota.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Filippo 'JoeyrS' Civiletti <joeyrs@gmail.com>

pkgname=armagetronad-snapshot
pkgver=0.4_alpha_z2219_20150311
pkgrel=1
pkgdesc='A Tron Clone in 3D.'
arch=('x86_64')
url='http://armagetronad.net/'
license=('GPL')
depends=('sdl2_image' 'libxml2' 'sdl2_mixer' 'ftgl' 'boost-libs')
optdepends=('python2: language updater')
makedepends=('boost')
conflicts=('armagetronad')
source=(https://downloads.sourceforge.net/project/armagetronad/snapshots/trunk/2015/$pkgver/armagetronad-experimental-$pkgver.src.tar.bz2)
sha1sums=('92066eb7fdc947717e484ebacb26898a4e228e83')

build() {
     cd "$srcdir/armagetronad-experimental-$pkgver"

     # python2 fix
     sed -i 's_#!/usr/bin/python_#!/usr/bin/python2_' language/update.py

     ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --mandir=/usr/share/man \
        --disable-games \
        --enable-automakedefaults \
        --disable-uninstall
     make
}

package() {
     cd "$srcdir/armagetronad-$pkgver"
     make DESTDIR="$pkgdir" install
     install -D -m 644 "desktop/armagetronad.desktop" "$pkgdir/usr/share/applications/armagetronad.desktop"
     install -d "$pkgdir/usr/share/pixmaps/"
     ln -s /usr/share/armagetronad/desktop/icons/large/armagetronad.png \
           "$pkgdir/usr/share/pixmaps/armagetronad.png"
     mv "$pkgdir/usr/bin/armagetronad" "$pkgdir/usr/bin/armagetronad_bin"
     printf "#!/bin/bash\n/usr/bin/armagetronad_bin --configdir /etc/armagetronad --datadir /usr/share/armagetronad" > "$pkgdir/usr/bin/armagetronad"
     chmod +x "$pkgdir/usr/bin/armagetronad"
}
