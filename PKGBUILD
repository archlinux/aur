# Maintainer: Richard Hillmann <richie at project0 dot de>
pkgname=awsvpnclient
pkgver=3.2.0
pkgrel=1
pkgdesc="AWS VPN Client"
arch=('x86_64')
license=('custom')
url='https://aws.amazon.com/vpn/'
source=(
  "$pkgname-$pkgver.deb::https://d20adtppz83p9s.cloudfront.net/GTK/${pkgver}/awsvpnclient_amd64.deb"
  'awsvpnclient.desktop.patch'
  'awsvpnclient.runtimeconfig.json.patch'
)
sha512sums=('249006ee9a1ac0e6ffb79e76a5d81c5be3cfa06a2edfc1b39ae6406af718b8ba29563dddcb4860fbd3efab5b03bc9cca64f9c390838fe3c16abd886ff847cd7a'
            '0c32ba0b81ac1123dd6123ee2f4b7573957eab76ae40708e2acfd28b15c9b1717b63450d40bddf449e088b0cf202faac466bd4d7bd79cf2a032735190b625c20'
            '1d45e50de14b9e10b6463692df63bfb4cbedfed952022c95f05bde46ece37ac1a433b76e49f255f38b1bd67c0f0f13d2d8c963051a144553c63149e6041d6603')
# some people reported issue with missing/incompatible openssl libraries,
# so we add 1.1 as dependency until AWS updates their client
depends=('xdg-utils' 'lsof' 'openssl-1.1')
makedepends=('xz')
options=('!strip' 'staticlibs')
install='awsvpnclient.install'

package(){
  tar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"

  # Apply patch to fix desktop file for KDE
  patch -s "${pkgdir}/usr/share/applications/awsvpnclient.desktop" "${srcdir}/awsvpnclient.desktop.patch"

  # Apply patch for broken ICU detection, no localisation
  patch -s "${pkgdir}/opt/awsvpnclient/AWS VPN Client.runtimeconfig.json" "${srcdir}/awsvpnclient.runtimeconfig.json.patch"
  patch -s "${pkgdir}/opt/awsvpnclient/Service/ACVC.GTK.Service.runtimeconfig.json" "${srcdir}/awsvpnclient.runtimeconfig.json.patch"
  # Workaround for missing compatibility of the SQL library with arch linux:
  # Intentionally break the metrics agent,
  # it will be unable to laod the dynamic lib and wont start but continue with error message
  chmod 000 "${pkgdir}/opt/awsvpnclient/SQLite.Interop.dll"

  # Permission fix
  find "${pkgdir}" -type d -exec chmod 755 {} +

  # License
  install -Dm644 "${pkgdir}/opt/awsvpnclient/Resources/LINUX-LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgdir}/usr/share/doc/awsvpnclient/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}
