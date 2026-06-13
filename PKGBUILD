# Maintainer: Alex3236 <me@alex3236.moe>

pkgname=pineapple-notepad-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="A Qt 6, KDE Framework and Scintilla-based Cross-Platform Notepad++ Alternative"
arch=('x86_64')
url="https://github.com/BLumia/pineapple-notepad"
license=('custom:Pineapple Notepad EULA')
depends=(
    'gcc-libs'
    'glibc'
    'kcodecs'
    'kcolorscheme'
    'kconfig'
    'kconfigwidgets'
    'kcoreaddons'
    'ki18n'
    'kiconthemes'
    'kwidgetsaddons'
    'kxmlgui'
    'qt6-5compat'
    'qt6-base'
)
makedepends=('patchelf')
optdepends=('breeze: Breeze widget style for Qt (recommended for best experience)')
provides=('pineapple-notepad')
conflicts=('pineapple-notepad')
source=(
    "${pkgname}-${pkgver}-deepin.deb::https://github.com/BLumia/pineapple-notepad/releases/download/${pkgver}-freeware/pineapple-notepad-deepin-crimson-x86_64-${pkgver}.deb"
    "${pkgname}-${pkgver}-debian.deb::https://github.com/BLumia/pineapple-notepad/releases/download/${pkgver}-freeware/pineapple-notepad-debian-trixie-x86_64-${pkgver}.deb"
    "LICENSE::https://raw.githubusercontent.com/BLumia/pineapple-notepad/master/LICENSE"
)
sha256sums=(
    'd11bcd168fe51690999bb8ce998fa777bfacccefbbd2d68dac2378a06985d1d8'
    '31a6ca692d1ffb51bf6bf971665d61ea59cb979ec88d653c2cbacf974c77dbaa'
    'SKIP'
)

package() {
    cd "$srcdir"

    # Extract deepin .deb for main binary and common files
    mkdir deepin && cd deepin
    ar x "$srcdir/${pkgname}-${pkgver}-deepin.deb"
    tar xzf data.tar.gz
    cd "$srcdir"

    # Extract debian .deb for bundled libs (compatible with Arch Qt6)
    mkdir debian && cd debian
    ar x "$srcdir/${pkgname}-${pkgver}-debian.deb"
    tar xzf data.tar.gz
    cd "$srcdir"

    # Use deepin binary (no copy relocations)
    install -Dm755 deepin/usr/bin/pnotepad "$pkgdir/usr/bin/pnotepad"

    # Use debian bundled libs (resolve on Arch Qt6)
    install -dm755 "$pkgdir/usr/lib/pineapple-notepad"
    install -m755 debian/usr/lib/x86_64-linux-gnu/liblexilla.so "$pkgdir/usr/lib/pineapple-notepad/liblexilla.so"
    install -m755 debian/usr/lib/x86_64-linux-gnu/libscintilla-qt.so "$pkgdir/usr/lib/pineapple-notepad/libscintilla-qt.so"

    patchelf --set-rpath '$ORIGIN/../lib/pineapple-notepad' "$pkgdir/usr/bin/pnotepad"

    # Common files from deepin
    install -Dm644 deepin/usr/share/applications/net.blumia.pineapple-notepad.desktop "$pkgdir/usr/share/applications/net.blumia.pineapple-notepad.desktop"
    install -Dm644 deepin/usr/share/icons/hicolor/scalable/apps/net.blumia.pineapple-notepad.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/net.blumia.pineapple-notepad.svg"
    install -Dm644 deepin/usr/share/metainfo/net.blumia.pineapple-notepad.metainfo.xml "$pkgdir/usr/share/metainfo/net.blumia.pineapple-notepad.metainfo.xml"

    for lang_dir in deepin/usr/share/locale/*/; do
        lang=$(basename "$lang_dir")
        install -Dm644 "deepin/usr/share/locale/${lang}/LC_MESSAGES/pineapple-notepad.mo" \
            "$pkgdir/usr/share/locale/${lang}/LC_MESSAGES/pineapple-notepad.mo"
    done

    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
