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

pkgname=plasma5-theme-catppuccin
pkgver=0.2.4
pkgrel=1
pkgdesc="Soothing pastel theme for KDE"
url="https://github.com/catppuccin/kde"
license=('MIT')
arch=('any')
makedepends=('kpackage5')
source=("$pkgname-$pkgver.tar.gz::https://github.com/catppuccin/kde/archive/refs/tags/v$pkgver.tar.gz"
        color.sh)
sha256sums=('bbf03f16ecfef6fd45eaa405443cd3de04596caa07361aa6e8c2d190acbb1f6c'
            '0aad253fb7686fd15cee5c47138411ca80eb017fba046d6cb7054212294d4c7b')

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

    sed -e s/--accentName/"$ACCENTNAME"/g -e s/--flavour/"$FLAVOURNAME"/g ./Resources/LookAndFeel/metadata.desktop > ./dist/Catppuccin-"$FLAVOURNAME"-"$ACCENTNAME"/metadata.desktop
    sed -e s/--accentName/"$ACCENTNAME"/g -e s/--flavour/"$FLAVOURNAME"/g -e s/--aurorae/"$WINDECSTYLECODE"/g ./Resources/LookAndFeel/defaults > ./dist/Catppuccin-"$FLAVOURNAME"-"$ACCENTNAME"/contents/defaults

    # Build splash screen
    FLAVOURNAME=$FLAVOURNAME ./Installer/color-build.sh -s ./Resources/Splash/images/busywidget.svg -o ./dist/$GLOBALTHEMENAME/contents/splash/images/_busywidget.svg
    sed ./dist/"$GLOBALTHEMENAME"/contents/splash/images/_busywidget.svg -e s/REPLACE--ACCENT/$ACCENTCOLOR/g > ./dist/"$GLOBALTHEMENAME"/contents/splash/images/busywidget.svg
    sed -e s/REPLACE--MANTLE/"$MANTLECOLOR"/g ./Resources/Splash/Splash.qml > ./dist/"$GLOBALTHEMENAME"/contents/splash/Splash.qml
    if [[ $FLAVOUR != "4" ]]; then
      cp ./Resources/Splash/images/Logo.png ./dist/"$GLOBALTHEMENAME"/contents/splash/images/Logo.png
    else
      cp ./Resources/Splash/images/Latte_Logo.png ./dist/"$GLOBALTHEMENAME"/contents/splash/images/Logo.png
    fi

    # Build colorscheme
    sed -e s/--accentColor/$ACCENTCOLOR/g -e s/--flavour/$FLAVOURNAME/g -e s/--accentName/$ACCENTNAME/g ./Resources/Base.colors > ./dist/base.colors
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
    if [[ $FLAVOURNAME = "Latte" ]]; then
      cp ./Resources/Aurorae/Common/CatppuccinLatte-Modernrc "$pkgdir/usr/share/aurorae/themes/CatppuccinLatte-Modern/CatppuccinLatte-Modernrc"
    else
      cp ./Resources/Aurorae/Common/Catppuccin-Modernrc "$pkgdir/usr/share/aurorae/themes/Catppuccin$FLAVOURNAME-Modern/Catppuccin$FLAVOURNAME-Modernrc"
    fi
  done

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
