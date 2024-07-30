# Maintainer: Richard Hillmann <richie at project0 dot de>
pkgname=awsvpnclient
pkgver=3.14.0
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
sha512sums=('02d7f2edbdaf785d308029e91eb1ac97d57f62a236d089d787c9e726a127d74e8dc19fa09ad3979c9ec1d4b64a01801fbb9bfdcc6adfc79fa1b95d0e4bd0be9f'
            '615154162a69b99f5e3f7ab450ea7fbd58e944075bd762e3ceacfb1a71e8faa894de2595d8b72cde143702a0f8d2844c2b847d403ae528b4d3c48ab195a1df2b'
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
