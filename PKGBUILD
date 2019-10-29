# Maintainer: András Wacha <awacha@gmail.com>
pkgname=atsas
pkgver=2.8.4
pkgrel=4
pkgdesc="A program suite for small-angle scattering data analysis from biological macromolecules"
arch=('x86_64')
url="https://www.embl-hamburg.de/biosaxs/software.html"
license=('custom')
options=('!strip')
depends=( gcc7-libs qt4 )

# !!! You have to download the sources yourself from https://www.embl-hamburg.de/biosaxs/download.html
# !!! Use the Ubuntu-18.04 version!

source=('local://ATSAS-2.8.4-1_amd64.tar.gz' 'license.md' 'atsas.sh')

sha512sums=('f33040a4472364ac66e68a7658c892ca1d1c1b15af62d9523c3ff1a71752942307a04eee0a057c23d24d93da214920e44b7d4caf20e638edf47c101e6883de21'
            '3f728fb538b236f0ddce8a7c86303d14c529da4f117eb5f4c87ef5f0fef52dea3ae7650fc439316c08628dc641893ab10f85890577fcb8e67b9398fdbbfa773f'
            'd5cf2dd6ee92a6ce9d01cfd5a2a87f081b4ecceecc7839f78c80d5c9a48c81b44f308e185b98e8d844bad8084d0d4946e4a117989a7b36e14db0d577013aecde')

package() {
	set > environment.txt
	mkdir -p "${pkgdir}/opt"
	cp -R "${srcdir}/ATSAS-2.8.4-1" "${pkgdir}/opt/atsas"
	ATSAS_ROOT=/opt/atsas
	DEST_BIN_DIR=/opt/atsas/bin
	GCC7_LIBDIR=$(ls -d /usr/lib/gcc/${CHOST}/7.*)
	echo "GCC7 libdir: ${GCC7_LIBDIR}"
	mkdir -p "${pkgdir}/${DEST_BIN_DIR}"
	mkdir -p "${pkgdir}${ATSAS_ROOT}/libexec"
	for f in ${pkgdir}${ATSAS_ROOT}/bin/*; do
		mv $f ${pkgdir}${ATSAS_ROOT}/libexec
		f=$(basename $f)
		cat >${pkgdir}${DEST_BIN_DIR}/$f <<EOF
#!/bin/sh
export ATSAS=${ATSAS_ROOT} 
export LD_LIBRARY_PATH=${ATSAS_ROOT}/lib/${CARCH}-linux-gnu/atsas:${GCC7_LIBDIR}
${ATSAS_ROOT}/libexec/$f \$*
EOF
		chmod +x ${pkgdir}${DEST_BIN_DIR}/$f
	done
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	cp "${srcdir}/license.md" "${pkgdir}/usr/share/licenses/${pkgname}"
	mkdir -p "${pkgdir}/etc/profile.d"
	cp "${srcdir}/atsas.sh" "${pkgdir}/etc/profile.d/atsas.sh"
	chmod +x "${pkgdir}/etc/profile.d/atsas.sh"
 	mv ${pkgdir}/opt/atsas/share/applications ${pkgdir}/usr/share
 	mv ${pkgdir}/opt/atsas/share/icons ${pkgdir}/usr/share
 	mv ${pkgdir}/opt/atsas/share/mime ${pkgdir}/usr/share
}
