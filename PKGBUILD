# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

gitpkgname=nautilus-compare
pkgname=${gitpkgname}-40+
pkgver=1.0.1
pkgrel=1
pkgdesc='Context menu file comparison extension for Nautilus 40+'
arch=(any)
url=https://github.com/philong/nautilus-compare
license=(GPL3)
depends=(
  nautilus
  python-nautilus
  python-pyxdg
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
install=${gitpkgname}.install
source=(${gitpkgname}-${pkgver}.tar.gz::https://github.com/philong/${gitpkgname}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('4d66e9f29832135578b0f4dfe66644368e14be3c1f8384dcac4ece4cc0c34b8d')

package() {
  cd "${gitpkgname}-${pkgver}"

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
