# Maintainer: Victor de Jong <victor@victordejong.com>
# Contributor: Victor de Jong <victor@victordejong.com>

pkgname=openvpn-nl
pkgver=2.5.11nl3
pkgrel=1
pkgdesc="An open-source fork of OpenVPN for use by the NL government up to Dep.V."
arch=('x86_64')
url="https://openvpn.sentyron.com/"
options=('!debug')

license=('GPL-2.0-only')
depends=('systemd-libs' 'glibc' 'perl' 'bash')
makedepends=('gnupg')
source=(
	"https://openvpn.sentyron.com/repos/deb/dists/trixie/Release"
	"https://openvpn.sentyron.com/repos/deb/dists/trixie/Release.gpg"
	"https://openvpn.sentyron.com/repos/deb/dists/trixie/main/binary-amd64/Packages"
	"https://openvpn.sentyron.com/repos/deb/pool/main/o/${pkgname}/${pkgname}_${pkgver::-3}-nl3-trixie_amd64.deb"
)
sha512sums=(
	'400bd9c0bc4efd1ed6a0e481c4fcdb1e55ad43391026fa16ae3bd65a58ddf37ff191212ae8cd25f166b111fb30b66d7c3aff45f4a21438836751209b3ba7291a'
	'5c03e2e0dd0921d9f40cff6d32c0767bd29c4858479c2556cc3aea6a49ab9eaee0cd83d3b768b7967a6045e5a12861432dcbe88ff314c7a84dc56af07ba1311a'
	'5c74429aa4dbe0d8773acdc4fe960f5c166533dc6fa498223b4b4dbf1e02134f384cca060ee7937d9e23592e58489a2a8fe943cab5618842f3477576a6a87d49'
	'89f330305793933a560888b1727be756ca06cc05f662deea23ced793df76a8255808692da8dc2935b0f9c22e7545882294626d687b50fb19fc6f7a0fb562370b'
)
validpgpkeys=('A518F75374D3AF82AE11810A13DF39ED913F5D8F')

prepare() {
	# Set colour, yellow and reset respectively
	_YEL='\033[1;33m'
	_RED='\033[0;31m'
	_NC='\033[0m'
	_GREEN="\e[92m"
	echo -e "${_YEL}Verifying Release file with GPG key...${_NC}"
	(gpg --verify Release.gpg Release && echo -e "${_GREEN}OK${_NC}") \
		|| (echo -e "${_RED}There is something wrong with the signature. Either this package is compromised or you need to import the key from https://openvpn.sentyron.com/repos/sentyron-gpg.asc${_NC}" && exit 1)

	echo -e "${_YEL}Verifying Packages file with previously verified Release file...${_NC}"
	(sed -n 17p Release | awk '{print $1 " Packages"}' | sha256sum --check --status --strict && echo -e "${_GREEN}OK${_NC}") \
		|| (echo -e "${_RED}There is something wrong with the SHA256 hash! This package is likely compromised and should not be used!${_NC}" && exit 1)

	echo -e "${_YEL}Verifying ${pkgname}_${pkgver::-3}-nl3-trixie_amd64.deb package with previously verified Packages file...${_NC}"
	(sed -n 12p Packages | awk -v name=${pkgname}_${pkgver::-3}-nl3-trixie_amd64.deb '{print $2 " " name}' | sha256sum --check --status --strict && echo -e "${_GREEN}OK${_NC}") \
		|| (echo -e "${_RED}There is something wrong with the SHA256 hash! This package is likely compromised and should not be used!${_NC}" && exit 1)
}

package() {
	cd "${srcdir}"
	tar -xf data.tar.xz -C "${srcdir}"
	install -vDm755 "${srcdir}/usr/sbin/openvpn-nl" "${pkgdir}/usr/bin/openvpn-nl"
	cp -r "${srcdir}/etc" "${pkgdir}/etc"
	cp -r "${srcdir}/usr/share" "${pkgdir}/usr/share"
}
