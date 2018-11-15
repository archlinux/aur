# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: alicewww <almw@protonmail.com>
pkgname=mullvad-vpn
pkgver=2018.5
pkgrel=2
pkgdesc="VPN Client for Mullvad.net, a bitcoin-friendly VPN for anonymity and privacy"
url="https://www.mullvad.net"
arch=('x86_64')
license=('GPL3')
depends=('gconf' 'gtk3' 'libnotify' 'libappindicator-gtk2' 'libxss' 'nss')
conflicts=('mullvad-vpn-old')
replaces=('mullvad-vpn-old')
provides=($pkgname)
backup=()
install=
 
source=(mullvad-daemon.service
"https://github.com/mullvad/mullvadvpn-app/releases/download/${pkgver}/MullvadVPN-${pkgver}_${arch}.rpm")

md5sums=('ed3a49275addbd5f2098a33bd605f1d3'
         '6bfc025b561423625cfb140a38f6f4cd')

package() {
    # Install systemd service
    install -Dm644 mullvad-daemon.service "${pkgdir}/usr/lib/systemd/system/mullvad-daemon.service"

    # Install the main files.
    install -d "${pkgdir}/opt/${pkgname}"
    cp -a "${srcdir}/opt/Mullvad VPN/." "${pkgdir}/opt/${pkgname}"

    # Make it exec
    chmod 755 "${pkgdir}/opt/${pkgname}/${pkgname}"

    # Main binary
    mkdir -p ${pkgdir}/usr/bin
    ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

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
