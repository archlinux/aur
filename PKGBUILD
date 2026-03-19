# Maintainer: Alp Sahin <alp@sahin.club>

pkgname=zenflow-bin
pkgver=0.0.103
pkgrel=1
pkgdesc="Zenflow - AI-powered task management desktop application"
arch=('x86_64')
url="https://zencoder.ai/"
license=('Apache-2.0')
depends=(
    'gtk3'
    'libnotify'
    'nss'
    'libxss'
    'libxtst'
    'xdg-utils'
    'at-spi2-core'
    'util-linux-libs'
    'libsecret'
)
optdepends=(
    'libappindicator-gtk3: for system tray support'
)
makedepends=('curl')
provides=('zenflow')
conflicts=('zenflow')
options=('!strip' '!debug')

# Source is downloaded manually in prepare() due to server requiring Chrome user-agent
source=()
sha256sums=()
noextract=()

_download_url="https://download.zencoder.ai/zenflowapp/latest/linux-x64/Zenflow.deb"
_user_agent="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"

prepare() {
    cd "${srcdir}"

    # Download the .deb file (requires Chrome user-agent)
    if [[ ! -f "zenflow.deb" ]]; then
        echo "Downloading Zenflow..."
        curl -L -A "${_user_agent}" -o "zenflow.deb" "${_download_url}"
    fi

    # Extract the .deb package
    ar x "zenflow.deb"

    # Extract control info to verify version
    tar -xzf control.tar.gz

    # Extract data
    tar -xf data.tar.xz

    # Verify downloaded version matches expected version
    _downloaded_ver=$(grep -oP 'Version: \K.*' control)
    if [[ "${_downloaded_ver}" != "${pkgver}" ]]; then
        echo "WARNING: Downloaded version (${_downloaded_ver}) does not match pkgver (${pkgver})"
        echo "Please update the PKGBUILD to version ${_downloaded_ver}"
        return 1
    fi
}

package() {
    cd "${srcdir}"

    # Install application files to /opt
    install -dm755 "${pkgdir}/opt/Zenflow"
    cp -r opt/Zenflow/* "${pkgdir}/opt/Zenflow/"

    # Set correct permissions for executables
    chmod 755 "${pkgdir}/opt/Zenflow/zenflow-desktop"
    chmod 755 "${pkgdir}/opt/Zenflow/chrome_crashpad_handler"
    chmod 4755 "${pkgdir}/opt/Zenflow/chrome-sandbox"

    # Install desktop file
    install -Dm644 usr/share/applications/zenflow-desktop.desktop \
        "${pkgdir}/usr/share/applications/zenflow-desktop.desktop"

    # Install icon
    install -Dm644 usr/share/icons/hicolor/0x0/apps/zenflow-desktop.png \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/zenflow-desktop.png"

    # Create symlink for CLI access
    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/Zenflow/zenflow-desktop "${pkgdir}/usr/bin/zenflow"
}
