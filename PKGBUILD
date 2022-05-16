# Maintainer: Victor de Jong <victor@victordejong.com>
pkgname=openvpn-nl
pkgver=2.4.12
pkgrel=2
pkgdesc="An open-source fork of OpenVPN allowed to be used in classified environments up to (equivalent) NATO RESTRICTED"
arch=('x86_64')
url="https://openvpn.fox-it.com/"
license=('GPL2')
depends=('lzo')
makedepends=('cmake' 'gnupg')
source=(
	"https://openvpn.fox-it.com/repos/deb/dists/focal/Release" 
	"https://openvpn.fox-it.com/repos/deb/dists/focal/Release.gpg"
	"https://openvpn.fox-it.com/repos/deb/dists/focal/main/binary-amd64/Packages"
	"${pkgname}-${pkgver}.deb::https://openvpn.fox-it.com/repos/deb/pool/main/o/${pkgname}/${pkgname}_${pkgver}-focalnl1_amd64.deb"
)
sha512sums=(
	'9134bbfbed767b9cde277d8f794260fcc466b3e30c3cecb8bf34e84339b449e5264095e539839d733b917cb903f3a903d39cd7850bee9d06b6961a81d68b71f2'
	'ed1dc76fce009d13408e79cc6803e2520c7cd9cb572ccccf3d272cc8120c5fd7d600c066418d78b3da5a708a6ee0dd8793dd765e1f70475c5b9d79f6901fef4a'
	'db967a6593bd5cf06bfadebaa66df2e4636c6d45c425db0abf5443e2e319be827a7c1e7ab97b6877920a60fe4d5c51922bbbeb150abd7b59a7e794d63c9d71b9'
	'aa8499705f7b402cb0b896745710349ccb2e33efab680f900c4ec3d789059e396474634ff220f8c95efd39007530b8c33722fadb31bb5a7f7f1bebbbf12e534c'
)
validpgpkeys=('6A1195968DDCA3494E7C598C43CF15D354E03E30')

prepare() {
	# Set colour, yellow and reset respectively
	_YEL='\033[1;33m'
	_RED='\033[0;31m'
	_NC='\033[0m'
	echo -e "${_YEL}Verifying Release file with GPG key...${_NC}"
	gpg --verify Release.gpg Release || (echo -e "${_RED}There is something wrong with the signature! Either this package is compromised or you need to import the key from https://openvpn.fox-it.com/repos/fox-crypto-gpg.asc${_NC}" && exit 1)
	echo -e "${_YEL}Verifying Packages file with previously verified Release file...${_NC}"
	(echo "$(sed -n 17p Release | awk '{print $1}') Packages" | sha256sum --check --status && echo "OK") || (echo -e "${_RED}There is something wrong with the SHA256 hash! This package is likely compromised and should not be used!${_NC}" && exit 1)
	echo -e "${_YEL}Verifying *.deb package with previously verified Packages file...${_NC}"
	(echo "$(sed -n 12p Packages | awk '{print $2}') openvpn-nl-2.4.12.deb" | sha256sum --check --status && echo "OK") || (echo -e "${_RED}There is something wrong with the SHA256 hash! This package is likely compromised and should not be used!${_NC}" && exit 1)
}

package() {
	cd "${srcdir}"
	tar -xf data.tar.xz -C "${srcdir}"
	mkdir -p ${pkgdir}/usr/bin
	cp ${srcdir}/usr/sbin/openvpn-nl ${pkgdir}/usr/bin/openvpn-nl
}
