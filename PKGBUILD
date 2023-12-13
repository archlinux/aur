# Maintainer: András Wacha <awacha@gmail.com>
pkgname=atsas
pkgver=3.2.1
_pkgrel_upstream=1
pkgrel=3
pkgdesc="A program suite for small-angle scattering data analysis from biological macromolecules"
arch=('x86_64')
url="https://www.embl-hamburg.de/biosaxs/software.html"
license=('custom')
options=('!strip')
depends=( 'libgfortran.so=5' 'qt5-base' 'qt5-tools' 'qt5-svg' )
install=install

# !!! You have to download the sources yourself from https://www.embl-hamburg.de/biosaxs/download.html
# !!! Use the Ubuntu-22.04 version!

source=("local://ATSAS-${pkgver}-${_pkgrel_upstream}_amd64.tar.gz" 'license.md' 'atsas.sh' 'atsas.fish' 'atsas.csh')
sha512sums=('f80c19cae7c07c38f719c1592b529bf15654da531a808a61c33a75c57eec6f9e9a3ed76b266a0d85e27d1a2acd153fd0a027166e497c7bdbaa98c082e1de0da9'
            '3f728fb538b236f0ddce8a7c86303d14c529da4f117eb5f4c87ef5f0fef52dea3ae7650fc439316c08628dc641893ab10f85890577fcb8e67b9398fdbbfa773f'
            '293ce54e3ec40b2b9173e123a9a98027b69859b28bf970d91d6ace3ae60d30a00e7c2e89fc02755874967a6e34446ea32084a9335bf2f3b41aa30458f7fcfd54'
            '854e0d11d87e22c7a70f13309b0d9070bc0d63cb1c3ac0235f84550345072bf4552ffeb866db32e264117ae9d17b536572c181db7e4e77e224c321e9a8ffe87f'
            '0dba1e27b46fbbb272c4afeef06368c99ae28eb6686c6cfc6fe68169f9729a6d63a039a8909cbf17d1eca756ef471c675c438d10749ee35024ddb6579139fdca')


package() {
	cd ${srcdir}
#	set > environment.txt
	ATSAS_ROOT=/opt/ATSAS
	mkdir -p "${pkgdir}${ATSAS_ROOT}"
	ln -s ATSAS "${pkgdir}/opt/atsas"
	cd "${srcdir}/ATSAS-${pkgver}-${_pkgrel_upstream}" 
	cp -R * "${pkgdir}${ATSAS_ROOT}/"
	# remove the supplied Qt5 libraries: use the system-wide ones.
	rm "${pkgdir}${ATSAS_ROOT}"/lib/atsas/libQt6*
#	rm "${pkgdir}${ATSAS_ROOT}"/lib/atsas/libqwt*
	rm -r "${pkgdir}${ATSAS_ROOT}/bin/platforms"


#	DEST_BIN_DIR="$ATSAS_ROOT/bin"
#	GCC7_LIBDIR=$(ls -d /usr/lib/gcc/${CHOST}/7.*)
#	echo "GCC7 libdir: ${GCC7_LIBDIR}"
#	mkdir -p "${pkgdir}${DEST_BIN_DIR}"
#	mkdir -p "${pkgdir}${ATSAS_ROOT}/libexec"
#	for f in ${pkgdir}${ATSAS_ROOT}/bin/*; do
#		mv $f ${pkgdir}${ATSAS_ROOT}/libexec
#		f=$(basename $f)
#		cat >${pkgdir}${DEST_BIN_DIR}/$f <<EOF
##!/bin/sh
#export ATSAS=${ATSAS_ROOT} 
#export LD_LIBRARY_PATH=${ATSAS_ROOT}/lib/atsas:${GCC7_LIBDIR}
#${ATSAS_ROOT}/libexec/$f \$*
#EOF
#		chmod +x ${pkgdir}${DEST_BIN_DIR}/$f
#	done
	cd ${srcdir}
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	cp "${srcdir}/license.md" "${pkgdir}/usr/share/licenses/${pkgname}"
	mkdir -p "${pkgdir}/etc/profile.d"
	cp "${srcdir}/atsas".{csh,sh} "${pkgdir}/etc/profile.d/"
	chmod +x "${pkgdir}/etc/profile.d/atsas."{csh,sh}
 	mv "${pkgdir}${ATSAS_ROOT}/share/applications" "${pkgdir}/usr/share"
 	mv "${pkgdir}${ATSAS_ROOT}/share/icons" "${pkgdir}/usr/share"
 	mv "${pkgdir}${ATSAS_ROOT}/share/mime" "${pkgdir}/usr/share"
	mkdir -p "${pkgdir}/etc/fish/conf.d"
	cp "${srcdir}/atsas.fish" "${pkgdir}/etc/fish/conf.d/atsas.fish"
	find "${pkgdir}${ATSAS_ROOT}" -type d -exec chmod 755 {} \;
        find "${pkgdir}${ATSAS_ROOT}" -type f -exec chmod 644 {} \;
	find "${pkgdir}${ATSAS_ROOT}/bin" -type f -exec chmod 755 {} \;
        find "${pkgdir}${ATSAS_ROOT}/lib" -type f -exec chmod 755 {} \;

	
}
