# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Maintainer: Timofey Brukhanchik <asyncbtd@gmail.com>
# Contributor: ssv1982 <ssv1982@gmail.com>

pkgname=kerio-control-vpnclient-9.5-p3
pkgver=9.5.0.9017
pkgrel=1
pkgdesc="Kerio Control VPN client for corporate networks. version 9.5.0-9017-p3"
arch=('x86_64')
url="http://www.kerio.com/control"
license=('custom:EULA')
options=(!strip)
install="${pkgname}.install"
depends=('procps' 'dialog' 'util-linux' 'libxcrypt-compat')
source=(
  "https://cdn.kerio.com/dwn/control/control-9.5.0-9017/kerio-control-vpnclient-9.5.0-9017-p3-linux-amd64.deb"
)
sha256sums=('bcfa7919d0a944a150097e7a0942f191d7e6d00b306c2707270223e9d8b91475')

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
