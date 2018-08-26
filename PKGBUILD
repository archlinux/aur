# Contributor: Max Resch <resch.max@gmail.com>
# Thanks To: audrencezar
pkgname=bing
pkgver=1.3.5
pkgrel=1
pkgdesc="Measure the bandwidth between two hosts using the ICMP protocol without the need of a client/server architecture"
arch=('i686' 'x86_64')
url="http://fgouget.free.fr/bing/bing_src-readme-1st.shtml"
license=('BSD')
optdepends=('libcap: for setting cap_net_raw')
source=(
	"http://http.debian.net/debian/pool/main/b/bing/${pkgname}_${pkgver}.orig.tar.gz"
	"makefile.patch"
	"memcpy.patch" )
sha256sums=(
	'12bbf7f869474691f8d1f42aaa28547b2eee338576397dccd9d5bf862fc90768'
	'be1874bb8d39021f072409d4c52291da71e36edca9762b5cbc631b597422e57b'
	'170ce4b0cb4696b719d567721798b388900c2c646fffc15d3b3b1bf19b67554d' )
install="${pkgname}.install" # setcap cap_net_raw or setuid root

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# add #include<string.h> to avoid missing memcpy() warning
	patch -p1 < ${srcdir}/memcpy.patch
	# remove debug build flags
	patch -p1 < ${srcdir}/makefile.patch
	CFLAGS="$(CFLAGS) -fPIC -D_FORTIFY_SOURCE=2" LDFLAGS="$(LDFLAGS) -Wl,-z,relro,-z,now -pie" make
	gzip -k unix/bing.8
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	install -D -o root -g root -m 0755 bing ${pkgdir}/usr/bin/bing
	install -D -o root -g root -m 0644 unix/bing.8.gz ${pkgdir}/usr/share/man/man8/bing.8.gz
}
