# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
# Contributor: fishburn <frankthefishburn@gmail.com>

# Set number of parallel compile jobs, default equals number of CPUs
NJOBS=$(nproc)
NJOBS=8

pkgname=fsl
pkgver=6.0.5
pkgrel=1
pkgdesc="A comprehensive library of analysis tools for FMRI, MRI and DTI brain imaging data"
arch=("x86_64")
url="http://www.fmrib.ox.ac.uk/fsl/"
license=(custom)
depends=(gd libxml2 libxml++2.6 gsl libpng nlopt newmat tcl tk zlib python glu boost-libs vtk sqlite python3 'fslpy>=3.7.0' bc openblas)
makedepends=(boost fftw gcc9)
optdepends=(cuda)
source=("https://www.fmrib.ox.ac.uk/fsldownloads/fsl-${pkgver}-sources.tar.gz"
        "https://www.fmrib.ox.ac.uk/fsldownloads/fsl-${pkgver}-feeds.tar.gz"
	"buildSettings.mk"
	"fsl_sub"
	"001-use_distribution_environment.patch"
	"002-fix_fsl_exec_empty_errorCode.patch"
	"003-fix_missing_LIB_PROB.patch")

sha256sums=('df12b0b1161a26470ddf04e4c5d5d81580a04493890226207667ed8fd2b4b83f'
	    'e68e1efeb45750f876f350442f56c4830d211e9fb16daa5ad134bb8e1ef1ae18'
	    '880c46d4ef8a8ee1401e1fdb71dadd0f79aad2154967a03232844845227394a3'
	    '2516982d151ab9e450a9ac6d5a6fc87099a7acc067514d80422c69950e618170'
	    '906ac7de8068e5a5487b083844b50b6afd7562866088a4175fd88030182affdd'
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
	MAKEOPTIONS="-j $NJOBS" ./build extras CiftiLib-master utils znzlib NewNifti fslio giftiio miscmaths newimage libvis first_lib meshclass fslvtkio misc_tcl basisfield warpfns bint shapeModel MVdisc
        MAKEOPTIONS="" ./build fslsurface # fslsurface does not like parallel compiling
        MAKEOPTIONS="-j $NJOBS" ./build libmeshutils newmesh DiscreteOpt FastPDlib MSMRegLib misc_c topup asl_mfree avwutils basil baycest bet2 bianca cluster fsl_deface eddy fabber_core fabber_models_asl fabber_models_cest fabber_models_dce fabber_models_dsc fabber_models_dualecho fabber_models_dwi fabber_models_pet fabber_models_qbold fabber_models_t1 fast4 fdt feat5 film filmbabe first flameo flirt fnirt fslvbm fugue gps lesions mcflirt melodic misc_scripts miscvis mist mm MSM oxford_asl possum ptx2 qboot randomise siena slicetimer susan swe tbss verbena xtract
	# Install missing binaries, which are now Python scripts and shipped with fslpy
	/usr/bin/install -m 755 /usr/bin/{imcp,imglob,immv} "${srcdir}"/fsl/bin
	# Install missing fsl_sub script from 6.0.4
	/usr/bin/install -m 755 "${srcdir}"/fsl_sub "${srcdir}"/fsl/bin
	# Create fake fslpython environment (all dependencies have been taken care of system-wide)
	ln -s /usr/bin/python "${srcdir}"/fsl/bin/fslpython
}

check() {
	export FSLDIR="${srcdir}/fsl"
	export FEEDSDIR="${srcdir}/feeds"
	. "${FSLDIR}/etc/fslconf/fsl.sh"
	export PATH="${FSLDIR}/bin":${PATH}
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
