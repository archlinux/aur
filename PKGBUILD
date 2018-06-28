# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=lash
pkgver=0.6.0~rc2
_relver=0.6.0.594
pkgrel=14
pkgdesc='Session management system for JACK and ALSA'
arch=(i686 x86_64)
url=http://lash.nongnu.org
license=(GPL2)
depends=(jack python2)
makedepends=(gtk2)
optdepends=('gtk2: for lash_panel, lash_save_button and lash_synth')
source=(https://download.savannah.gnu.org/releases/lash/lash-$pkgver.tar.bz2
        fix-manual-generation.patch)
sha512sums=(704e24ccadccb469e820be5fb58dd4d953a8fc2903cd857a290267a87dda596639ec381d5cb7cdfcd715df7d98d6570e52731bddd17f8a3425edd8b699632401
            25bb9f97bc6ff7543fea39242bc321b40cd35ba042248671e958348f9e250f810ea1e4753918aceba799b0fdd886184af57a7c497796034b999ca8d6b85e1252)

prepare() {
  cd lash-$_relver
  patch -Np0 -i ../fix-manual-generation.patch

  # Python2 fixes
  export PYTHON=python2
  sed -i 's#env python#&2#' clients/lash_control
}

build() {
  cd lash-$_relver
  export LDFLAGS='-ldl -lm -ltirpc'
  ./configure --prefix=/usr CFLAGS=-I/usr/include/tirpc
  make
}

package() {
  cd lash-$_relver
  make DESTDIR=$pkgdir install

  install -vDm 644 {AUTHORS,NEWS,README,TODO} \
    -t $pkgdir/usr/share/doc/lash/
  install -vDm 644 ChangeLog $pkgdir/usr/share/doc/lash/CHANGELOG
  install -vDm 644 COPYING $pkgdir/usr/share/licenses/lash/LICENSE
}
