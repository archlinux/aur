# Maintainer: vani-tty1 <giovannirafanan609@gmail.com>
# No tagged released in upstream, so this is getting the tarball from a fork.


pkgname=mignon-icon-theme
pkgver=1.0.0
pkgrel=1
pkgdesc="Flat, pastel-colored icon theme for Linux"
arch=('any')
url="https://github.com/vani-tty1/Mignon-icon-theme"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3eb86b213cf4cd736c8788937c964774dcdb3ae1ca399d500e15557c8555bf31')


package() {
    cd "Mignon-icon-theme-$pkgver"

    local THEME_COLOR='#99C0ED'
    local INHERITS='Adwaita,Yaru,Cosmic,Pop,Mint-Y-Blue,breeze,breeze-dark,hicolor'
    local VARIANT THEME_NAME THEME_DIR APPS_SRC

    for VARIANT in "" "-light" "-dark"; do
        THEME_NAME="Mignon-pastel${VARIANT}"
        THEME_DIR="$pkgdir/usr/share/icons/${THEME_NAME}"

        case "$VARIANT" in
            "-light") APPS_SRC="src/scalable/apps-light" ;;
            "-dark")  APPS_SRC="src/scalable/apps-dark" ;;
            *)        APPS_SRC="src/scalable/apps" ;;
        esac

        install -d "${THEME_DIR}/scalable"

        install -m644 src/index.theme "${THEME_DIR}/"
        sed -i "s/%NAME%/${THEME_NAME//-/ }/g" "${THEME_DIR}/index.theme"
        sed -i "s/%INHERITS%/${INHERITS}/g" "${THEME_DIR}/index.theme"

        cp -a "${APPS_SRC}" "${THEME_DIR}/scalable/apps"
        cp -a src/scalable/devices "${THEME_DIR}/scalable/"
        cp -a src/scalable/mimetypes "${THEME_DIR}/scalable/"
        cp -a src/scalable/places "${THEME_DIR}/scalable/"

        sed -i "s/#5294e2/${THEME_COLOR}/g" \
            "${THEME_DIR}/scalable/apps/"*.svg \
            "${THEME_DIR}/scalable/places/"default-*.svg
        sed -i "/ColorScheme-Highlight/s/currentColor/${THEME_COLOR}/" \
            "${THEME_DIR}/scalable/places/"default-*.svg
        sed -i "/ColorScheme-Background/s/currentColor/#ffffff/" \
            "${THEME_DIR}/scalable/places/"default-*.svg

        cp -a links/scalable/* "${THEME_DIR}/scalable/"
        ln -sr "${THEME_DIR}/scalable" "${THEME_DIR}/scalable@2x"
    done

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
