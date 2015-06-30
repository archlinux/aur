# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>

pkgname=fsl
pkgver=5.0.8
pkgrel=1
pkgdesc="A comprehensive library of analysis tools for FMRI, MRI and DTI brain imaging data"
arch=("i686" "x86_64")
url="http://www.fmrib.ox.ac.uk/fsl/"
license=(custom)
depends=()
makedepends=()
optdepends=("fslview")
sha1sums=('c789fffcfcd6b11b9bd2c97b900a8b2cfc61b7cf')

source=("http://www.fmrib.ox.ac.uk/fsldownloads/fsl-${pkgver}-sources.tar.gz")

build() {
	
	export FSLDIR="${srcdir}/fsl"
	. "${FSLDIR}/etc/fslconf/fsl.sh"
	export FSLMACHTYPE=`${FSLDIR}/etc/fslconf/fslmachtype.sh`

	if [ ! -e "${FSLDIR}/config/${FSLMACHTYPE}" ]; then
	cp -rv "${FSLDIR}/config/linux_64-gcc4.4" "${FSLDIR}/config/${FSLMACHTYPE}"
	fi

	if test "$CARCH" == i686; then
	sed -i "s^-m64^^g" "${FSLDIR}/config/${FSLMACHTYPE}/systemvars.mk"
	fi

	sed -i 's^#include <vector>^#include <vector>\n#include <stdlib.h>^g' "${FSLDIR}/src/utils/opttst.cc"

	sed -i "s^//#include <cmath>^#include <cmath>^g" "${FSLDIR}/src/fslsurface/fslsurface_structs.h"

	cd "${FSLDIR}"
	./build
}

package() {

	rm -rf "${srcdir}/fsl/extras/src"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/opt/fsl"

	cp "${srcdir}/fsl/bin/"*	"${pkgdir}/usr/bin/"
	cp -r "${srcdir}/fsl/data"	"${pkgdir}/opt/fsl/"
	cp -r "${srcdir}/fsl/doc"	"${pkgdir}/opt/fsl/"
	cp -r "${srcdir}/fsl/etc"	"${pkgdir}/opt/fsl/"
	cp -r "${srcdir}/fsl/extras"	"${pkgdir}/opt/fsl/"
	cp -r "${srcdir}/fsl/include"	"${pkgdir}/opt/fsl/"
	cp -r "${srcdir}/fsl/lib"	"${pkgdir}/opt/fsl/"
	cp -r "${srcdir}/fsl/refdoc"	"${pkgdir}/opt/fsl/"
	cp -r "${srcdir}/fsl/tcl"	"${pkgdir}/opt/fsl/"

	mkdir -p "${pkgdir}/etc/profile.d"
	echo 'FSLDIR=/opt/fsl' >			"${pkgdir}/etc/profile.d/fsl.sh"
	echo '. ${FSLDIR}/etc/fslconf/fsl.sh' >>	"${pkgdir}/etc/profile.d/fsl.sh"
	echo 'export FSLDIR' >>				"${pkgdir}/etc/profile.d/fsl.sh"

	mkdir -p "${pkgdir}/usr/share/licenses/fsl"
	grep -v \< "${srcdir}/fsl/doc/fsl/licence.html" | cat -s > "${pkgdir}/usr/share/licenses/fsl/LICENSE"

	find "${pkgdir}" -type f -exec chmod 644 {} \;
	find "${pkgdir}" -type d -exec chmod 755 {} \;
	find "${pkgdir}/usr/bin" -exec chmod 755 {} \;
	find "${pkgdir}/opt/fsl/etc/fslconf" -exec chmod 755 {} \;
	find "${pkgdir}/opt/fsl/extras/bin" -exec chmod 755 {} \;
	chmod 755 "${pkgdir}/etc/profile.d/fsl.sh"
	ln -s /usr/bin "${pkgdir}/opt/fsl/bin"
}
