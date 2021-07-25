# Maintainer: Mirko Scholz <srtlg>
pkgname=gmat
pkgver=R2020a
pkgrel=1
pkgdesc="General Mission Analysis Tool: An open-source space mission analysis tool"
arch=('x86_64')
url="https://sourceforge.net/projects/gmat/"
license=('Apache')
conflicts=('gmat-bin')
makedepends=('cspice' 'cmake' 'swig' 'patchelf' 'f2c')
depends=('xerces-c' 'python' 'wxgtk2' 'glu')
source=("GMAT.in"
	"010-fix-f2c-typedefs.patch"
	"https://sourceforge.net/projects/gmat/files/GMAT/GMAT-${pkgver}/GMAT-src_and_data-${pkgver}.zip")
sha256sums=('3d98cc2892c5b29cdf84a6d027842debfdb1a8472b0e67c7682c2ee24d4938ec'
            'd6971947454142b12ec8d4d237c6f33b348be424f758c2e5351b1a92d9e779dc'
            '5ef0b434b026d907027b99db44a82750442a4b50b577f382ff3ea77e0d6b71b9')
options=(!strip)

prepare() {
	patch -d "GMAT-${pkgver}" -Np1 -i "${srcdir}/010-fix-f2c-typedefs.patch"
}

build() {
	cmake -B build -S "GMAT-$pkgver" \
		-D CSPICE_DIR:PATH=/usr \
		-D F2C_DIR:PATH=/usr/include \
		-D CMAKE_INSTALL_PREFIX:PATH=/usr
	make -C build
}

package() {
	install -d -m755 "${pkgdir}/opt"
	cp -dr --no-preserve='ownership' "GMAT-${pkgver}/application" "${pkgdir}/opt/GMAT-${pkgver}"
	rm "${pkgdir}/opt/GMAT-${pkgver}/License.txt"
	rm "${pkgdir}/opt/GMAT-${pkgver}/README.txt"
	rm -rf "${pkgdir}/opt/GMAT-${pkgver}/matlab"
	find "${pkgdir}/opt/GMAT-${pkgver}" -name '*.m' -delete
	find "${pkgdir}/opt/GMAT-${pkgver}" -name '.git*' -delete

	install -d -m755 "${pkgdir}/usr/bin"
	<"${srcdir}/GMAT.in" sed -e "s|ROOT_PATH|/opt/GMAT-${pkgver}|g" -e "s|PKGVER|${pkgver}|g" > "${pkgdir}/usr/bin/GMAT"
	chmod 755 "${pkgdir}/usr/bin/GMAT"
	ln -s "/opt/GMAT-${pkgver}/bin/GmatConsole-${pkgver}" "${pkgdir}/usr/bin/GmatConsole"

	# startup file
	for i in gmat_startup_file.txt gmat_startup_file.public.txt gmat_startup_file_mac_linux.public.txt gmat_startup_file_mac_linux.txt
	do
		rm "${pkgdir}/opt/GMAT-${pkgver}/bin/$i"
	done
	<"GMAT-${pkgver}/application/bin/gmat_startup_file.public.txt" \
		  sed -e 's/^.*MATLAB_MODE\s*=\s*NO_MATLAB/MATLAB_MODE = NO_MATLAB/' \
		| sed -e 's/^.*WRITE_PERSONALIZATION_FILE.*/WRITE_PERSONALIZATION_FILE = OFF/' \
		| sed -e "s|ROOT_PATH\s*=.*|ROOT_PATH = /opt/GMAT-${pkgver}/|" \
		| sed -e "s|#\s*PLUGIN\s*=\s*../plugins/lib|PLUGIN = ../plugins/lib|" \
		| sed -e "/libMatlabInterface/ d" -e "/libFminconOptimizer/ d" \
		| sed -e "/libOpenFramesInterface/ d" \
		| sed -e "s|../plugins/|/opt/GMAT-${pkgver}/plugins/|" \
		| sed -e "s|OUTPUT_PATH\s*=.*|OUTPUT_PATH = /tmp/|" \
	>"${pkgdir}/opt/GMAT-${pkgver}/bin/gmat_startup_file.txt"

	<"GMAT-${pkgver}/application/bin/GMAT.ini" \
		  sed -e "s|Sample Missions=../samples|Sample Missions=/opt/GMAT-${pkgver}/samples|" \
		| sed -e "s|http://gmat.sourceforge.net/docs/R2020a/|/opt/GMAT-R2020a/docs/help/|" \
	>"${pkgdir}/opt/GMAT-${pkgver}/bin/GMAT.ini"

	# RUNPATH
	patchelf --remove-rpath "${pkgdir}/opt/GMAT-${pkgver}/bin/libGmatUtil.so.${pkgver}"
	patchelf --set-rpath "/opt/GMAT-${pkgver}/bin" "${pkgdir}/opt/GMAT-${pkgver}/bin/GMAT-${pkgver}"
	patchelf --set-rpath "/opt/GMAT-${pkgver}/bin" "${pkgdir}/opt/GMAT-${pkgver}/bin/GmatConsole-${pkgver}"
	patchelf --set-rpath "/opt/GMAT-${pkgver}/bin" "${pkgdir}/opt/GMAT-${pkgver}/bin/libGmatBase.so.${pkgver}"
	patchelf --set-rpath "/opt/GMAT-${pkgver}/bin" "${pkgdir}/opt/GMAT-${pkgver}/bin/libCInterface.so.${pkgver}"
	for lib in ScriptTools ProductionPropagators Formation SaveCommand Station GmatFunction PolyhedronGravity \
	           PythonInterface DataInterface YukonOptimizer EphemPropagator EventLocator NewParameters GmatEstimation \
                   ExtraPropagators
	do
		patchelf --set-rpath "/opt/GMAT-${pkgver}/bin" "${pkgdir}/opt/GMAT-${pkgver}/plugins/lib${lib}.so.${pkgver}"
	done
	for lib in EKF ThrustFile
	do
		patchelf --set-rpath "/opt/GMAT-${pkgver}/bin:/opt/GMAT-${pkgver}/plugins" "${pkgdir}/opt/GMAT-${pkgver}/plugins/lib${lib}.so.${pkgver}"
	done
}
