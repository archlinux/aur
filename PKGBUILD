# Maintainer: András Wacha <awacha@gmail.com>
pkgname=atsas
pkgver=2.7.2.5
pkgrel=2
pkgdesc="A program suite for small-angle scattering data analysis from biological macromolecules"
arch=('i686' 'x86_64')
url="https://www.embl-hamburg.de/biosaxs/software.html"
license=('custom')
options=('!strip')

# !!! You have to download the sources yourself from https://www.embl-hamburg.de/biosaxs/download.html

[ "$CARCH" = "i686" ] && source=('ATSAS-2.7.2-5_i386.tar.gz' 'license.md')
[ "$CARCH" = "x86_64" ] && source=('ATSAS-2.7.2-5_amd64.tar.gz' 'license.md')

[ "$CARCH" = "i686" ] && md5sums=('d232be7d19f2be055c0438065fd236d5' 'c13f6761ae4bba73852c53267e578bc7')
[ "$CARCH" = "x86_64" ] && md5sums=('b0b8b883bbb8acdbb4f30e75ff8f9fb2' 'c13f6761ae4bba73852c53267e578bc7')

package() {
	mkdir -p "${pkgdir}/opt"
	cp -R "${srcdir}/ATSAS-2.7.2-5" "${pkgdir}/opt/atsas"
	ATSAS_ROOT=/opt/atsas
	DEST_BIN_DIR=/usr/bin
	mkdir -p "${pkgdir}/${DEST_BIN_DIR}"
	for f in ${pkgdir}${ATSAS_ROOT}/bin/*; do
		f=$(basename $f)
		cat >${pkgdir}${DEST_BIN_DIR}/$f <<EOF
#!/bin/sh
ATSAS=${ATSAS_ROOT} LD_LIBRARY_PATH=${ATSAS_ROOT}/lib/${CARCH}-linux-gnu/atsas:\${LD_LIBRARY_PATH} ${ATSAS_ROOT}/bin/$f \$*
EOF
		chmod +x ${pkgdir}${DEST_BIN_DIR}/$f
	done
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	cp "${srcdir}/license.md" "${pkgdir}/usr/share/licenses/${pkgname}"
}
