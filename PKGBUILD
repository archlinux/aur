# Maintainer: flossbud <flossbud27@gmail.com>
pkgname=toontown-multitool
pkgver=2.2.0
pkgrel=1
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
    cp -r main.py tabs/ utils/ services/ assets/ "${pkgdir}/usr/share/${pkgname}/"

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
    install -Dm644 io.github.flossbud.ToonTownMultiTool.desktop \
        "${pkgdir}/usr/share/applications/io.github.flossbud.ToonTownMultiTool.desktop"

    # Install icon
    install -Dm644 AppDir/io.github.flossbud.ToonTownMultiTool.png \
        "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/io.github.flossbud.ToonTownMultiTool.png"
    install -Dm644 flatpak/icon-512.png \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/io.github.flossbud.ToonTownMultiTool.png"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
