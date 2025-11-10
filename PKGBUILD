# Maintainer: Richard Hillmann <richie at project0 dot de>
pkgname=awsvpnclient
pkgver=5.3.1
pkgrel=2
pkgdesc="AWS VPN Client"
arch=('x86_64')
license=('custom')
url='https://aws.amazon.com/vpn/'
source=(
  "$pkgname-$pkgver.deb::https://d20adtppz83p9s.cloudfront.net/GTK/${pkgver}/awsvpnclient_amd64.deb"
  'awsvpnclient.desktop.patch'
)
sha512sums=('dcb662f360c8475d5aad07983467a8be0617a19180d97229f7b2f49b66ec478cb40146aa66aa138229c77cd0d5ae1d7490612b51ce6b4d52d5922e206e746669'
            '78021ec181929a58aab0c0dd191c54fbc57cc8d2137983f322fe84a878bb1a3040caffde5f45879b311612bc4f125f44b0fad702754bc274b6b86c2ef9654c10')
depends=('xdg-utils' 'lsof')
makedepends=('zstd')
options=('!strip' 'staticlibs')
install='awsvpnclient.install'

package(){
  tar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"

  # Apply patch to fix desktop file
  patch -s "${pkgdir}/usr/share/applications/awsvpnclient.desktop" "${srcdir}/awsvpnclient.desktop.patch"

  # Workaround for missing compatibility of the SQL library with arch linux:
  # Intentionally break the metrics agent,
  # it will be unable to laod the dynamic lib and wont start but continue with error message
  chmod 000 "${pkgdir}/opt/awsvpnclient/libe_sqlite3.so"

  # Permission fix
  find "${pkgdir}" -type d -exec chmod 755 {} +

  # License
  install -Dm644 "${pkgdir}/opt/awsvpnclient/Resources/LINUX-LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgdir}/usr/share/doc/awsvpnclient/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}
