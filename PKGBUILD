# Contributor: Max Resch <resch.max@gmail.com>
# Thanks To: audrencezar
pkgname=bing
pkgver=1.3.5
pkgrel=1
pkgdesc="Measure the bandwidth between two hosts using the ICMP protocol without the need of a client/server architecture"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="http://fgouget.free.fr/bing/index-en.shtml"
license=('BSD')
source=(
	"http://fgouget.free.fr/bing/bing_src-${pkgver}.tar.gz"
	"makefile.patch"
	"memcpy.patch" )
sha256sums=(
	'12bbf7f869474691f8d1f42aaa28547b2eee338576397dccd9d5bf862fc90768'
	'e04114e388e51a25c2775fc344e2c98bb106eb7b6198c94a1a59a05017ac1225'
	'f18f0c48aa4fda031f119ba095ecb5eb9c1cd9e85c92eef976f4aa485fe82e43' )
install="${pkgname}.install" # setcap cap_net_raw or setuid root

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# remove debug build flags
	patch -p1 < ${srcdir}/makefile.patch
	patch -p1 < ${srcdir}/memcpy.patch
	CFLAGS="$(CFLAGS) -fPIC -D_FORTIFY_SOURCE=2" LDFLAGS="$(LDFLAGS) -Wl,-z,relro,-z,now -pie" make
	gzip -c unix/bing.8 > unix/bing.8.gz
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	install -D -o root -g root -m 0755 bing ${pkgdir}/usr/bin/bing
	install -D -o root -g root -m 0644 unix/bing.8.gz ${pkgdir}/usr/share/man/man8/bing.8.gz
}
