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
pkgver=0.2.4.r13.g1407c70
pkgrel=1
pkgdesc="Soothing pastel theme for KDE"
url="https://github.com/catppuccin/kde"
license=('MIT')
arch=('any')
depends=('plasma-desktop')
makedepends=('git' 'kpackage')
provides=('catppuccin-kde-theme')
source=("$pkgname::git+https://github.com/catppuccin/kde.git"
        color.sh)
sha256sums=('SKIP'
            'b67d026c35f678f0344feb750f08fafe35a2565d86a783d9ce67d05180b00095')

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
    WINDECSTYLECODE="__aurorae__svg__Catppuccin$FLAVOURNAME-Modern"

    if [[ $FLAVOUR == "1" ]]; then
      StoreAuroraeNo="2023219"
      MANTLECOLOR=#181825
    elif [[ $FLAVOUR == "2" ]]; then
      StoreAuroraeNo="2023220"
      MANTLECOLOR=#1e2030
    elif [[ $FLAVOUR == "3" ]]; then
      StoreAuroraeNo="2023222"
      MANTLECOLOR=#292c3c
    elif [[ $FLAVOUR == "4" ]]; then
      StoreAuroraeNo="2023224"
      MANTLECOLOR=#e6e9ef
    fi

    # Global theme
    cp -r ./Resources/LookAndFeel/Catppuccin-$FLAVOURNAME-Global ./dist/$GLOBALTHEMENAME
    sed -e s/--accentName/"$ACCENTNAME"/g -e s/--flavour/"$FLAVOURNAME"/g -e s/--StoreAuroraeNo/"$StoreAuroraeNo"/g ./Resources/LookAndFeel/metadata.desktop > ./dist/Catppuccin-"$FLAVOURNAME"-"$ACCENTNAME"/metadata.desktop
    sed -e s/--accentName/"$ACCENTNAME"/g -e s/--flavour/"$FLAVOURNAME"/g -e s/--aurorae/"$WINDECSTYLECODE"/g ./Resources/LookAndFeel/defaults > ./dist/Catppuccin-"$FLAVOURNAME"-"$ACCENTNAME"/contents/defaults

    # Build splash screen
    mkdir -p ./dist/"$GLOBALTHEMENAME"/contents/splash/images
    FLAVOURNAME=$FLAVOURNAME ./Installer/color-build.sh -s ./Resources/splash-screen/contents/splash/images/busywidget.svg -o ./dist/"$GLOBALTHEMENAME"/contents/splash/images/_busywidget.svg
    sed ./dist/"$GLOBALTHEMENAME"/contents/splash/images/_busywidget.svg -e s/REPLACE--ACCENT/$ACCENTCOLOR/g > ./dist/"$GLOBALTHEMENAME"/contents/splash/images/busywidget.svg
    rm ./dist/"$GLOBALTHEMENAME"/contents/splash/images/_busywidget.svg
    sed -e s/REPLACE--MANTLE/"$MANTLECOLOR"/g ./Resources/splash-screen/contents/splash/Splash.qml > ./dist/"$GLOBALTHEMENAME"/contents/splash/Splash.qml
    if [[ $FLAVOUR != "4" ]]; then
      cp ./Resources/splash-screen/contents/splash/images/Logo.png ./dist/"$GLOBALTHEMENAME"/contents/splash/images/Logo.png
    else
      cp ./Resources/splash-screen/contents/splash/images/Latte_Logo.png ./dist/"$GLOBALTHEMENAME"/contents/splash/images/Logo.png
    fi
    sed -e s/--accentName/"$ACCENTNAME"/g -e s/--flavour/"$FLAVOURNAME"/g ./Resources/splash-screen/metadata.desktop > ./dist/"$GLOBALTHEMENAME"/metadata.desktop
    mkdir -p ./dist/"$GLOBALTHEMENAME"/contents/previews
    cp ./Resources/splash-previews/"$FLAVOURNAME".png ./dist/"$GLOBALTHEMENAME"/contents/previews/splash.png
    cp ./Resources/splash-previews/"$FLAVOURNAME".png ./dist/"$GLOBALTHEMENAME"/contents/previews/preview.png

    # Build colorscheme
    sed -e s/--accentColor/$ACCENTCOLOR/g -e s/--flavour/$FLAVOURNAME/g -e s/--accentName/$ACCENTNAME/g ./Resources/Base.colors > ./dist/base.colors
    sed -e s/--accentName/$ACCENTNAME/g -e s/--flavour/$FLAVOURNAME/g ./Resources/LookAndFeel/metadata.desktop > ./dist/Catppuccin-$FLAVOURNAME-$ACCENTNAME/metadata.desktop
    sed -e s/--accentName/$ACCENTNAME/g -e s/--flavour/$FLAVOURNAME/g -e s/--aurorae/$WINDECSTYLECODE/g ./Resources/LookAndFeel/defaults > ./dist/Catppuccin-$FLAVOURNAME-$ACCENTNAME/contents/defaults
    FLAVOURNAME=$FLAVOURNAME ACCENTNAME=$ACCENTNAME ./Installer/color-build.sh -o ./dist/"Catppuccin$FLAVOURNAME$ACCENTNAME".colors -s ./dist/base.colors
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
    cp -r ./Resources/Aurorae/Catppuccin$FLAVOURNAME-Modern "$pkgdir/usr/share/aurorae/themes"
    if [[ $FLAVOURNAME = "Latte" ]]; then
      cp ./Resources/Aurorae/Common/CatppuccinLatte-Modernrc "$pkgdir/usr/share/aurorae/themes/CatppuccinLatte-Modern/CatppuccinLatte-Modernrc"
    else
      cp ./Resources/Aurorae/Common/Catppuccin-Modernrc "$pkgdir/usr/share/aurorae/themes/Catppuccin$FLAVOURNAME-Modern/Catppuccin$FLAVOURNAME-Modernrc"
    fi
  done

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
