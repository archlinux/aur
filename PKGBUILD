# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: duck <duck@vmail.me>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: arjan <arjan@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=bomberclone
pkgver=0.11.9
pkgrel=7
pkgdesc='Clone of the game Atomic Bomberman'
arch=(x86_64)
url='https://www.bomberclone.de/core.html'
license=(GPL)
depends=(sdl_mixer sdl_image)
makedepends=(gendesk)
source=("https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz"
        bomberclone-0.11.9-build-fix.patch
        'https://sourceforge.net/p/bomberclone/patches/9/attachment/snprintf.diff')
sha256sums=('71eb2788f95c136fd3eecaee15d05a80dea07221b5b3530dc869e433e02ff68d'
            'ee8bbff24f261951379ca55c510df04deb5a0fd17c2c3149b63bbcaf1cfb0549'
            '3df79e4c87f94d3a2065583fd92a5129e57f35bfb949c92870ed32968acfe54e')

prepare() {
  cd "$pkgname-$pkgver"

  # generate a desktop shortcut
  gendesk -f -n --pkgname $pkgname --pkgdesc "$pkgdesc" --name BomberClone

  # add build fix extracted from upstream CVS (fixes FS#26942)
  patch -p0 -i ../bomberclone-0.11.9-build-fix.patch

  # buffer overflow patch, ref FS#44387
  patch -p0 -i ../snprintf.diff
}

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make CFLAGS="-O3 $(pkg-config --cflags --libs sdl) $CFLAGS -lm -w"
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install

  # package desktop shortcut
  install -Dm644 $pkgname-$pkgver/$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # create a symlink to the icon
  install -d "$pkgdir/usr/share/pixmaps"
  ln -s "/usr/share/games/$pkgname/pixmaps/$pkgname.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim: ts=2 sw=2 et:
