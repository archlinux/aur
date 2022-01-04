# Maintainer: Michael Asher < michael at we solve everything dot com> 

pkgname=crowdsec
pkgver=1.2.2
pkgrel=8
pkgdesc="The open-source and collaborative IPS"
arch=('any')
url="https://crowdsec.net"
license=('MIT')
install=crowdsec.install
source=(
	"$pkgname-source.tgz"::https://github.com/crowdsecurity/crowdsec/archive/refs/tags/v${pkgver}.tar.gz
	crowdsec.install
	Makefile.patch
)
depends=(
	'jq'
	'libnewt'
	'iptables'
	'ipset'
)
makedepends=(
	'jq'
	'libnewt'
	'go'
)
optdepends=(
	'docker: Used to run metabase container for statistics'
	'iptables-nft: For use with nftables'
)

provides=('crowdsec')

build(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	# Patching makefile to include version
	# Perhaps this would be cleaner with sed
	#
	patch Makefile < ${srcdir}/Makefile.patch
	make -s build
	make -s package
}

package() {
	mkdir -p ${pkgdir}/var/lib/crowdsec/installers/crowdsec
	cp -R ${srcdir}/${pkgname}-${pkgver}/crowdsec-v${pkgver}/* ${pkgdir}/var/lib/crowdsec/installers/crowdsec
}
sha256sums=('b815ac4fafa25f0e657b56baaba9a093ef64fbe7336e4bc29208eb47ed1af5e6'
            'f32e5b3f15dc0edf96623e08000e98073c97ed97e7af80a929ce8285d6e447f3'
            '32b940e09846711d99553b27403b19771bee71f2900b8c036c3e079af22819bd')
