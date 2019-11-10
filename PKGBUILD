# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributer: Bartłomiej Piotrowski <barthalion@gmail.com>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Arnaud Durand <biginozNOSPAM_at_free.dot.fr>
# Contributor: Nuno Araujo <nuno.araujo at russo79.com>

pkgname=bleachbit-cli
_pkgname=bleachbit
pkgver=3.0
pkgrel=2
pkgdesc='Deletes unneeded files to free disk space and maintain privacy. CLI version/no GUI.'
conflicts=($_pkgname)
provides=("bleachbit=${pkgver}")
arch=(any)
url='https://www.bleachbit.org/'
license=(GPL3)
depends=(python2-gobject)
source=(https://download.bleachbit.org/$_pkgname-$pkgver.tar.bz2
fix.patch::https://github.com/bleachbit/bleachbit/commit/3e3e49d323a228b857307d914fbb90180b4fbb93.patch)
sha256sums=('ed18cb522cc375589cc0c94fbfaf6d7ee6fb94a8a1261400252b1ca32b4cdaa2'
            '3565aa5a626b65cf568dd097e23466aede8de8a4a826d928fcf82144c7359260')

prepare() {
  cd $_pkgname-$pkgver

  # https://github.com/bleachbit/bleachbit/issues/685
  patch -Np1 -i ../fix.patch

  sed -e 's|python|python2|g' -i bleachbit/CLI.py
}

package() {
  cd $_pkgname-$pkgver

  make prefix=/usr DESTDIR="$pkgdir" install

  # suggestion by Meow to force script to operate in cli mode
  sed -i 's/if 1/if 0/' "$pkgdir"/usr/bin/bleachbit

  rm -rf "$pkgdir"/usr/share/{applications,pixmaps}
  rm -rf "$pkgdir"/usr/share/polkit-1
}
