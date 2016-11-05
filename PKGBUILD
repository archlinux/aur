# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: ssv1982 <ssv1982@gmail.com>

pkgname=kerio-control-vpnclient_8_5
_pkgname=${pkgname%%_*}
pkgver=8.5.3.3469
pkgrel=2
pkgdesc="Kerio Control VPN client for corporate networks (version 8.5, the last compatible VPN Client for older Kerio WinRoute Firewall 6.x)."
arch=('i686' 'x86_64')
url="http://www.kerio.com/control"
license=('custom:EULA')
options=(!strip)
install="${pkgname}.install"
depends=('procps' 'dialog')
depends_i686=('util-linux')
depends_x86_64=('lib32-util-linux' 'lib32-gcc-libs' 'lib32-openssl')
conflicts=('kerio-control-vpnclient')
source=("http://download.kerio.com/dwn/control/control-${pkgver%.*}-${pkgver##*.}/kerio-control-vpnclient-${pkgver%.*}-${pkgver##*.}-linux.deb"
        "kvpnc"
        "kvpnc.conf"
        "kvpnc.service")
sha256sums=('0aa1f9f6edd9c6fc4b08f0235a23f3afa608da4aada05f22ed5703ad341a42ba'
            '984ac81f6fe291ca11a4dc6822bcb1e7efaf82d14259f5395247fdbdef4c1759'
            '2f15a0d88c9fa915cd9150796638811daec911e6824b8ff5f96f131352d1e74a'
            'bd8b1aabc31b9b24c4b63ce8099bef111dc84bd4923c77d42e05d3f1704d5c17')

build() {
  # Get binary sources.
  bsdtar -xf "data.tar.gz"

  # Extract license file
  gzip -dfc "usr/share/doc/${_pkgname}/EULA.txt.gz" > "EULA.txt"
}

package() {
  # Determine destination folder for libraries
  if [ "$CARCH" = "x86_64" ]; then
    _libdir=lib32
  else
    _libdir=lib
  fi

  # Install files in the package
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 -t "${pkgdir}/usr/bin" "kvpnc"

  install -m 755 -d "${pkgdir}/usr/lib/${_pkgname}"
  install -m 755 -t "${pkgdir}/usr/lib/${_pkgname}" "usr/sbin/kvpncsvc"

  install -m 755 -d "${pkgdir}/usr/${_libdir}"
  install -m 644 -t "${pkgdir}/usr/${_libdir}" "usr/lib"/*

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
