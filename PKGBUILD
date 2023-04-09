# Maintainer: André Herbst <moormaster@gmx.net>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Hojjat Ali Mohammadi <safeith@gmail.com>

pkgname=cyberghostvpn
pkgver=1.4.1
pkgrel=5
pkgdesc="CyberGhost VPN"
url="https://www.cyberghostvpn.com"
arch=(any)
license=(custom:cyberghostvpn)
depends=(
  bash
  curl
  openvpn
  wireguard-tools
  resolvconf
)
makedepends=(zip)

_variant=ubuntu-20.04
source=(	"https://download.cyberghostvpn.com/linux/cyberghostvpn-${_variant}-${pkgver}.zip"
		"cyberghostvpn_wrapper"
		"openvpn_wrapper")
sha256sums=(	'b80941fd044cd7ac230743e9dc18e3ff636ac209e7c04fdf2619428f8043fc76'
		'388e6b86db32e6fb513769257e58efb32392fe5f020cc8bb2f67a506ac59206e'
		'f26e37ce43385e625b012afd3d27bad9f9279e3d6cb135cd92c412eada36212e')

_archive="${pkgname}-${_variant}-${pkgver}"

package() {
  _installdir=usr/local/cyberghost
  install -Dm 755 openvpn_wrapper "$pkgdir/${_installdir}/wrapper/openvpn_wrapper"
  install -Dm 755 cyberghostvpn_wrapper "$pkgdir/${_installdir}/wrapper/cyberghostvpn_wrapper"
  ln -s "/${_installdir}/wrapper/openvpn_wrapper" "$pkgdir/${_installdir}/openvpn"

  cd "$_archive"

  install -Dm 755 cyberghost/cyberghostvpn "$pkgdir/${_installdir}/cyberghostvpn"
  install -Dm 755 cyberghost/update-systemd-resolved "$pkgdir/${_installdir}/update-systemd-resolved"

  install -Dm 644 cyberghost/certs/openvpn/ca.crt "$pkgdir/${_installdir}/certs/openvpn/ca.crt"
  install -Dm 644 cyberghost/certs/openvpn/client.crt "$pkgdir/${_installdir}/certs/openvpn/client.crt"
  install -Dm 644 cyberghost/certs/openvpn/client.key "$pkgdir/${_installdir}/certs/openvpn/client.key"

  install -dm 755 $pkgdir/usr/bin
  ln -s /${_installdir}/wrapper/cyberghostvpn_wrapper $pkgdir/usr/bin/cyberghostvpn
  ln -s /${_installdir}/update-systemd-resolved $pkgdir/usr/bin/update-systemd-resolved
}
