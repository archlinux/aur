# Maintainer: Jimmy Stelzer jimmy.stelzer@gmail.com

pkgname=btusb-csr-0x8891
pkgver=0.8
pkgrel=4
pkgdesc="patch btusb so it works on CSR clone devices with id 0x8891"
url=https://bugzilla.kernel.org/show_bug.cgi?id=60824
arch=('i686' 'x86_64')
license=('GPL')
depends=('dkms')
makedepends=('linux-headers')

source=(
	"Makefile"
	"btusb.patch"
	"btusb.c::https://raw.githubusercontent.com/zen-kernel/zen-kernel/v5.7.6-zen1/drivers/bluetooth/btusb.c"
	"btintel.h::https://raw.githubusercontent.com/zen-kernel/zen-kernel/v5.7.6-zen1/drivers/bluetooth/btintel.h"
	"btbcm.h::https://raw.githubusercontent.com/zen-kernel/zen-kernel/v5.7.6-zen1/drivers/bluetooth/btbcm.h"
	"btrtl.h::https://raw.githubusercontent.com/zen-kernel/zen-kernel/v5.7.6-zen1/drivers/bluetooth/btrtl.h"
	"dkms.conf"
) 

prepare() {
	\cp --remove-destination $(readlink btusb.c) btusb.c
	patch -p1 < btusb.patch
}

package() {
	install -Dm644 dkms.conf "${pkgdir}"/usr/src/${pkgname}-${pkgver}/dkms.conf

	# Set name and version
	sed -e "s/@PKGNAME@/${pkgname}/" \
		-e "s/@PKGVER@/${pkgver}.1/" \
		-i "${pkgdir}"/usr/src/${pkgname}-${pkgver}/dkms.conf

	install -Dm644 btusb.c "${pkgdir}"/usr/src/${pkgname}-${pkgver}/btusb.c

	sed -e "s/define VERSION \"${pkgver}\"/define VERSION \"${pkgver}.1\"/" \
		-i "${pkgdir}"/usr/src/${pkgname}-${pkgver}/btusb.c

	install -Dm644 btintel.h "${pkgdir}"/usr/src/${pkgname}-${pkgver}/btintel.h
	install -Dm644 btbcm.h "${pkgdir}"/usr/src/${pkgname}-${pkgver}/btbcm.h
	install -Dm644 btrtl.h "${pkgdir}"/usr/src/${pkgname}-${pkgver}/btrtl.h
	install -Dm644 Makefile "${pkgdir}"/usr/src/${pkgname}-${pkgver}/Makefile
}

sha512sums=(
	'263480d12c234c4e42bf5c8e518af8b6000a8d2307d4cf0a740d22887c1574a36a9105272d0b739a04257fceb66f794d230d901f70ffd8076fdd294bc503216d'
	'dd33fb45c6ba132925ee0f1e1e1743708e578cae0857c1704e8a0caa50c27438d78d9e1c80f2a8acc0f47fd902dde62dc8670ed2dafbe7d044a26a1c50edee1e'
	'd781e417dce6bbfc098a01cdbc4935c75711e4384eb56f9875c05de046a182930d38602a2b159edfeb43523d75be09158ae806bb1da167b160b86d2efb28102b'
	'16ce8e77b598ca4dc5dbba805046e066698a5157fee73b0425a4bd51e1b063a745a3aa3cc169abcacb249d3bd93901a059f3a71dc009f3ca93af2e542400a35b'
	'b526d42413a1621bbd6360ada6e0623c74c7cb31c0e82d1ac6690b782ea2c9b496bb6e650fe4a66fa16bb405ecb3f14233f7c3e68093f9939a21f61c2f082ea0'
	'0230ffe3981bc4b99fd7b961d0a8181920dd7ad231ed4ed89824872d4e9ba3305cf18cfe88f954eca9dd000fd10abbefbdddf89bef11aac91fec07c0425bf701'
	'2bde0461ab2bb84bb5bb2a5dce5ae8e6919cf5649f72bd2dc3b505c359b80713d8573409d11101789e1455b5090bbdd9305adfbabb78d5cbc56598abedc24c18'
)

