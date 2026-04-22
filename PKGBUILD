pkgname=quick-dns-switcher
pkgver=1.0.2
pkgrel=2
pkgdesc="System tray application to manage DNS settings via NetworkManager"
arch=('any')
url="https://github.com/gmm96/Quick-DNS-Switcher"
license=('GPL3')
depends=(
    'python'
    'python-pyqt6'
    'networkmanager'
    'python-dbus'
)
source=(
    "${pkgname}-v${pkgver}.tar.gz::https://github.com/gmm96/Quick-DNS-Switcher/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('9ad65b30b30a3841d5a6619fa7417bc1be68cab83fe5ec3aad0183eb29679eaf')

package()
{
    APP_NAME="quick-dns-switcher"
    INSTALL_DIR="${pkgdir}/opt/${APP_NAME}"
    BIN_DIR="${pkgdir}/usr/bin"
    BIN_FILE="${BIN_DIR}/${APP_NAME}"
    DESKTOP_FILE="${pkgdir}/usr/share/applications/${APP_NAME}.desktop"
    AUTOSTART_FILE="${pkgdir}/etc/xdg/autostart/${APP_NAME}.desktop"
    ICON_DIR="${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    SHARE_DIR="${pkgdir}/usr/share/${APP_NAME}"

    cd "${srcdir}/Quick-DNS-Switcher-${pkgver}"

    # Source
    install -dm755 "${INSTALL_DIR}"
    cp -r "qds" "${INSTALL_DIR}/"
    find "${INSTALL_DIR}/qds" -type d -exec chmod 755 {} \;
    find "${INSTALL_DIR}/qds" -type f -exec chmod 644 {} \;
    install -Dm755 "${APP_NAME}.sh" "${INSTALL_DIR}/${APP_NAME}.sh"
    install -Dm644 "README.md" "${INSTALL_DIR}/README.md"
    install -Dm644 "LICENSE" "${INSTALL_DIR}/LICENSE"

    # Bin
    install -dm755 "${BIN_DIR}"
    ln -sf "/opt/${APP_NAME}/${APP_NAME}.sh" "${BIN_FILE}"

    # Config
    install -Dm644 "qds/resources/config/dns_providers.json" "${SHARE_DIR}/dns_providers.json"

    # App shortcut
    install -Dm644 "qds/resources/assets/${APP_NAME}.desktop" "${DESKTOP_FILE}"

    # Autostart
    install -Dm644 "qds/resources/assets/${APP_NAME}.desktop" "${AUTOSTART_FILE}"

    # Icons
    shopt -s nullglob
    install -dm755 "${ICON_DIR}"
    for icon in "qds/resources/assets/icons/"*".svg";
    do
        install -Dm644 "${icon}" "${ICON_DIR}/$(basename "${icon}")"
    done
    shopt -u nullglob
}
