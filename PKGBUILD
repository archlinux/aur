# Maintainer: Connor Dickey <kd9lsv@kd9lsv.me>
pkgname=aethersdr-bin
pkgver=26.11.3
pkgrel=2
pkgdesc="Native amateur-radio workstation for FlexRadio transceivers"
arch=('x86_64' 'aarch64')
url="https://www.aethersdr.com/"
license=('GPL-3.0-only')
depends=('fuse2' 'hicolor-icon-theme')
provides=('aethersdr')
conflicts=('aethersdr')
options=('!strip' '!debug')
_appimage="AetherSDR-v${pkgver}-${CARCH}.AppImage"
source=("${_appimage}::https://github.com/aethersdr/AetherSDR/releases/download/v${pkgver}/${_appimage}")
sha256sums=('93ec14fca3e33cfc7f7f0fcd3922549f81d4d2e47de2321c390ef6b447fa90e7')

prepare() {
    local _appimage="AetherSDR-v${pkgver}-${CARCH}.AppImage"
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

package() {
    local _appimage="AetherSDR-v${pkgver}-${CARCH}.AppImage"

    # Install the AppImage binary into /usr/lib
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/usr/lib/${pkgname}/${_appimage}"

    # Symlink to /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/aethersdr"

    # Install desktop entry
    install -Dm644 "${srcdir}/squashfs-root/"*.desktop -t "${pkgdir}/usr/share/applications/"
    sed -i 's|Exec=.*|Exec=/usr/bin/aethersdr %U|' "${pkgdir}/usr/share/applications/"*.desktop

    # Install only actual icon files with proper 0644/0755 permissions
    find "${srcdir}/squashfs-root/usr/share/icons" -type f -exec install -Dm644 {} "${pkgdir}/usr/share/icons/hicolor/256x256/apps/aethersdr.png" \;
}

