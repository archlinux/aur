# Maintainer: fr0stb1rd <fr0stb1rd@proton.me>

pkgname=jubbio-bin
_pkgname=jubbio
pkgver=3.8.5
pkgrel=1
pkgdesc="Official desktop client for Jubbio (community chat & voice platform)"
arch=('x86_64')
url="https://jubbio.com"
license=('LicenseRef-proprietary')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'cups'
    'dbus'
    'expat'
    'glib2'
    'gtk3'
    'hicolor-icon-theme'
    'libcups'
    'libdrm'
    'libnotify'
    'libsecret'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'libxss'
    'libxtst'
    'mesa'
    'nspr'
    'nss'
    'pango'
    'systemd-libs'
    'xdg-utils'
)
optdepends=(
    'libappindicator-gtk3: Status tray icon support'
    'org.freedesktop.secrets: Password and token credential storage'
)
provides=("${_pkgname}" "${_pkgname}-client")
conflicts=("${_pkgname}" "${_pkgname}-client")
options=('!strip' '!debug')

source=(
    "${_pkgname}.desktop"
    "${_pkgname}.png"
)
source_x86_64=("${pkgname}-${pkgver}.deb::https://cdn.jubbio.com/downloads/v${pkgver}/Jubbio.deb")
sha512sums=('870726a3806b8e113789930b9c0ad8ee114f0af338af24b0d8936bf9e318f786423acca9fbce28c1cb2fdbe68920c7a52e7c220d0a23d94fae4dee33257c2152'
            'd6138717ab0626837f86de6a734f198319d70a7acf79fc982420b1b1436620eb33e02d095883d19e5aef35e796cf1028febf9187cec18d97fb38b34e7147d9ac')
sha512sums_x86_64=('75707ae6decf785e0b28a1a6a3ed2f05c8bfedfff306ddea7fe1fd04f511ebdc9cf7ae677ee403ee8dfe5db944b12acf2036e572db47dea6c76954511bb2cb93')

package() {
    # Extract data archive unpacked by makepkg into $srcdir
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"

    # Remove upstream deb desktop file and deb icons
    rm -f "${pkgdir}/usr/share/applications/${_pkgname}-client.desktop"
    rm -rf "${pkgdir}/usr/share/icons"

    # Install binary symlinks
    install -d "${pkgdir}/usr/bin"
    ln -sf "/opt/Jubbio/jubbio-client" "${pkgdir}/usr/bin/${_pkgname}"
    ln -sf "/opt/Jubbio/jubbio-client" "${pkgdir}/usr/bin/${_pkgname}-client"

    # Install main desktop entry
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Install fallback desktop entry for Wayland app_id (hidden from app menu)
    install -d "${pkgdir}/usr/share/applications"
    cat << EOF > "${pkgdir}/usr/share/applications/${_pkgname}-client.desktop"
[Desktop Entry]
Name=Jubbio
Exec=/usr/bin/${_pkgname} %U
Terminal=false
Type=Application
Icon=${_pkgname}
StartupWMClass=${_pkgname}-client
NoDisplay=true
EOF

    # Install icon to hicolor and pixmaps
    install -Dm644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
    ln -sf "${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}-client.png"

    install -d "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    ln -sf "${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}-client.png"

    # Set appropriate permissions
    chmod -R u=rwX,go=rX "${pkgdir}/opt/Jubbio"
    chmod +x "${pkgdir}/opt/Jubbio/jubbio-client"
    chmod +x "${pkgdir}/opt/Jubbio/chrome_crashpad_handler"
    chmod 4755 "${pkgdir}/opt/Jubbio/chrome-sandbox"

    # Install licenses
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    if [ -f "${pkgdir}/opt/Jubbio/LICENSES.chromium.html" ]; then
        ln -sf "/opt/Jubbio/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
    fi
    if [ -f "${pkgdir}/opt/Jubbio/LICENSE.electron.txt" ]; then
        ln -sf "/opt/Jubbio/LICENSE.electron.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    fi
}
