# Maintainer: AOWIS

pkgname=owa-epanet-ui-bin
pkgver=1.0.2
pkgrel=7
pkgdesc="Hydraulic and water quality modeling tool for water distribution networks (EPANET) GUI"
arch=('x86_64')
url='https://github.com/OpenWaterAnalytics/EPANET-UI'
license=('custom')

provides=('epanet-ui')
conflicts=('epanet-ui')

depends=('qt5pas')

source=(
    "${pkgname}-${pkgver}.zip::https://drive.google.com/uc?export=download&id=1Pfn92pQvc44TYwuDBdCVUyAKmH1ONZVG"
    "epanet-ui.desktop"
    "epanet-ui_32.png"
    "epanet-ui_48.png"
    "epanet-ui_64.png"
    "epanet-ui_128.png"
    "epanet-ui_256.png"
)

sha256sums=(
    'c0ca66fd395efee2210422c77d29cc31c106c26fbbd055bdb548f6f243fb7900'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

package() {
    cd "$srcdir"

    install -dm755 "$pkgdir/usr/lib/epanet-ui"

    # main binary
    install -m755 epanet-ui "$pkgdir/usr/lib/epanet-ui/"

    # bundled libs
    install -m755 libepanet2.so "$pkgdir/usr/lib/epanet-ui/"
    install -m755 libepanetmsx.so "$pkgdir/usr/lib/epanet-ui/"
    install -m755 libshp.so "$pkgdir/usr/lib/epanet-ui/"

    # PROJ fix (SONAME required)
    if [[ -f libproj.so.12 ]]; then
        install -m755 libproj.so.12 "$pkgdir/usr/lib/epanet-ui/"
    elif [[ -f libproj.so ]]; then
        install -m755 libproj.so "$pkgdir/usr/lib/epanet-ui/"
        ln -sf libproj.so "$pkgdir/usr/lib/epanet-ui/libproj.so.12"
    else
        echo "ERROR: libproj not found"
        exit 1
    fi

    # launcher
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/epanet-ui" <<'EOF'
#!/bin/sh
export QT_STYLE_OVERRIDE=Fusion
exec /usr/lib/epanet-ui/epanet-ui "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/epanet-ui"

    # desktop entry
    install -Dm644 epanet-ui.desktop \
        "$pkgdir/usr/share/applications/epanet-ui.desktop"

    # =========================
    # hicolor icon theme install
    # =========================

    install -dm755 "$pkgdir/usr/share/icons/hicolor/32x32/apps"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/48x48/apps"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/64x64/apps"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/128x128/apps"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"

    install -m644 epanet-ui_32.png   "$pkgdir/usr/share/icons/hicolor/32x32/apps/epanet-ui.png"
    install -m644 epanet-ui_48.png   "$pkgdir/usr/share/icons/hicolor/48x48/apps/epanet-ui.png"
    install -m644 epanet-ui_64.png   "$pkgdir/usr/share/icons/hicolor/64x64/apps/epanet-ui.png"
    install -m644 epanet-ui_128.png  "$pkgdir/usr/share/icons/hicolor/128x128/apps/epanet-ui.png"
    install -m644 epanet-ui_256.png  "$pkgdir/usr/share/icons/hicolor/256x256/apps/epanet-ui.png"

    # documentation
    install -Dm644 ReadMeFirst.txt \
        "$pkgdir/usr/share/doc/$pkgname/ReadMeFirst.txt"

    install -Dm644 manual.html \
        "$pkgdir/usr/share/doc/$pkgname/manual.html"

    install -Dm644 tutorial.html \
        "$pkgdir/usr/share/doc/$pkgname/tutorial.html"
}
