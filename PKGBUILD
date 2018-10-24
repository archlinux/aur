# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: alicewww <almw@protonmail.com>
pkgname=mullvad-vpn
pkgver=2018.4
pkgrel=1
pkgdesc="VPN Client for Mullvad.net, a bitcoin-friendly VPN for anonymity and privacy"
url="https://www.mullvad.net"
arch=('x86_64')
license=('GPL3')
depends=(openssl gtk3 gconf libxss nss)
makedepends=(rpmextract)
conflicts=(mullvad-vpn-old)
replaces=(mullvad-vpn-old)
provides=($pkgname)
backup=()
install=
 
source=(LICENSE.md mullvad-daemon.service mullvad-vpn.desktop "https://github.com/mullvad/mullvadvpn-app/releases/download/${pkgver}/MullvadVPN-${pkgver}_x86_64.rpm")

md5sums=('5ce903a740b8b693400618c62409e14d'
         'ed3a49275addbd5f2098a33bd605f1d3'
         '9628b4f93e72f5cca0a47087ae10b0fd'
         '184d6d2fd19832e3316f65adc2f97028')

package() {
    # Install systemd service
    install -Dm644 mullvad-daemon.service "${pkgdir}/usr/lib/systemd/system/mullvad-daemon.service"

    # Install the main files.
    install -d "${pkgdir}/opt/${pkgname}"
    cp -a "${srcdir}/opt/Mullvad VPN/." "${pkgdir}/opt/${pkgname}"

    # Make it exec
    chmod 755 "${pkgdir}/opt/${pkgname}/${pkgname}"

    # Desktop Entry
    install -d "${pkgdir}/usr/share/applications"
    install ${pkgname}.desktop "${pkgdir}/usr/share/applications"
    sed -i s%/usr/share%/opt% ${pkgdir}/usr/share/applications/${pkgname}.desktop

    # Main binary
    mkdir -p ${pkgdir}/usr/bin
    ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # Icons
    install -dm755 "${pkgdir}/usr/share/icons/hicolor"
    cp -a "${srcdir}/usr/share/icons/hicolor/." "${pkgdir}/usr/share/icons/hicolor"

    # License
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

    echo -------------------------------------------------------------
    echo 'Make sure to enable and run the mullvad daemon'
    echo 'For systemd, do systemctl enable --now mullvad-daemon'
    echo -------------------------------------------------------------

}
