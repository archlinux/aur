# Maintainer: Victor de Jong <victor@victordejong.com>
pkgname=openvpn-nl
pkgver=2.5.10nl1
pkgrel=1
pkgdesc="An open-source fork of OpenVPN for use by the NL government up to Dep.V."
arch=('x86_64')
url="https://openvpn.fox-it.com/"
license=('GPL-2.0-only')
depends=('systemd-libs' 'glibc' 'perl' 'sh' 'bash')
makedepends=('gnupg')
source=(
	"https://openvpn.fox-it.com/repos/deb/dists/jammy/Release" 
	"https://openvpn.fox-it.com/repos/deb/dists/jammy/Release.gpg"
	"https://openvpn.fox-it.com/repos/deb/dists/jammy/main/binary-amd64/Packages"
	"https://openvpn.fox-it.com/repos/deb/pool/main/o/${pkgname}/${pkgname}_${pkgver::-3}-nl1-jammy_amd64.deb"
)
sha512sums=(
	'd899f46ffc50ba56a8b523970b24a3189a34cc5422c8dbfe10a0fe3590927ed3275b777862d82e190fbe7cda31f77570d316bd06bf5c79ec7ffe93a86a2e98d9'
	'accdb4f55e2d8b0ad6d0a8e80f3ae4c646295bf733165eeda765b166ef7019709f3ecfaca041e39988bdb6265c62bb9f4a268608f5f03ea473682a3f827d8703'
	'2544a077aea8e03164ecdc02a0ef9dd1ce8c3a1ea1f037e2f2d76c729e21b20b60515421e9f29ccb68aafb4060ff386c48e990c998831fb61c07eb24155fabb0'
	'66b537ceaf927618946687ba593429c7820887ff248037d5ed768f62f9d59d6142f2f73b7d1532473469451b2d39f599955616ac5cd971928913fd307752ba5d'
)
validpgpkeys=('A518F75374D3AF82AE11810A13DF39ED913F5D8F')

prepare() {
	# Set colour, yellow and reset respectively
	_YEL='\033[1;33m'
	_RED='\033[0;31m'
	_NC='\033[0m'
	echo -e "${_YEL}Verifying Release file with GPG key...${_NC}"
	gpg --verify Release.gpg Release || (echo -e "${_RED}There is something wrong with the signature! Either this package is compromised or you need to import the key from https://openvpn.fox-it.com/repos/fox-crypto-gpg.asc${_NC}" && exit 1)
	echo -e "${_YEL}Verifying Packages file with previously verified Release file...${_NC}"
	(sed -n 17p Release | awk '{print $1 " Packages"}' | sha256sum --check --status --strict && echo "OK") || (echo -e "${_RED}There is something wrong with the SHA256 hash! This package is likely compromised and should not be used!${_NC}" && exit 1)
	echo -e "${_YEL}Verifying ${pkgname}_${pkgver::-3}-nl1-jammy_amd64.deb package with previously verified Packages file...${_NC}"
	(sed -n 12p Packages | awk -v name=${pkgname}_${pkgver::-3}-nl1-jammy_amd64.deb '{print $2 " " name}' | sha256sum --check --status --strict && echo "OK") || (echo -e "${_RED}There is something wrong with the SHA256 hash! This package is likely compromised and should not be used!${_NC}" && exit 1)
}

package() {
	cd "${srcdir}"
	tar -xf data.tar.zst -C "${srcdir}"
	install -vDm755 ${srcdir}/usr/sbin/openvpn-nl ${pkgdir}/usr/bin/openvpn-nl
	cp -r ${srcdir}/etc ${pkgdir}/etc
	cp -r ${srcdir}/usr/share ${pkgdir}/usr/share
	cp -r ${srcdir}/lib/ ${pkgdir}/usr
}
