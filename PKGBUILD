# Maintainer: Issam E. Maghni <issam.e.maghni at mailbox dot org>

pkgname=bearssl
pkgver=0.6
pkgrel=4
pkgdesc='Implementation of the SSL/TLS protocol (RFC 5246) written in C'
arch=('i486' 'i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://bearssl.org'
depends=('glibc')
license=('MIT')
source=("${url}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6705bba1714961b41a728dfc5debbe348d2966c117649392f8c8139efc83ff14')

build() {
	cd "./${pkgname}-${pkgver}"
	make CFLAGS="${CFLAGS} -fpic" \
	     LDFLAGS="$LDFLAGS" \
	     LDDLLFLAGS="${LDFLAGS} -shared -Wl,-soname,lib${pkgname}.so.${pkgver%%.*}" \
	     D=".so.${pkgver}"
}

check() {
	cd "./${pkgname}-${pkgver}/build"
	./testcrypto all
	./testx509
}

package() {
	mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/include" "${pkgdir}/usr/lib" "${pkgdir}/usr/share/licenses/${pkgname}"
	cd "./${pkgname}-${pkgver}/build"

	# ideally, we should encapsulate headers in a namespace, but not now
	#sed -i 's|"bearssl_|"bearssl/|g' ../inc/*
	#mkdir "${pkgdir}/usr/include/${pkgname}"
	cp '../inc/bearssl.h' "${pkgdir}/usr/include"
	for h in ../inc/*; do
		cp "$h" "${pkgdir}/usr/include" # "${pkgdir}/usr/include/${pkgname}/${h#*_}"
	done

	cp '../LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}"
	cp './brssl' "${pkgdir}/usr/bin"
	cp  "./lib${pkgname}.so.${pkgver}" "./lib${pkgname}.a" "${pkgdir}/usr/lib"
	ln -s "lib${pkgname}.so.${pkgver}"     "${pkgdir}/usr/lib/lib${pkgname}.so.${pkgver%%.*}"
	ln -s "lib${pkgname}.so.${pkgver%%.*}" "${pkgdir}/usr/lib/lib${pkgname}.so"
}
