# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: ssv1982 <ssv1982@gmail.com>

pkgname=kerio-control-vpnclient
pkgver=9.2.5.2587
pkgrel=1
_pkgver_patch_level='-p2'
pkgdesc="Kerio Control VPN client for corporate networks."
arch=('x86_64')
url="http://www.kerio.com/control"
license=('custom:EULA')
options=(!strip)
install="${pkgname}.install"
depends=('procps' 'dialog' 'util-linux')
source=("http://download.kerio.com/dwn/control/control-${pkgver%.*}-${pkgver##*.}/kerio-control-vpnclient-${pkgver%.*}-${pkgver##*.}${_pkgver_patch_level}-linux-amd64.deb"
        "kvpnc"
        "kvpnc.conf"
        "kvpnc.service")
sha256sums=('74f171e6faa3d1ea33e96e57c797a974043b8c49cd19dd9e6053bfcf5c80142e'
            '984ac81f6fe291ca11a4dc6822bcb1e7efaf82d14259f5395247fdbdef4c1759'
            '2f15a0d88c9fa915cd9150796638811daec911e6824b8ff5f96f131352d1e74a'
            'bd8b1aabc31b9b24c4b63ce8099bef111dc84bd4923c77d42e05d3f1704d5c17')

build() {
  # Get binary sources.
  bsdtar -xf "data.tar.xz"

  # Extract license file
  gzip -dfc "usr/share/doc/${pkgname}/EULA.txt.gz" > "EULA.txt"
}

package() {
  # Install files in the package
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 -t "${pkgdir}/usr/bin" "kvpnc"

  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" "usr/sbin/kvpncsvc"

  install -m 755 -d "${pkgdir}/usr/lib"
  install -m 644 -t "${pkgdir}/usr/lib" "usr/lib"/*

  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "usr/share/doc/${pkgname}/Acknowledgments.gz"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "usr/share/doc/${pkgname}/copyright"

  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "EULA.txt"

  # Install configuration file
  install -m 755 -d "${pkgdir}/etc/conf.d"
  install -m 644 -t "${pkgdir}/etc/conf.d" kvpnc.conf

  # Install systemd service
  install -m 755 -d "${pkgdir}/usr/lib/systemd/system"
  install -m 644 -t "${pkgdir}/usr/lib/systemd/system" kvpnc.service
}
