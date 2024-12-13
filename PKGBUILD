# Maintainer: Richard Hillmann <richie at project0 dot de>
pkgname=awsvpnclient
pkgver=4.1.0
pkgrel=2
pkgdesc="AWS VPN Client"
arch=('x86_64')
license=('custom')
url='https://aws.amazon.com/vpn/'
source=(
  "$pkgname-$pkgver.deb::https://d20adtppz83p9s.cloudfront.net/GTK/${pkgver}/awsvpnclient_amd64.deb"
  'awsvpnclient.desktop.patch'
)
sha512sums=('415a5ebe52f1093e0a51bedb7f422431458db484249a52707645a0f7bdf34b12e829bddf4d62255da402c2a070cbe3e374a5db7d2bb006bcef440fa1c60740d0'
            'dbf6f6fab74e6bf167055a7c4b9aa7413d677ea0d2d06b8194610a12fb181cfb649bafc2779b21c25514724a6da53c4c86fb486d95e344c2f940929bf6d02b33')
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
  chmod 000 "${pkgdir}/opt/awsvpnclient/SQLite.Interop.dll"

  # Permission fix
  find "${pkgdir}" -type d -exec chmod 755 {} +

  # License
  install -Dm644 "${pkgdir}/opt/awsvpnclient/Resources/LINUX-LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgdir}/usr/share/doc/awsvpnclient/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}
