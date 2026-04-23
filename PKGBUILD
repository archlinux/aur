# Maintainer: flossbud <flossbud27@gmail.com>
pkgname=toontown-multitool
pkgver=2.0.1
pkgrel=2
pkgdesc="Multiboxing input control for Toontown Rewritten and Corporate Clash"
arch=('any')
url="https://github.com/flossbud/ToonTown-MultiTool"
license=('MIT')
depends=(
    'python'
    'pyside6'
    'python-pynput'
    'python-requests'
    'python-keyring'
    'python-certifi'
    'python-cryptography'
    'python-xlib'
    'python-secretstorage'
    'python-jeepney'
    'xdotool'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/flossbud/ToonTown-MultiTool/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "ToonTown-MultiTool-${pkgver}"

    # Install Python source
    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    cp -r main.py tabs/ utils/ services/ "${pkgdir}/usr/share/${pkgname}/"

    # Install launcher script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'EOF'
#!/bin/bash
exec python /usr/share/toontown-multitool/main.py "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # Symlink ttmt -> toontown-multitool
    ln -s "${pkgname}" "${pkgdir}/usr/bin/ttmt"

    # Install desktop entry
    cat > "${pkgname}.desktop" << 'DESKTOP'
[Desktop Entry]
Name=ToonTown MultiTool
Comment=Multiboxing input control for Toontown
Exec=toontown-multitool
Icon=toontown-multitool
Type=Application
Categories=Game;
DESKTOP
    install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Install icon
    install -Dm644 AppDir/ToonTownMultiTool.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
