# Maintainer: Josef Miegl <josef@miegl.cz>
# Contributor: robertfoster

pkgbase=rtpengine
pkgname=('rtpengine' 'rtpengine-dkms')
pkgver=6.4.1.1
pkgrel=1
pkgdesc="The Sipwise media proxy for Kamailio"
url="https://github.com/sipwise/rtpengine"
license=('GPL3')
arch=('x86_64' 'i686')
depends=('ffmpeg' 'hiredis' 'json-glib' 'libevent' 'libmariadbclient' 'openssl' 'pcre' 'xmlrpc-c' 'zlib')
optdepends=('libiptcdata' 'bcg729')
makedepends=('glib2' 'pkgconf')
source=("https://github.com/sipwise/rtpengine/archive/mr$pkgver.tar.gz")

prepare() {
	cd "${srcdir}/${pkgname}-mr${pkgver}"
}

build() {
	cd "${srcdir}/${pkgname}-mr${pkgver}"
	make all
}

package_rtpengine() {
	cd "${srcdir}/${pkgname}-mr${pkgver}"
	install -Dm755 daemon/rtpengine $pkgdir/usr/bin/rtpengine
	install -Dm755 recording-daemon/rtpengine-recording $pkgdir/usr/bin/rtpengine-recording
	install -Dm755 iptables-extension/libxt_RTPENGINE.so $pkgdir/usr/lib/iptables/libxt_RTPENGINE.so
}

package_rtpengine-dkms() {
	depends=('linux-headers' 'dkms')
	cd "${srcdir}/$pkgbase-mr${pkgver}"
	# Copy dkms .conf
	install -Dm644 debian/dkms.conf.in "${pkgdir}/usr/src/${pkgbase}-mr${pkgver}/dkms.conf"
	cp -r kernel-module/* $pkgdir/usr/src/$pkgbase-mr$pkgver/

	# Set name and version
	sed -e "s/__VERSION__/${pkgver}/" \
		-e "s/ngcp-rtpengine/rtpengine/" \
		-i "${pkgdir}/usr/src/${pkgbase}-mr${pkgver}/dkms.conf"

}

md5sums=('a0f210770bda6e6482ff97d2f6f7fab1')
