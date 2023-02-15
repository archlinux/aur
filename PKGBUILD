# Maintainer: Michael Asher < michael at we solve everything dot com> 
# Contributers: Stephen304

pkgname=crowdsec
pkgver=1.4.6
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
        sed -ie "s/^BUILD_VERSION.*$/BUILD_VERSION = v${pkgver}/g" platform/unix_common.mk
	sed -ie "s/^BUILD_TAG.*$/BUILD_TAG = arch/g" platform/unix_common.mk 

	make -f Makefile -s build
	make -f Makefile -s package
}

package() {
	mkdir -p ${pkgdir}/usr/local/installers/crowdsec/crowdsec
	cp -R ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/usr/local/installers/crowdsec/crowdsec
}

sha256sums=('acec1560593da78e37acbf44f2337a1e3026646ece00ab02eded78f71a2adda3'
            '53c852472e10709426a7b1d246493493cdbd9b6ffe80737e725a82dee9e220ab')
