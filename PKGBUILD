# Maintainer: telans <telans@protonmail.com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: alicewww <almw@protonmail.com>

pkgname=mullvad-vpn-beta
_pkgname=mullvad-vpn
pkgver=2019.7.stable
_pkgver=2019.7
pkgrel=1
pkgdesc="VPN Client for Mullvad.net (latest/beta release)."
_github_url="https://github.com/mullvad/mullvadvpn-app"
url="https://www.mullvad.net"
arch=('x86_64')
license=('GPL3')
depends=('gconf' 'gtk3' 'libnotify' 'libappindicator-gtk2' 'libxss' 'nss')
conflicts=('mullvad-vpn')
replaces=('mullvad-vpn-old')
provides=($_pkgname)
validpgpkeys=("A1198702FC3E0A09A9AE5B75D5A1D4F266DE8DDF")
source=("https://github.com/mullvad/mullvadvpn-app/releases/download/${_pkgver}/MullvadVPN-${_pkgver}_${arch}.rpm"
        "https://github.com/mullvad/mullvadvpn-app/releases/download/${_pkgver}/MullvadVPN-${_pkgver}_${arch}.rpm.asc")

md5sums=('3e3632b9b3d3769aebfba42c31d9e756'
         'SKIP')

install=$pkgname.install

package() {
    # /opt/ Contents
    install -d "${pkgdir}/opt/${_pkgname}"
    cp -a "${srcdir}/opt/Mullvad VPN/." "${pkgdir}/opt/${_pkgname}"
    chmod 755 "${pkgdir}/opt/${_pkgname}/${_pkgname}"
    
    # /usr/bin/ Contents
    mkdir -p ${pkgdir}/usr/bin
    ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -m755 "${srcdir}/usr/bin/mullvad" "${pkgdir}/usr/bin/mullvad"

    # Systemd Service
    sed -i 's|Mullvad\\x20VPN|mullvad-vpn|g' "${pkgdir}/opt/${_pkgname}/resources/mullvad-daemon.service"
    install -Dm644 "${pkgdir}/opt/${_pkgname}/resources/mullvad-daemon.service" \
        "${pkgdir}/usr/lib/systemd/system/mullvad-daemon.service"

    # Desktop Entry
    sed -i 's|Mullvad VPN|mullvad-vpn|g' "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icons
    install -dm755 "${pkgdir}/usr/share/icons/hicolor"
    cp -a "${srcdir}/usr/share/icons/hicolor/." "${pkgdir}/usr/share/icons/hicolor"
}
