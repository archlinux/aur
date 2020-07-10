# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=nautilus-compare
pkgver=1.0.0
pkgrel=1
pkgdesc='Context menu file comparison extension for Nautilus'
arch=(any)
url=https://launchpad.net/nautilus-compare/
license=(GPL3)
depends=(
  nautilus
  python-nautilus
  python-xdg
)
optdepends=(
  'meld'
  'kdiff3'
  'diffuse'
  'kompare'
  'fldiff'
  'tkdiff'
  'xxdiff'
)
install=${pkgname}.install
source=(https://launchpad.net/${pkgname}/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz)
sha256sums=('f42f156cc47c109720bbed0b1bc1bc4022ee33b8328323b8de279607c7f0647c')

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 src/nautilus-compare{,-preferences}.py -t "${pkgdir}/usr/share/nautilus-compare/"
  install -Dm644 src/utils.py -t "${pkgdir}/usr/share/nautilus-compare/"

  install -dm755 "$pkgdir"/usr{/bin,/share/nautilus-python/extensions}
  ln -s /usr/share/nautilus-compare/nautilus-compare.py "$pkgdir/usr/share/nautilus-python/extensions/nautilus-compare.py"
  ln -s /usr/share/nautilus-compare/nautilus-compare-preferences.py "$pkgdir/usr/bin/nautilus-compare-preferences"

  install -Dm644 data/nautilus-compare-preferences.desktop "$pkgdir/usr/share/applications/nautilus-compare-preferences.desktop"

  for file in $(cd po; ls *.po; cd ..); do
    mkdir -p "$pkgdir"/usr/share/locale/${file%.po}/LC_MESSAGES
	  msgfmt -f -o "$pkgdir"/usr/share/locale/${file%.po}/LC_MESSAGES/nautilus-compare.mo po/$file
  done
}
