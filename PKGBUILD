# Maintainer: telans <telans@protonmail.com>
# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: alicewww <almw@protonmail.com>

pkgname=mullvad-vpn-beta
_pkgname=mullvad-vpn
pkgver=2019.7
_betaver=beta1
pkgrel=1
pkgdesc="VPN Client for Mullvad.net, a bitcoin-friendly VPN for anonymity and privacy"
_github_url="https://github.com/mullvad/mullvadvpn-app"
url="https://www.mullvad.net"
arch=('x86_64')
license=('GPL3')
depends=('gconf' 'gtk3' 'libnotify' 'libappindicator-gtk2' 'libxss' 'nss')
conflicts=('mullvad-vpn-old' 'mullvad-vpn')
replaces=('mullvad-vpn-old' 'mullvad-vpn')
provides=($_pkgname)
validpgpkeys=("A1198702FC3E0A09A9AE5B75D5A1D4F266DE8DDF")
source=(mullvad-daemon.service
        mullvad-vpn.desktop
        "https://github.com/mullvad/mullvadvpn-app/releases/download/${pkgver}-${_betaver}/MullvadVPN-${pkgver}-${_betaver}_${arch}.rpm"
        "https://github.com/mullvad/mullvadvpn-app/releases/download/${pkgver}-${_betaver}/MullvadVPN-${pkgver}-${_betaver}_${arch}.rpm.asc")

md5sums=('ed3a49275addbd5f2098a33bd605f1d3'
         '9628b4f93e72f5cca0a47087ae10b0fd'
         '8525f785caa496c20c097440e40ed16b'
         'SKIP')

install=$pkgname.install

package() {
    install -Dm644 mullvad-daemon.service "${pkgdir}/usr/lib/systemd/system/mullvad-daemon.service"

    install -d "${pkgdir}/opt/${_pkgname}"
    cp -a "${srcdir}/opt/Mullvad VPN/." "${pkgdir}/opt/${_pkgname}"

    chmod 755 "${pkgdir}/opt/${_pkgname}/${_pkgname}"

    mkdir -p ${pkgdir}/usr/bin
    ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -d "${pkgdir}/usr/share/applications"
    install ${_pkgname}.desktop "${pkgdir}/usr/share/applications"
    sed -i s%/usr/share%/opt% ${pkgdir}/usr/share/applications/${_pkgname}.desktop

    install -m755 "${srcdir}/usr/bin/mullvad" "${pkgdir}/usr/bin/mullvad"

    install -dm755 "${pkgdir}/usr/share/icons/hicolor"
    cp -a "${srcdir}/usr/share/icons/hicolor/." "${pkgdir}/usr/share/icons/hicolor"
}
