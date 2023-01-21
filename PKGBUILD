# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

# 1. Rosewater
# 2. Flamingo
# 3. Pink
# 4. Mauve
# 5. Red
# 6. Maroon
# 7. Peach
# 8. Yellow
# 9. Green
# 10. Teal
# 11. Sky
# 12. Sapphire
# 13. Blue
# 14. Lavender
_accent=1

pkgname=catppuccin-kde-theme-git
pkgver=0.2.1.r0.g80acff5
pkgrel=1
pkgdesc="Soothing pastel theme for KDE"
url="https://github.com/catppuccin/kde"
license=('MIT')
arch=('any')
makedepends=('git' 'kpackage')
source=("$pkgname::git+https://github.com/catppuccin/kde.git"
        color.sh)
sha256sums=('SKIP'
            '697ded12b7f7093844c5e85cb27a7eeff4725318a6470b84ccab6e900c68718b')

pkgver() {
  cd "$pkgname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"

  rm -rf dist
  mkdir -p dist

  ACCENT=$_accent

  for FLAVOUR in $(seq 1 4); do
    source "$srcdir/color.sh"

    cp -r Resources/Catppuccin-$FLAVOURNAME-Global ./dist/Catppuccin-$FLAVOURNAME-$ACCENTNAME
    ACCENTCOLOR=$ACCENTCOLOR FLAVOURNAME=$FLAVOURNAME ACCENTNAME=$ACCENTNAME ./build.sh

    cd dist
    tar -cf "Catppuccin-$FLAVOURNAME-$ACCENTNAME.tar.gz" "Catppuccin-$FLAVOURNAME-$ACCENTNAME"
    cd ..
  done

  rm -f dist/base.colors
}

package() {
  cd "$pkgname"

  install -Dm0644 -t "$pkgdir/usr/share/color-schemes" dist/*.colors
  for f in dist/*.tar.gz; do
    kpackagetool5 -p "$pkgdir/usr/share/plasma/look-and-feel" -i "$f" 2>/dev/null
  done

  install -dm0755 "$pkgdir/usr/share/aurorae/themes"
  for FLAVOURNAME in Latte Frappe Macchiato Mocha; do
    cp -r Resources/aurorae/Catppuccin-$FLAVOURNAME-Aurorae "$pkgdir/usr/share/aurorae/themes"
  done

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
