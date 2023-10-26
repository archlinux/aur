# Maintainer: Michael Asher < michael at we solve everything dot com> 
# Contributers: Stephen304

pkgname=crowdsec
pkgver=1.5.5
pkgrel=1
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
	're2'
)
makedepends=(
	'jq'
	'libnewt'
	'go'
)
optdepends=(
	'docker: Used to run metabase container for statistics'
)

provides=('crowdsec')

build(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	# Adjust the Makefile to show the proper build version
        sed -ie "s/^BUILD_VERSION.*$/BUILD_VERSION = v${pkgver}/g" mk/platform/unix_common.mk
	sed -ie "s/^BUILD_TAG.*$/BUILD_TAG = arch/g" mk/platform/unix_common.mk 

	make -f Makefile -s build
	make -f Makefile -s package
}

package() {
	mkdir -p ${pkgdir}/usr/local/installers/crowdsec/crowdsec
	cp -R ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/usr/local/installers/crowdsec/crowdsec
}

sha256sums=('ec7b2815405be4c3a1c9c3dcb1110030c29b7408dbf2a82d25537843c8831329'
            '65229b23856f03bd84a0dce59f29287d66b2f8bdaf6ccaa983671e67a65d6f27')
