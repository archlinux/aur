# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: ssv1982 <ssv1982@gmail.com>

pkgname=kerio-control-vpnclient
pkgver=9.4.2.7290
pkgrel=1
_pkgver_patch_level='-p1'
pkgdesc="Kerio Control VPN client for corporate networks."
arch=('x86_64')
url="http://www.kerio.com/control"
license=('custom:EULA')
options=(!strip)
install="${pkgname}.install"
depends=('procps' 'dialog' 'util-linux' 'libxcrypt-compat')
source=("https://cdn.kerio.com/dwn/control/control-${pkgver%.*}-${pkgver##*.}/kerio-control-vpnclient-${pkgver%.*}-${pkgver##*.}${_pkgver_patch_level}-linux-amd64.deb"
        "kvpnc"
        "kvpnc.conf"
        "kvpnc.service")
sha256sums=('019e015b72196b5e16c26ff6f2b365b0ddefd158520fbbd0a30a738ca7061b41'
            'a8729e2515e186f4ba4544cbd140b3bb1fc78c616694433f58944de9e4e72971'
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
