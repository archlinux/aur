# Maintainer: alicewww <almw@protonmail.com>
pkgname=mullvad-vpn
pkgver=2018.2
pkgrel=1
pkgdesc="VPN Client for Mullvad.net, a bitcoin-friendly VPN for anonymity and privacy"
url="https://www.mullvad.net"
arch=('any')
license=('GPLv3')
depends=(rpmextract gcc openssl libappindicator-gtk2 libappindicator-gtk3 rust yarn nodejs)
makedepends=()
conflicts=(mullvad-vpn-new)
replaces=(mullvad)
backup=()
install=
 
source=(LICENSE.md mullvad-daemon.service mullvad-vpn.desktop "https://github.com/mullvad/mullvadvpn-app/releases/download/${pkgver}/MullvadVPN-${pkgver}_x86_64.rpm")

sha256sums=('8951bda6e616df7418ff3f80d9699f96da704df64f3bc9f0d5bb75a103680456' '77b71d613ef09c6ffbcfa66a59f787246f64d4463843e648edc6fbbea18dd55e' '8090fcecc2e07cb3e384387f14a181c4acf7ee01db53dad322b51649a1f5dc24' '8f687d304e6d4ef25a33c570cbf5e4016f25e172854a0b45aad2f25339c748ac')

package() {
    #unpack rpm
    rpmextract.sh MullvadVPN-${pkgver}_x86_64.rpm -C $pkgdir

    #install systemd service
    install -Dm644 mullvad-daemon.service "$pkgdir/usr/lib/systemd/system/mullvad-daemon.service"

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
  ln -s "/opt/Mullvad VPN/mullvad-vpn" "${pkgdir}/usr/bin/${pkgname}"

  #icons
  install -dm755 "${pkgdir}/usr/share/icons/hicolor"
  cp -a "${srcdir}/usr/share/icons/hicolor/." "${pkgdir}/usr/share/icons/hicolor"

  # License
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  
  echo -------------------------------------------------------------
    echo 'Make sure to enable and run the mullvad daemon'
    echo 'For systemd, do systemctl enable mullvad-daemon'
    echo 'then do systemct start mullvad-daemon'
echo -------------------------------------------------------------

}

