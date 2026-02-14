# Maintainer: Renato de Oliveira <renatoi at github>
pkgname=azeron-software
pkgver=1.5.6
pkgrel=1
pkgdesc='Configuration tool for Azeron keypads (unofficial Linux repackage)'
arch=('x86_64')
url='https://github.com/renatoi/azeron-linux'
license=('custom:proprietary')
depends=('hidapi' 'libusb' 'gtk3' 'nss' 'alsa-lib')
makedepends=('npm' 'nodejs' 'p7zip')
optdepends=('dfu-util: firmware updates')
options=('!strip')
_electron_ver=30.0.9
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/renatoi/azeron-linux/archive/refs/tags/v${pkgver}.tar.gz"
        "electron-${_electron_ver}.zip::https://github.com/electron/electron/releases/download/v${_electron_ver}/electron-v${_electron_ver}-linux-x64.zip")
noextract=("electron-${_electron_ver}.zip")
sha256sums=('SKIP'
            'SKIP')

prepare() {
    cd "azeron-linux-${pkgver}"

    # Install root build dependencies
    npm install --ignore-scripts

    # Rebuild node-hid for Linux targeting Electron
    cd app
    npm install node-hid@2.2.0
    cd ..
    npx @electron/rebuild -f -w node-hid -m app -v "${_electron_ver}"

    # Apply Linux patches
    node scripts/patch-main.js

    # Remove Windows-only files
    rm -f app/node_modules/ps-list/vendor/fastlist*.exe 2>/dev/null || true
    rm -rf app/dist/win-unpacked 2>/dev/null || true
}

build() {
    cd "azeron-linux-${pkgver}"

    # Cache the electron zip so electron-builder doesn't re-download
    mkdir -p "${HOME}/.cache/electron"
    cp "${srcdir}/electron-${_electron_ver}.zip" \
       "${HOME}/.cache/electron/electron-v${_electron_ver}-linux-x64.zip" 2>/dev/null || true

    npx electron-builder --linux dir
}

package() {
    cd "azeron-linux-${pkgver}"

    local _appdir="${pkgdir}/opt/${pkgname}"

    # Install app
    install -dm755 "${_appdir}"
    cp -r output/linux-unpacked/* "${_appdir}/"

    # Binary symlink
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/azeron-software-v1" "${pkgdir}/usr/bin/azeron-software"

    # Desktop file
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/azeron-software.desktop" <<DESKTOP
[Desktop Entry]
Name=Azeron Software
Comment=Configuration tool for Azeron keypads
Exec=/opt/${pkgname}/azeron-software-v1 --no-sandbox %U
Icon=azeron-software
Terminal=false
Type=Application
Categories=Utility;HardwareSettings;
DESKTOP

    # Icon
    install -Dm644 build/icon.png "${pkgdir}/usr/share/pixmaps/azeron-software.png"

    # Udev rules
    install -Dm644 assets/99-azeron.rules "${pkgdir}/usr/lib/udev/rules.d/99-azeron.rules"

    # License
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<LICENSE
This is an unofficial repackage of the Azeron keypad configuration software.
The original Azeron Software is proprietary software by Azeron SIA.
Firmware binaries are property of Azeron LTD.
See https://azeron.eu for more information.
LICENSE
}
