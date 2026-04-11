# Maintainer: MiguVT <contacto@miguvt.com>
pkgname=lution
pkgver=0.3.2
pkgrel=2
pkgdesc="Third-party bootstrapper for Sober runtime - Bloxstrap clone for Linux"
arch=('any')
url="https://github.com/Wookhq/Lution"
license=('MIT')
depends=(
    'bash'
    'hicolor-icon-theme'
    'python'
    'pyside6'
    'python-requests'
    'qt6-webengine'
    'python-streamlit' 
    'python-pygithub'
    'python-pillow'
    'python-numpy'
    'python-packaging'
    'python-py7zr'
    'python-rich'
    'python-toml'
)
optdepends=(
    'rsync: For faster and smarter updates of the user directory'
)
conflicts=("${pkgname}-git")
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/stable-v${pkgver}.tar.gz"
    'streamlit-logo-fix.patch'
)
sha256sums=('33bc5a523d481dbb97bd56839cda1344772e42a61a3e8ebf9f4a3c32595d6198'
            'db54d846e7b9364dd73c2f2123318650c6a09369a72174a585ab8ceae049e289')

prepare() {
    cd "Lution-stable-v${pkgver}"
    patch -Np1 -i "${srcdir}/streamlit-logo-fix.patch"
}

package() {
    cd "Lution-stable-v${pkgver}"

    # Install application source
    install -d "${pkgdir}/usr/share/${pkgname}"
    # Use src/Lution/. to ensure hidden files like .streamlit are copied
    cp -r src/Lution/. "${pkgdir}/usr/share/${pkgname}/"

    # Remove duplicated license (app keeps its runtime assets in files/)
    rm -f "${pkgdir}/usr/share/${pkgname}/LICENSE"

    # Install Launcher (Modified to sync updates)
    cat > "${srcdir}/lution-launcher" << 'LAUNCHER'
#!/bin/bash
set -e

# App location
SYSTEM_DIR="/usr/share/lution"
USER_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/lution"

# Sync app files from system directory without deleting user-local files.
# This keeps local state/custom files intact while still updating bundled files.
if command -v rsync &> /dev/null; then
    mkdir -p "$USER_DIR"
    rsync -a "$SYSTEM_DIR/" "$USER_DIR/"
else
    # Fallback copy also preserves user-local files by avoiding destructive replace.
    mkdir -p "$USER_DIR"
    cp -a "$SYSTEM_DIR/." "$USER_DIR/"
    chmod -R u+w "$USER_DIR"
fi

cd "$USER_DIR"
exec python launch.py "$@"
LAUNCHER

    install -Dm755 "${srcdir}/lution-launcher" "${pkgdir}/usr/bin/${pkgname}"

    # Install desktop entry
    cat > "${srcdir}/lution.desktop" << 'DESKTOP'
[Desktop Entry]
Name=Lution
GenericName=Roblox Bootstrapper
Comment=Bloxstrap clone for Linux - Upgrade your Sober experience
Exec=lution
Icon=lution
Terminal=false
Type=Application
Categories=Game;Utility;
Keywords=roblox;sober;bloxstrap;linux;
StartupWMClass=lution
StartupNotify=true
DESKTOP
    install -Dm644 "${srcdir}/lution.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Install icons
    install -Dm644 "src/Lution/files/lution1.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "src/Lution/files/lution1.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
