# Maintainer: flossbud <flossbud27@gmail.com>
pkgname=ttmt-beta
epoch=1
_upstream=0.7.0-alpha.4
pkgver=0.7.0alpha.4
pkgrel=1
pkgdesc="ToonTown MultiTool BETA, pre-release smoke-test channel. Expect bugs. For stable use, install toontown-multitool instead."
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
makedepends=('git')
source=("git+https://github.com/flossbud/ToonTown-MultiTool.git#tag=v${_upstream}")
sha256sums=('SKIP')

package() {
    cd "ToonTown-MultiTool"

    # Install Python source
    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    cp -r main.py tabs/ utils/ services/ assets/ "${pkgdir}/usr/share/${pkgname}/"

    # Launcher sets TTMT_BETA=1 so build_flavor switches.
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'EOF'
#!/bin/bash
export TTMT_BETA=1
exec python /usr/share/ttmt-beta/main.py "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # Separate desktop entry — coexists with stable.
    install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/applications/io.github.flossbud.ToonTownMultiTool-beta.desktop" << 'EOF'
[Desktop Entry]
Name=ToonTown MultiTool (Beta)
Comment=Pre-release smoke-test build, expect bugs
Exec=ttmt-beta
Icon=ttmt-beta
StartupWMClass=io.github.flossbud.ToonTownMultiTool-beta
Terminal=false
Type=Application
Categories=Game;
EOF

    # Beta-badged icon at a separate icon name so the .desktop's Icon=ttmt-beta resolves.
    install -Dm644 assets/ToonTownMultiTool-beta.png \
        "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/ttmt-beta.png"
}
