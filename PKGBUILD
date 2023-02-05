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
pkgver=0.2.2.r2.g1291c9c
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

  WINDECSTYLENAME=Modern

  for FLAVOUR in $(seq 1 4); do
    source "$srcdir/color.sh"

    GLOBALTHEMENAME="Catppuccin-$FLAVOURNAME-$ACCENTNAME"
    WINDECSTYLECODE=__aurorae__svg__Catppuccin$FLAVOURNAME-Modern

    cp -r ./Resources/Catppuccin-$FLAVOURNAME-Global ./dist/$GLOBALTHEMENAME
    mkdir -p ./dist/$GLOBALTHEMENAME/contents/splash/images

    # Build splash screen
    FLAVOURNAME=$FLAVOURNAME ./Installer/color-build.sh -s ./Resources/splash/images/busywidget.svg -o ./dist/$GLOBALTHEMENAME/contents/splash/images/_busywidget.svg
    sed ./dist/$GLOBALTHEMENAME/contents/splash/images/_busywidget.svg -e s/REPLACE--ACCENT/$ACCENTCOLOR/g > ./dist/$GLOBALTHEMENAME/contents/splash/images/busywidget.svg
    rm ./dist/$GLOBALTHEMENAME/contents/splash/images/_busywidget.svg
    FLAVOURNAME=$FLAVOURNAME ./Installer/color-build.sh -s ./Resources/splash/Splash.qml -o ./dist/$GLOBALTHEMENAME/contents/splash/Splash.qml
    cp ./Resources/splash/images/Logo.png ./dist/$GLOBALTHEMENAME/contents/splash/images

    # Build colorscheme
    sed -e s/--accentColor/$ACCENTCOLOR/g -e s/--flavour/$FLAVOURNAME/g -e s/--accentName/$ACCENTNAME/g ./Resources/base.colors > ./dist/base.colors
    sed -e s/--accentName/$ACCENTNAME/g -e s/--flavour/$FLAVOURNAME/g ./Resources/metadata.desktop > ./dist/Catppuccin-$FLAVOURNAME-$ACCENTNAME/metadata.desktop
    sed -e s/--accentName/$ACCENTNAME/g -e s/--flavour/$FLAVOURNAME/g -e s/--aurorae/$WINDECSTYLECODE/g ./Resources/defaults > ./dist/Catppuccin-$FLAVOURNAME-$ACCENTNAME/contents/defaults
    FLAVOURNAME=$FLAVOURNAME ACCENTNAME=$ACCENTNAME ./Installer/color-build.sh -o ./dist/Catppuccin$FLAVOURNAME$ACCENTNAME.colors -s ./dist/base.colors
    rm ./dist/base.colors

    cd dist
    tar -cf "$GLOBALTHEMENAME.tar.gz" "$GLOBALTHEMENAME"
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
    cp -r ./Resources/aurorae/Catppuccin$FLAVOURNAME-Modern "$pkgdir/usr/share/aurorae/themes"
  done

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
