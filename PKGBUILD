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

pkgname=catppuccin-kde-theme
pkgver=0.2.3
pkgrel=1
pkgdesc="Soothing pastel theme for KDE"
url="https://github.com/catppuccin/kde"
license=('MIT')
arch=('any')
makedepends=('kpackage')
source=("$pkgname-$pkgver.tar.gz::https://github.com/catppuccin/kde/archive/refs/tags/v$pkgver.tar.gz"
        color.sh)
sha256sums=('30212207db7d44bae080cd5a9c238ec5757c6769adb3babe655acc8b23b240c6'
            '697ded12b7f7093844c5e85cb27a7eeff4725318a6470b84ccab6e900c68718b')

build() {
  cd "kde-$pkgver"

  rm -rf dist
  mkdir -p dist

  ACCENT=$_accent

  WINDECSTYLENAME=Modern

  for FLAVOUR in $(seq 1 4); do
    source "$srcdir/color.sh"

    GLOBALTHEMENAME="Catppuccin-$FLAVOURNAME-$ACCENTNAME"
    WINDECSTYLECODE=__aurorae__svg__Catppuccin$FLAVOURNAME-Modern

    cp -r ./Resources/LookAndFeel/Catppuccin-$FLAVOURNAME-Global ./dist/$GLOBALTHEMENAME
    mkdir -p ./dist/$GLOBALTHEMENAME/contents/splash/images

    # Build splash screen
    FLAVOURNAME=$FLAVOURNAME ./Installer/color-build.sh -s ./Resources/Splash/images/busywidget.svg -o ./dist/$GLOBALTHEMENAME/contents/splash/images/_busywidget.svg
    sed ./dist/$GLOBALTHEMENAME/contents/splash/images/_busywidget.svg -e s/REPLACE--ACCENT/$ACCENTCOLOR/g > ./dist/$GLOBALTHEMENAME/contents/splash/images/busywidget.svg
    rm ./dist/$GLOBALTHEMENAME/contents/splash/images/_busywidget.svg
    FLAVOURNAME=$FLAVOURNAME ./Installer/color-build.sh -s ./Resources/Splash/Splash.qml -o ./dist/$GLOBALTHEMENAME/contents/splash/Splash.qml
    cp ./Resources/Splash/images/Logo.png ./dist/$GLOBALTHEMENAME/contents/splash/images

    # Build colorscheme
    sed -e s/--accentColor/$ACCENTCOLOR/g -e s/--flavour/$FLAVOURNAME/g -e s/--accentName/$ACCENTNAME/g ./Resources/Base.colors > ./dist/base.colors
    sed -e s/--accentName/$ACCENTNAME/g -e s/--flavour/$FLAVOURNAME/g ./Resources/LookAndFeel/metadata.desktop > ./dist/Catppuccin-$FLAVOURNAME-$ACCENTNAME/metadata.desktop
    sed -e s/--accentName/$ACCENTNAME/g -e s/--flavour/$FLAVOURNAME/g -e s/--aurorae/$WINDECSTYLECODE/g ./Resources/LookAndFeel/defaults > ./dist/Catppuccin-$FLAVOURNAME-$ACCENTNAME/contents/defaults
    FLAVOURNAME=$FLAVOURNAME ACCENTNAME=$ACCENTNAME ./Installer/color-build.sh -o ./dist/Catppuccin$FLAVOURNAME$ACCENTNAME.colors -s ./dist/base.colors
    rm ./dist/base.colors

    cd dist
    tar -cf "$GLOBALTHEMENAME.tar.gz" "$GLOBALTHEMENAME"
    cd ..
  done

  rm -f dist/base.colors
}

package() {
  cd "kde-$pkgver"

  install -Dm0644 -t "$pkgdir/usr/share/color-schemes" dist/*.colors
  for f in dist/*.tar.gz; do
    kpackagetool5 -p "$pkgdir/usr/share/plasma/look-and-feel" -i "$f" 2>/dev/null
  done

  install -dm0755 "$pkgdir/usr/share/aurorae/themes"
  for FLAVOURNAME in Latte Frappe Macchiato Mocha; do
    cp -r ./Resources/Aurorae/Catppuccin$FLAVOURNAME-Modern "$pkgdir/usr/share/aurorae/themes"
  done

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
