# Maintainer: Victor de Jong <victor@victordejong.com>
pkgname=openvpn-nl
pkgver=2.5.6
pkgrel=1
pkgdesc="An open-source fork of OpenVPN for use by the NL government up to Dep.V."
arch=('x86_64')
url="https://openvpn.fox-it.com/"
license=('GPL2')
depends=('systemd-libs' 'glibc')
makedepends=('gnupg')
source=(
	"https://openvpn.fox-it.com/repos/deb/dists/jammy/Release" 
	"https://openvpn.fox-it.com/repos/deb/dists/jammy/Release.gpg"
	"https://openvpn.fox-it.com/repos/deb/dists/jammy/main/binary-amd64/Packages"
	"https://openvpn.fox-it.com/repos/deb/pool/main/o/${pkgname}/${pkgname}_${pkgver}-nl1-jammy_amd64.deb"
)
sha512sums=(
	"fa94f23ae17ccaed2e0253cca763a5dd4bd2c2bc4b4ca3a9603e2f34fa3a13dd20b0e0de219ca25d4803e199a7440cfabe0015da44bb936d12189adac93ebc6c"
	'04015b15eed300dab17a0a92ceb546c232718e75326b9d81ef0bda3810b04fc045f55b1e4fd67f5c3243e8de750214ee6aafcbe90a59e9ad04810edd48a1b6db'
	'bfc77317b4587ce45d8166be618e6f3f7a25210ab11d9e60f93a6f2a8c7693771147c2ceefba5ad23ebcb4c944b64dd27dfcfe47d7cb8998a9887f23b4986c88'
	'4dc89cb35d00a81b05b83656d1904a6320988785dab3c8a9ae5b79c6952289e81d18cd5e5eaa96be59ad876213a4b125bfebd3f400b8ebe11653d3ba37107bc4'
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
	echo -e "${_YEL}Verifying ${pkgname}_${pkgver}-nl1-jammy_amd64.deb package with previously verified Packages file...${_NC}"
	(sed -n 12p Packages | awk -v name=${pkgname}_${pkgver}-nl1-jammy_amd64.deb '{print $2 " " name}' | sha256sum --check --status --strict && echo "OK") || (echo -e "${_RED}There is something wrong with the SHA256 hash! This package is likely compromised and should not be used!${_NC}" && exit 1)
}

package() {
	cd "${srcdir}"
	tar -xf data.tar.zst -C "${srcdir}"
	mkdir -p ${pkgdir}/usr/bin
	cp ${srcdir}/usr/sbin/openvpn-nl ${pkgdir}/usr/bin/openvpn-nl
}
