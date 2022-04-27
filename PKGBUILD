# Maintainer: Michael Asher < michael at we solve everything dot com> 
# Contributers: Stephen304

pkgname=crowdsec
pkgver=1.3.3
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

sha256sums=('36f271db868df5f72804f0928b5459e9a8f243dfd3f2cff7cf36a12212732af1'
            'e94363de7cef3d3b8896e812a8a682fb672780069ffb3157447839a55b191e16')
