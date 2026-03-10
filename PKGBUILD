# Maintainer: guglovich <jinseoyeon@archlinux>
# Created with assistance from Claude (Anthropic)

pkgname=xdat-editor-next-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="XDAT Editor - edit interface.xdat Lineage 2 client file, modern fork with Java 21+ (prebuilt)"
arch=('x86_64')
url="https://github.com/nascimentolh/XDAT_NEW"
license=('MIT')
depends=('java-runtime>=21' 'java-openjfx')
options=('!strip')
keywords=('xdat' 'xdat-editor' 'lineage2' 'lineage-2' 'l2' 'java' 'game')

source=(
    "xdat-editor-${pkgver}.zip::https://github.com/nascimentolh/XDAT_NEW/releases/download/v${pkgver}/xdat-editor-${pkgver}.zip"
)
b2sums=(
    '39cb55ef4493c786d884bb193bcc99e5e8a4d8d4e7e6ec25574aa45a40300fcf6640016f603176b9e6543b898833f70bc26ac010efee50e094f1ecf0391da3dc'
)

package() {
    install -dm755 "${pkgdir}/usr/share/${pkgname}/lib"
    find "${srcdir}" -maxdepth 1 -name "*.jar" -exec cp {} "${pkgdir}/usr/share/${pkgname}/lib/" \;

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/xdat-editor-next" << 'EOF'
#!/bin/bash
LIBDIR="/usr/share/xdat-editor-next-bin/lib"

[ -f /usr/bin/java-openjfx-env ] && source /usr/bin/java-openjfx-env

if java --list-modules 2>/dev/null | grep -q "javafx.controls"; then
    exec java -jar "${LIBDIR}/xdat-editor-1.6.0.jar" "$@"
elif [ -n "$OPENJFX_MODULES_PATH" ]; then
    exec java --module-path "$OPENJFX_MODULES_PATH" \
        -Djava.library.path="$OPENJFX_LIBRARY_PATH" \
        --add-modules javafx.controls,javafx.fxml,javafx.graphics \
        -jar "${LIBDIR}/xdat-editor-1.6.0.jar" "$@"
else
    echo "JavaFX not found! Install java-openjfx from AUR."
    exit 1
fi
EOF
    chmod 755 "${pkgdir}/usr/bin/xdat-editor-next"

    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/xdat-editor-next.desktop" << 'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=XDAT Editor
Comment=Edit interface.xdat Lineage 2 client file
Exec=xdat-editor-next %f
Icon=xdat-editor
Categories=Utility;
Terminal=false
EOF
}