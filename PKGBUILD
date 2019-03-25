# Maintainer: Aoibhinn Nic Aoidh <oibind@pm.me>
# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: alicewww <almw@protonmail.com>

pkgname=mullvad-vpn-bin-beta
_pkgname=mullvad-vpn
pkgver=2019.1
pkgrel=1
pkgdesc="VPN Client for Mullvad.net, a bitcoin-friendly VPN for anonymity and privacy"
url="https://www.mullvad.net"
arch=('x86_64')
license=('GPL3')
depends=('gconf' 'gtk3' 'libnotify' 'libappindicator-gtk2' 'libxss' 'nss')
conflicts=('mullvad-vpn-old')
replaces=('mullvad-vpn-old')
provides=($_pkgname)
backup=()
install=

source=(mullvad-daemon.service
mullvad-vpn.desktop
"https://mullvad.net/media/app/MullvadVPN-${pkgver}-beta1_x86_64.rpm"{,.asc})

sha256sums=('77b71d613ef09c6ffbcfa66a59f787246f64d4463843e648edc6fbbea18dd55e'
            '8090fcecc2e07cb3e384387f14a181c4acf7ee01db53dad322b51649a1f5dc24'
            '32f0f60e0f6b3cc138ec9bc7ec4d4c7d7214c6cdc319402f0a559a747e5533df'
            'SKIP')
validpgpkeys=('A1198702FC3E0A09A9AE5B75D5A1D4F266DE8DDF')

package() {
    # Install systemd service
    install -Dm644 mullvad-daemon.service "${pkgdir}/usr/lib/systemd/system/mullvad-daemon.service"

    # Install the main files.
    install -d "${pkgdir}/opt/${_pkgname}"
    cp -a "${srcdir}/opt/Mullvad VPN/." "${pkgdir}/opt/${_pkgname}"

    # Make it exec
    chmod 755 "${pkgdir}/opt/${_pkgname}/${pkgname}"

    # Main binary
    mkdir -p ${pkgdir}/usr/bin
    ln -s "/opt/${_pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # Desktop Entry
    install -d "${pkgdir}/usr/share/applications"
    install ${_pkgname}.desktop "${pkgdir}/usr/share/applications"
    sed -i s%/usr/share%/opt% ${pkgdir}/usr/share/applications/${_pkgname}.desktop

    # CLI binary
    install -m755 "${srcdir}/usr/bin/mullvad" "${pkgdir}/usr/bin/mullvad"

    # Icons
    install -dm755 "${pkgdir}/usr/share/icons/hicolor"
    cp -a "${srcdir}/usr/share/icons/hicolor/." "${pkgdir}/usr/share/icons/hicolor"

    echo -------------------------------------------------------------
    echo 'Make sure to enable and run the mullvad daemon'
    echo 'For systemd, do systemctl enable --now mullvad-daemon'
    echo -------------------------------------------------------------

}
