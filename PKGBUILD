# Maintainer: Connor Prussin <connor at prussin dot net>

# If you find problems with the package, create an issue on Github:
# https://github.com/cprussin/avpnc

pkgname=avpnc
pkgver=1.5
pkgrel=1
pkgdesc="Aviatrix VPN Client. Helps connect to VPN Networks. Supports SAML and password based authentication"
arch=('any')
url='http://docs.aviatrix.com/Downloads/samlclient.html'
license=('custom')
depends=('gedit>=2.0.0' 'openvpn>=2.3.0' 'zlib' 'openresolv')
makedepends=('imagemagick')
options=(!strip emptydirs)
source=(https://s3-us-west-2.amazonaws.com/aviatrix-download/AviatrixVPNClient/dev/AVPNC_debian.deb
        logrotate
        service)
sha512sums=('21fe71a81db93586caafb90a5736cfd222b109ea7170cda54e31aafdb7007f14108fd88a7de537c4feb85e4430ade4005109fb5982e2ff7e757beba44c309222'
            '4a64702faa88eda3150d8ad144a2359e55914f8041545ef0335990de5f546ae9b9eac00d56ebc8b4937077ad6d3694f66ce9c16014cc2f89b3a2dc599172569a'
            '1f47bbe3f6e37c5ce61fd94097fea19b46288e4fafd3aeccf30c37f710df8b7102c027d473be4dc7041451a507ce8ec74e10ab09c1ec4bf92c0bc2df1880a7e1')

package() {
  bsdtar -xf ${srcdir}/data.tar.xz -C ${srcdir}/

  # Install files to their correct locations (avpnc upstream has a really
  # nonstandard structure)
  install -Dm755 ${srcdir}/usr/bin/AVPNC_bin/AVPNC \
          ${pkgdir}/usr/bin/${pkgname}
  install -Dm755 ${srcdir}/usr/bin/AVPNC_bin/AVPNC_RP \
          ${pkgdir}/usr/bin/${pkgname}_rp
  install -Dm755 ${srcdir}/usr/bin/AVPNC_bin/scripts/linux.sh \
          ${pkgdir}/usr/bin/${pkgname}_resolvconf
  install -Dm644 ${srcdir}/usr/share/doc/avpnc/copyright \
          ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 ${srcdir}/usr/bin/AVPNC_bin/AVPNC.desktop \
          ${pkgdir}/usr/share/applications/${pkgname}.desktop

  # Convert icon to correct size and install into correct location
  mkdir -p ${pkgdir}/usr/share/icons/hicolor/128x128/apps
  chmod 755 ${pkgdir}/usr/share/icons/hicolor/128x128/apps
  convert -resize 128x128 ${srcdir}/usr/bin/AVPNC_bin/Avi.png \
          ${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png

  # Update paths in desktop file
  sed -e "s|/bin/AVPNC_bin/Avi.png|/share/icons/hicolor/128x128/apps/${pkgname}.png|" \
      -e "s|AVPNC_bin/AVPNC|${pkgname}|" \
      -e "s|Path=/usr/bin/AVPNC_bin|Path=/var/log/${pkgname}|" \
      -i ${pkgdir}/usr/share/applications/${pkgname}.desktop

  # Install log directory
  mkdir -p ${pkgdir}/var/log/${pkgname}
  chmod 755 ${pkgdir}/var/log/${pkgname}

  # Install local scripts
  install -Dm644 ../logrotate ${pkgdir}/etc/logrotate.d/${pkgname}
  install -Dm644 ../service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
}
