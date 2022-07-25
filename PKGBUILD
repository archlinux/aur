# Maintainer: Michael Asher < michael at we solve everything dot com> 
# Contributers: Stephen304

pkgname=crowdsec
pkgver=1.4.1
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
	sed -ie "s/^BUILD_VERSION.*$/BUILD_VERSION = v${pkgver}/g" Makefile
	sed -ie "s/^BUILD_TAG.*$/BUILD_TAG = arch/g" Makefile

	make -f Makefile -s build
	make -f Makefile -s package
}

package() {
	mkdir -p ${pkgdir}/usr/local/installers/crowdsec/crowdsec
	cp -R ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/usr/local/installers/crowdsec/crowdsec
}

sha256sums=('efc6eefa7e657a1440a9cc4608a4a04ab0b98bf62c14a8a9d6f1d3aba70b4715'
            'aba15327f38f6477816cdea9f55330781b49e8421832191241c2586392fb36d0')
