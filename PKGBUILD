# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
# Contributor: fishburn <frankthefishburn@gmail.com>

pkgname=fsl
pkgver=6.0.4
pkgrel=2
pkgdesc="A comprehensive library of analysis tools for FMRI, MRI and DTI brain imaging data"
arch=("x86_64")
url="http://www.fmrib.ox.ac.uk/fsl/"
license=(custom)
depends=(gd libxml2 libxml++2.6 gsl libpng nlopt newmat tcl tk zlib python glu boost-libs vtk sqlite python3 fslpy bc openblas)
makedepends=(boost fftw gcc9)
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
	"004-fix_missing_LIB_PROB.patch"
	"005-fix_cuda_thrust_include.patch"
	"006-compile_ptx2_without_std-c++11.patch")

sha256sums=('58b88f38e080b05d70724d57342f58e1baf56e2bd3b98506a72b4446cad5033e'
	    '411daed14287d6ba536cb531450941ab1f570309cd561de4e2a4b0ec43a7e9f7'
	    'c7f93adcf037a73182ae42ae6a59d3eb04a492888b6c2a6b528f9cd16539b2b2'
            '8aac3a2ea61bb4c38eb363262ab7f89e55c49a5feb9912fd2ff71f2439f11fc9'
	    'b3280bafc86d04dfa8835ef21f50469f2645bf09c36edcdd3f04349ce2c74225'
	    '8e343b0ff93477280fd9a980822ddc9980afa7201dea51c886376c189c234c99'
	    '906ac7de8068e5a5487b083844b50b6afd7562866088a4175fd88030182affdd'
	    '13d4cf35343e7a73bc2534c94b1b0d4db41c338d374e6982091e4cf7a421d420'
	    '64b4ccefa63a3cf920b185dd52e94b918c24f2cedaebcec8efb767bd80a6418a'
	    'adea0372f42026e72e385f1bec19ecc8cffa46de1f617271f14c9345c6b83c04'
    	    '9471addfc2f880350eedadcb99cb8b350abf42be1c0652ccddf49e34e5e48734'
            'ab68cb802243ce715eff0d1136cfa29fa34a3e09934e5e20e02a092d69028df1')

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
	# Adapted from Caspar van Leeuwen's patch: https://www.jiscmail.ac.uk/cgi-bin/webadmin?A2=FSL;2b74023.2006
	patch -Np1 -i "${srcdir}"/005-fix_cuda_thrust_include.patch
	# ptx2 does not compile when assuming C++11 standard
	patch -Np1 -i "${srcdir}"/006-compile_ptx2_without_std-c++11.patch

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
