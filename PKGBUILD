# Maintainer: André Herbst <moormaster@gmx.net>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Hojjat Ali Mohammadi <safeith@gmail.com>

pkgname=cyberghostvpn
pkgver=1.4.1
pkgrel=9
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
makedepends=(
  ca-certificates
  openssl
  zip
)

_variant=ubuntu-20.04
source=(	"https://download.cyberghostvpn.com/linux/cyberghostvpn-${_variant}-${pkgver}.zip"
		"http://crt.sectigo.com/SectigoRSAOrganizationValidationSecureServerCA.crt"
		"cyberghostvpn_wrapper"
		"openvpn_wrapper")
sha256sums=(	'21f0de9993a7f73f2ed6ab8b3276d21a7a00343e77fa8e18c2fc28341a409d13'
		'72a34ac2b424aed3f6b0b04755b88cc027dccc806fddb22b4cd7c47773973ec0'
		'b9410322648fa3ff40cee9199d9dcadf51117ad633b96e3f99e57b47c75d2b80'
		'f26e37ce43385e625b012afd3d27bad9f9279e3d6cb135cd92c412eada36212e')

_archive="${pkgname}-${_variant}-${pkgver}"

prepare() {
	# workaround: build certificate to connect to wireguard servers
	# remove as soon as the certificate is provied by the package
	_wireguard_certificate_servername="washington-s403-i01.cg-dialup.net"
	_wireguard_certificate_server="102.165.48.72:1337"
	true | openssl s_client -verify 5 -connect ${_wireguard_certificate_server} -servername ${_wireguard_certificate_servername}| openssl x509 > "${srcdir}/cg-dialup-net.pem"

	sha256sum "${srcdir}/cg-dialup-net.pem"
	sha256sum --check <( echo "77504245f5d63b74a1e8a4dd34ff1c2a4eece363bfd423abc8286951455c4fd4  ${srcdir}/cg-dialup-net.pem"  )

	openssl x509 -in "${srcdir}/cg-dialup-net.pem" > "${srcdir}/wireguard_ca.crt"
}

package() {
  _installdir=usr/local/cyberghost
  install -Dm 755 openvpn_wrapper "$pkgdir/${_installdir}/wrapper/openvpn_wrapper"
  install -Dm 755 cyberghostvpn_wrapper "$pkgdir/${_installdir}/wrapper/cyberghostvpn_wrapper"
  ln -s "/${_installdir}/wrapper/openvpn_wrapper" "$pkgdir/${_installdir}/openvpn"

  install -Dm 644 "${srcdir}/wireguard_ca.crt" "$pkgdir/${_installdir}/certs/wireguard/ca.crt"

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
