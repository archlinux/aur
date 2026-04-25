# Maintainer: UgaUgaBamBam novaria@mailbox.org
pkgname=crucible
pkgver=0.2.6
pkgrel=1
pkgdesc="Linux launcher for Windows games via UMU and Proton"
arch=('any')
url="https://github.com/northmind/Crucible"
license=('LicenseRef-proprietary')
depends=(
    'python'
    'python-pyqt6'
    'python-pyqt6-webengine'
    'python-requests'
    'python-pillow'
    'umu-launcher'
)
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/northmind/Crucible/archive/refs/tags/v${pkgver}.tar.gz")
# Run updpkgsums before submitting to the AUR
sha256sums=('2c6a4cde11d22a67d4f7f8bdb1dd86439ba08d19ee210b08775f6c376ee6da3c')

package() {
    cd "Crucible-${pkgver}"

    # Determine the versioned site-packages path used by the system Python
    local _pyver
    _pyver=$(python3 -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')

    # Install the crucible Python package
    install -dm755 "${pkgdir}/usr/lib/python${_pyver}/site-packages"
    cp -r python/crucible "${pkgdir}/usr/lib/python${_pyver}/site-packages/crucible"

    # Launcher script
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/crucible" <<'EOF'
#!/bin/sh
exec python3 -m crucible "$@"
EOF

    # Icon — convert from bundled jpg using Pillow
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    python3 -c "
from PIL import Image
img = Image.open('python/crucible/assets/images/icon.jpg').convert('RGBA')
img = img.resize((256, 256), Image.LANCZOS)
img.save('${pkgdir}/usr/share/icons/hicolor/256x256/apps/crucible.png')
"

    # Desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/crucible.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Crucible
GenericName=Windows Game Launcher
Comment=Linux launcher for Windows games via UMU and Proton
Exec=crucible %U
Terminal=false
Categories=Game;Utility;
Keywords=crucible;proton;umu;wine;windows;games;launcher;
Icon=crucible
StartupNotify=true
StartupWMClass=crucible
EOF
}
