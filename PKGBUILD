# Maintainer: Victor de Jong <victor@victordejong.com>
pkgname=openvpn-nl
pkgver=2.5.11nl1
pkgrel=1
pkgdesc="An open-source fork of OpenVPN for use by the NL government up to Dep.V."
arch=('x86_64')
url="https://openvpn.fox-it.com/"
license=('GPL-2.0-only')
depends=('systemd-libs' 'glibc' 'perl' 'sh' 'bash')
makedepends=('gnupg')
source=(
	"https://openvpn.fox-it.com/repos/deb/dists/noble/Release" 
	"https://openvpn.fox-it.com/repos/deb/dists/noble/Release.gpg"
	"https://openvpn.fox-it.com/repos/deb/dists/noble/main/binary-amd64/Packages"
	"https://openvpn.fox-it.com/repos/deb/pool/main/o/${pkgname}/${pkgname}_${pkgver::-3}-nl1-noble_amd64.deb"
)
sha512sums=(
	'0ed457e0a71f9bf96f639345e0c48b59be1ac633fa68862dc6ae8ca732144267efbeba84c7a9d403b05d51136658fb19ff4881790e570e3c6820513032625ab4'
	'83deac5fc56fd68fcc907325bbc0ed30bbc532041f7f547220bfb07e27d921d3bbb11ecff3ff9256ba6d64cf194bd2f427d2ebe1ba7c05f1aa8f9dd2b70898ad'
	'242c8af0fc2e13443b5e7bd3cc185184bcc916a03b162396c2fc27f423239968b02d04d67dd985f1e72c3f3b532a844ad100a1226432b329537da7088843a4ed'
	'd321d20c2b80c8692f8a4cbe3e67706041738a5079f0fef0f191cdf574edc1ea835545c731ff8ee9e9d2e8dbcb88cb5e315afc3de40ecfa3c25b0f9c754ca764'
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
	echo -e "${_YEL}Verifying ${pkgname}_${pkgver::-3}-nl1-noble_amd64.deb package with previously verified Packages file...${_NC}"
	(sed -n 12p Packages | awk -v name=${pkgname}_${pkgver::-3}-nl1-noble_amd64.deb '{print $2 " " name}' | sha256sum --check --status --strict && echo "OK") || (echo -e "${_RED}There is something wrong with the SHA256 hash! This package is likely compromised and should not be used!${_NC}" && exit 1)
}

package() {
	cd "${srcdir}"
	tar -xf data.tar.zst -C "${srcdir}"
	install -vDm755 ${srcdir}/usr/sbin/openvpn-nl ${pkgdir}/usr/bin/openvpn-nl
	cp -r ${srcdir}/etc ${pkgdir}/etc
	cp -r ${srcdir}/usr/share ${pkgdir}/usr/share
}
