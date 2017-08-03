# Maintainer: IanDury

pkgname=domoticz-latest
pkgver=3.8153
pkgrel=2
pkgdesc="Web based home automation"
arch=('x86_64' 'arm' 'armv6h' 'armv7h')
url="http://www.domoticz.com"
license=('GPL')
depends=('openzwave-git' 'libusb-compat' 'curl' 'sqlite' 'boost-libs' 'libcurl-compat' 'openssl-1.0')
conflicts=('domoticz-svn' 'domoticz-git' 'domoticz-beta' 'domoticz')
install='domoticz.install'
case $CARCH in
  armv8*)
    _target_arch=aarch64
    ;;
  arm*)
    _target_arch=armv7l
    ;;
  *)
    _target_arch=$CARCH
    ;;
esac

source=("https://releases.domoticz.com/releases/release/domoticz_linux_${_target_arch}.tgz"
        "https://releases.domoticz.com/releases/release/history_linux_${_target_arch}.txt"
        'domoticz.service')
sha256sums=('SKIP' 'SKIP'
            '10f8c51d5ee4c2e42510e877ae891cb1290d14e601d0cb6c59fdf1dbb0538249')

pkgver() {
  echo "$(grep ^Version history_linux_${_target_arch}.txt | head -1 | cut -d' ' -f2)"
}

package() {
  mkdir -p  "${pkgdir}/opt/domoticz/"
  cp -R Config domoticz History.txt License.txt scripts server_cert.pem www domoticz.sh history_linux_${_target_arch}.txt "${pkgdir}/opt/domoticz/"
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  cp ../domoticz.service "${pkgdir}/usr/lib/systemd/system/"
  chown -R http:http "${pkgdir}/opt/domoticz"
}
