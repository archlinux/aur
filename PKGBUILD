# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: alicewww <almw@protonmail.com>

pkgname=mullvad-vpn
pkgver=2019.8
pkgrel=2
pkgdesc="VPN Client for Mullvad.net, a bitcoin-friendly VPN for anonymity and privacy"
_github_url="https://github.com/mullvad/mullvadvpn-app"
url="https://www.mullvad.net"
arch=('x86_64')
license=('GPL3')
depends=('gconf' 'gtk3' 'libnotify' 'libappindicator-gtk2' 'libxss' 'nss')
conflicts=('mullvad-vpn-old')
replaces=('mullvad-vpn-old')
provides=($pkgname)
backup=()
install=
validpgpkeys=("A1198702FC3E0A09A9AE5B75D5A1D4F266DE8DDF")
source=("https://github.com/mullvad/mullvadvpn-app/releases/download/${pkgver}/MullvadVPN-${pkgver}_${arch}.rpm"
"https://github.com/mullvad/mullvadvpn-app/releases/download/${pkgver}/MullvadVPN-${pkgver}_${arch}.rpm.asc")

md5sums=('e1c7ad82a8cfe126bb0175d820752086'
         'SKIP')

package() {
    # Install systemd service
    sed -i 's/Mullvad\\x20VPN/mullvad-vpn/g' "opt/Mullvad VPN/resources/mullvad-daemon.service"
    install -Dm644 "opt/Mullvad VPN/resources/mullvad-daemon.service" \
        "${pkgdir}/usr/lib/systemd/system/mullvad-daemon.service"

    # Install the main files.
    install -d "${pkgdir}/opt/${pkgname}"
    cp -a "${srcdir}/opt/Mullvad VPN/." "${pkgdir}/opt/${pkgname}"

    # Make it exec
    chmod 755 "${pkgdir}/opt/${pkgname}/mullvad-gui"

    # Main binary
    mkdir -p ${pkgdir}/usr/bin
    ln -s "/opt/${pkgname}/mullvad-gui" "${pkgdir}/usr/bin/${pkgname}"

    # Desktop Entry
    install -d "${pkgdir}/usr/share/applications"
    sed -i 's/Exec=.*/Exec=\/usr\/bin\/mullvad-vpn/g' \
        "usr/share/applications/${pkgname}.desktop"
    install -Dm644 "usr/share/applications/${pkgname}.desktop" \
        "$pkgdir/usr/share/applications/${pkgname}.desktop"

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
