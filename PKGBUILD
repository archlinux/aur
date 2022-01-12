# Maintainer: Michael Asher < michael at we solve everything dot com> 
# Contributers: Stephen304

pkgname=crowdsec
pkgver=1.2.3
pkgrel=2
pkgdesc="The open-source and collaborative IPS"
arch=('any')
url="https://crowdsec.net"
license=('MIT')
install=crowdsec.install
source=(
	"$pkgname-v${pkgver}.tgz"::https://github.com/crowdsecurity/crowdsec/archive/refs/tags/v${pkgver}.tar.gz
	crowdsec.install
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
	# Adjust the Makefile to show the proper build version
	sed -Ei "s/(BUILD_VERSION\?=\")[^\"]+(\")/\1v${pkgver}\2/" Makefile	
	make -s build
	make -s package
}

package() {
	mkdir -p ${pkgdir}/var/lib/crowdsec/installers/crowdsec
	cp -R ${srcdir}/${pkgname}-${pkgver}/crowdsec-v${pkgver}/* ${pkgdir}/var/lib/crowdsec/installers/crowdsec
}
sha256sums=('c94163ac2b90864149bd5ced3b77ecb5c9e9a68d3c7a938f23e05ef72da69938'
            '99c943445ea56891ecd609871bbf76ff18901aa607925cbeb3aeec966b86bdfa')
