pkgname=nautilus-compare
pkgver=1.0.1
pkgrel=1
pkgdesc='Context menu file comparison extension for Nautilus'
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
install=${pkgname}.install
source=(https://github.com/philong/${pkgname}/archive/refs/tags/${pkgver}.tar.gz)
b2sums=('6a3e7f29aabd31f70b0aefc76e284f6c8f624b07c71d6314308e901b8db85bf0158804a493ca7efaa40b0b5da4ca15df7191c1c0943e7ec16886fc4e0b94c911')

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
