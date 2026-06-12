# Maintainer: flossbud <flossbud27@gmail.com>
pkgname=toontown-multitool
epoch=1
pkgver=0.7.0alpha.4
pkgrel=1
_upstream=0.7.0-alpha.4
pkgdesc="Multiboxing input control for Toontown Rewritten and Corporate Clash"
arch=('any')
url="https://github.com/flossbud/ToonTown-MultiTool"
license=('MIT')
depends=(
    'python'
    'pyside6'
    'qt6-svg'
    'python-pynput'
    'python-requests'
    'python-keyring'
    'python-certifi'
    'python-cryptography'
    'python-xlib'
    'python-secretstorage'
    'python-jeepney'
    'python-psutil'
    'python-yaml'
    'xdotool'
)
source=("${pkgname}-${_upstream}.tar.gz::https://github.com/flossbud/ToonTown-MultiTool/archive/refs/tags/v${_upstream}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "ToonTown-MultiTool-${_upstream}"

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
