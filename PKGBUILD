# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: ssv1982 <ssv1982@gmail.com>

pkgname=kerio-control-vpnclient-9.2.7
_pkgname=${pkgname%-*}
pkgver=9.2.7.2921
pkgrel=1
pkgdesc="Kerio Control VPN client for corporate networks (version 9.2.7, the last compatible version for older Kerio Control 9.2.6 VPN servers)."
arch=('x86_64')
url="http://www.kerio.com/control"
license=('custom:EULA')
options=(!strip)
install="${pkgname}.install"
depends=('procps' 'dialog' 'util-linux')
conflicts=('kerio-control-vpnclient')
source=("http://download.kerio.com/dwn/control/control-${pkgver%.*}-${pkgver##*.}/kerio-control-vpnclient-${pkgver%.*}-${pkgver##*.}-linux-amd64.deb"
        "kvpnc"
        "kvpnc.conf"
        "kvpnc.service")
sha256sums=('05efa0b2abc3affd5258b6ba64533609bc59ae016282ab3fd2865c1ee368e54f'
            '984ac81f6fe291ca11a4dc6822bcb1e7efaf82d14259f5395247fdbdef4c1759'
            'b4d0915cc9de186ff4efe5c91b3b011e7819d67f93ef62c8feafd29baa599bd8'
            'bd8b1aabc31b9b24c4b63ce8099bef111dc84bd4923c77d42e05d3f1704d5c17')

build() {
  # Get binary sources.
  bsdtar -xf "data.tar.xz"

  # Extract license file
  gzip -dfc "usr/share/doc/${_pkgname}/EULA.txt.gz" > "EULA.txt"
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
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "usr/share/doc/${_pkgname}/Acknowledgments.gz"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "usr/share/doc/${_pkgname}/copyright"

  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "EULA.txt"

  # Install configuration file
  install -m 755 -d "${pkgdir}/etc/conf.d"
  install -m 644 -t "${pkgdir}/etc/conf.d" kvpnc.conf

  # Install systemd service
  install -m 755 -d "${pkgdir}/usr/lib/systemd/system"
  install -m 644 -t "${pkgdir}/usr/lib/systemd/system" kvpnc.service
}
