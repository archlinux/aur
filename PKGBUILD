# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
# Contributor: fishburn <frankthefishburn@gmail.com>

pkgname=fsl
pkgver=6.0.3
pkgrel=1
pkgdesc="A comprehensive library of analysis tools for FMRI, MRI and DTI brain imaging data"
arch=("x86_64")
url="http://www.fmrib.ox.ac.uk/fsl/"
license=(custom)
depends=(gd libxml2 libxml++2.6 gsl libpng nlopt newmat tcl tk zlib python glu boost-libs vtk sqlite python3 fslpy bc openblas)
makedepends=(boost fftw)
optdepends=(cuda)
source=("https://www.fmrib.ox.ac.uk/fsldownloads/fsl-${pkgver}-sources.tar.gz"
        "https://www.fmrib.ox.ac.uk/fsldownloads/fsl-${pkgver}-feeds.tar.gz"
	"buildSettings.mk"
        "imcp"
	"imglob"
	"immv"
	"001-use_distribution_environment.patch"
	"002-fix_meldata_usage_of_ifstream.patch"
	"003-fix_fsl_exec_empty_errorCode.patch"
	"004-fix_missing_LIB_PROB.patch")

sha256sums=('9eec9b4f5d67fa727b50ad6d4c8265b82403dd6163c4747797ef910f826a2636'
	    '719d9e12e165c1a40d411dae2aca53e8d9033192c91853a6c60e5a55c0c022fb'
	    'e73d3b7289981c95581d9378c2a39694bc0fcdf7170c5defc864a47871e98df1'
            'c61f185fbe7e297c4518e96377aa5ff4852f90eda0dbb9ae8edc5e24735e14ad'
	    '7a1039cdc38b4d728f14efce3b0fda0cadc7bfcd3432556c3f3113985bf2720a'
	    'b6f61a6d5672b6684f19150f6e21ded1bd04ec6415dcf07a32291e4002bfa5d8'
	    '8c85234f03d3cd226f84fd1aa446e46a8f00c2c6ae3cc7fefedc1e48ffc61daa'
	    '13d4cf35343e7a73bc2534c94b1b0d4db41c338d374e6982091e4cf7a421d420'
	    '64b4ccefa63a3cf920b185dd52e94b918c24f2cedaebcec8efb767bd80a6418a'
	    'adea0372f42026e72e385f1bec19ecc8cffa46de1f617271f14c9345c6b83c04')

prepare() {
	cd "${srcdir}"
	export FSLDIR="${srcdir}/fsl"
	. "${FSLDIR}/etc/fslconf/fsl.sh"
	export FSLMACHTYPE=$(${FSLDIR}/etc/fslconf/fslmachtype.sh)
        # We only create this dir to keep 'build' from complaining
	mkdir "${FSLDIR}/config/${FSLMACHTYPE}"
	cp "${srcdir}"/buildSettings.mk "${FSLDIR}"/config/

	# Apply patches
	patch -Np1 -i "${srcdir}"/001-use_distribution_environment.patch
	patch -Np1 -i "${srcdir}"/002-fix_meldata_usage_of_ifstream.patch
	# From https://www.jiscmail.ac.uk/cgi-bin/webadmin?A2=fsl;e8fa48c1.1501
	patch -Np1 -i "${srcdir}"/003-fix_fsl_exec_empty_errorCode.patch
	# I'm not sure why -L${LIB_PROB} is missing in some Makefiles 
	patch -Np1 -i "${srcdir}"/004-fix_missing_LIB_PROB.patch

	# Insert makepkg build flags into configuration
	sed -i '0,/${AccumulatedIncFlags}/{s^${AccumulatedIncFlags}^& '"${CFLAGS}"'^}' "${srcdir}/fsl/config/common/vars.mk"
	sed -i '0,/${AccumulatedIncFlags}/{s^${AccumulatedIncFlags}^& '"${CPPFLAGS}"'^}' "${srcdir}/fsl/config/common/vars.mk"
	sed -i '1,/${AccumulatedIncFlags}/!{s^${AccumulatedIncFlags}^& '"${CXXFLAGS}"'^}' "${srcdir}/fsl/config/common/vars.mk"
	sed -i '1,/${AccumulatedIncFlags}/!{s^${AccumulatedIncFlags}^& '"${CPPFLAGS}"'^}' "${srcdir}/fsl/config/common/vars.mk"
	sed -i 's^LDFLAGS = .*$^& '"${LDFLAGS}"'^g' "${srcdir}/fsl/config/common/vars.mk"
}

build() {
	export FSLDIR="${srcdir}/fsl"
	cd "${FSLDIR}"
	./build

	# Install missing binaries, which are no longer shipped (depends on fslpy)	
	/usr/bin/install -m 755 "${srcdir}"/{imcp,imglob,immv} "${srcdir}/fsl/bin"
}

check() {
	export FSLDIR="${srcdir}/fsl"
	export FEEDSDIR="${srcdir}/feeds"
	. "${FSLDIR}/etc/fslconf/fsl.sh"
	cd "${FEEDSDIR}"
	time ./RUN all
}

package() {
	rm -rf "${srcdir}/fsl/src"
	rm -rf "${srcdir}/fsl/extras/src"
	rm -rf "${srcdir}/fsl/extras/include"
	mkdir -p "${pkgdir}/opt/fsl"

	cp -r "${srcdir}/fsl/bin"	"${pkgdir}/opt/fsl/"
	cp -r "${srcdir}/fsl/data"	"${pkgdir}/opt/fsl/"
	cp -r "${srcdir}/fsl/doc"	"${pkgdir}/opt/fsl/"
	cp -r "${srcdir}/fsl/etc"	"${pkgdir}/opt/fsl/"
	cp -r "${srcdir}/fsl/extras"	"${pkgdir}/opt/fsl/"
	cp -r "${srcdir}/fsl/lib"	"${pkgdir}/opt/fsl/"
	cp -r "${srcdir}/fsl/refdoc"	"${pkgdir}/opt/fsl/"
	cp -r "${srcdir}/fsl/tcl"	"${pkgdir}/opt/fsl/"
	cp -r "${srcdir}/feeds"	        "${pkgdir}/opt/fsl/"

	mkdir -p "${pkgdir}/etc/profile.d"
	echo 'FSLDIR=/opt/fsl' >			"${pkgdir}/etc/profile.d/fsl.sh"
	echo '. ${FSLDIR}/etc/fslconf/fsl.sh' >>	"${pkgdir}/etc/profile.d/fsl.sh"
	echo 'export FSLDIR' >>				"${pkgdir}/etc/profile.d/fsl.sh"
	echo 'export PATH=$PATH:${FSLDIR}/bin' >>	"${pkgdir}/etc/profile.d/fsl.sh"

	mkdir -p "${pkgdir}/usr/share/licenses/fsl"
	grep -v \< "${srcdir}/fsl/doc/fsl/licence.html" | cat -s > "${pkgdir}/usr/share/licenses/fsl/LICENSE"

	# Fix permissions
	find "${pkgdir}" -type f -exec chmod 644 {} \;
	find "${pkgdir}" -type d -exec chmod 755 {} \;
	find "${pkgdir}/opt/fsl/bin" -exec chmod 755 {} \;
	find "${pkgdir}/opt/fsl/etc/fslconf" -exec chmod 755 {} \;
	chmod 755 "${pkgdir}/etc/profile.d/fsl.sh"
	
	mkdir -p "${pkgdir}/opt/fsl/feeds/results"
	chmod -R 777 "${pkgdir}/opt/fsl/feeds/results"
	chmod 755 "${pkgdir}/opt/fsl/feeds/RUN"

	# Clean up	
	find "${pkgdir}" -empty -delete
	find "${pkgdir}" -type f -exec sed -i 's^/usr/local/fsl^/opt/fsl^g' "{}" \;
}
