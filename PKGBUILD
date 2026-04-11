# Maintainer: Your Name <your.email@example.com>
pkgname=lution
pkgver=0.3.2
pkgrel=1
pkgdesc="Third-party bootstrapper for Sober runtime - Bloxstrap clone for Linux"
arch=('any')
url="https://github.com/Wookhq/Lution"
license=('MIT')
depends=(
    'python'
    'pyside6'
    'python-requests'
    'qt6-webengine'
    'python-streamlit' 
    'python-pygithub'
    'python-rich'
    'python-toml'
)
optdepends=(
    'rsync: For faster and smarter updates of the user directory'
)
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/stable-v${pkgver}.tar.gz")
sha256sums=('f8ba90af5a84c5715387e40c977135a59148a5999bb2d83a88b317053ddf85f5')

package() {
    cd "Lution-stable-v${pkgver}"

    # Install application source
    install -d "${pkgdir}/usr/share/${pkgname}"
    # Use src/Lution/. to ensure hidden files like .streamlit are copied
    cp -r src/Lution/. "${pkgdir}/usr/share/${pkgname}/"

    # Remove duplicates that we will install to proper system paths
    rm -f "${pkgdir}/usr/share/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/${pkgname}/files/lution1.svg"
    rm -f "${pkgdir}/usr/share/${pkgname}/files/lution1.png"

    # Install Launcher (Modified to sync updates)
    cat > "${srcdir}/lution-launcher" << 'LAUNCHER'
#!/bin/bash
set -e

# App location
SYSTEM_DIR="/usr/share/lution"
USER_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/lution"

# Ensure user directory matches system directory (Syncs updates)
# We use rsync to efficiently mirror the system dir to user dir
if command -v rsync &> /dev/null; then
    mkdir -p "$USER_DIR"
    rsync -a --delete "$SYSTEM_DIR/" "$USER_DIR/"
else
    # Fallback to copy if rsync is missing
    # We remove the directory first to ensure no stale files remain
    if [ -d "$USER_DIR" ]; then 
        rm -rf "$USER_DIR"
    fi
    mkdir -p "$(dirname "$USER_DIR")"
    cp -r "$SYSTEM_DIR" "$USER_DIR"
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