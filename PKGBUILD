# Maintainer  : Balazs Vinarz <vinibali1@gmail.com

pkgname='domoticz-bin'
pkgver=2025.1
pkgrel=1
pkgdesc="Web based home automation"
arch=('armv7h' 'aarch64' 'x86_64')
url='https://www.domoticz.com'
conflicts=('domoticz' 'domoticz-git')
license=('GPL3')
depends=('libusb-compat' 'libcurl-gnutls' 'mosquitto')
install='domoticz.install'
get_arch_string() {
local arch="$(awk -v FS='"' '/CARCH/ {print$2}' /etc/makepkg.conf)"
case "$arch" in
  armv7h)
  echo armv7l
  ;;
  *)
  echo "$arch"
  ;;
esac
}
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/domoticz/domoticz/releases/download/${pkgver}/domoticz_linux_$(get_arch_string $arch).tgz"
        'domoticz.service')
sha256sums=('SKIP'
            '908e2848731eef27928f87936f94ff3df280901559fcf5f4754b1a8139e4a38a')

package() {
  mkdir -p "${pkgdir}/opt/domoticz"
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${srcdir}/domoticz.service" "${pkgdir}/usr/lib/systemd/system/"
  mv "${srcdir}/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cp -aRP "${srcdir}"/* "${pkgdir}/opt/domoticz"
  rm "${pkgdir}/opt/domoticz/${pkgname}-${pkgver}.tar.gz"
  chown -R http:http "${pkgdir}/opt/domoticz"
}
