# Maintainer: Michael Asher < michael at we solve everything dot com> 
# Contributers: Stephen304

pkgname=crowdsec
pkgver=1.5.2
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
        sed -ie "s/^BUILD_VERSION.*$/BUILD_VERSION = v${pkgver}/g" mk/platform/unix_common.mk
	sed -ie "s/^BUILD_TAG.*$/BUILD_TAG = arch/g" mk/platform/unix_common.mk 

	make -f Makefile -s build
	make -f Makefile -s package
}

package() {
	mkdir -p ${pkgdir}/usr/local/installers/crowdsec/crowdsec
	cp -R ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/usr/local/installers/crowdsec/crowdsec
}

sha256sums=('18de78572600166c3a7636e9cd4ea011d204211638810969d99cb65feb78c231'
            '2dcf86fdb4a38fc76725986b0fe23c9a8f25b9ab9ed0aa6274082370fa45bbca')
