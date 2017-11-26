# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>

pkgname=fsl
pkgver=5.0.10
pkgrel=2
pkgdesc="A comprehensive library of analysis tools for FMRI, MRI and DTI brain imaging data"
arch=("i686" "x86_64")
url="http://www.fmrib.ox.ac.uk/fsl/"
license=(custom)
depends=(gd libxml2 libxml++2.6 gsl libpng nlopt newmat tcl tk zlib python glu boost-libs vtk6 sqlite)
makedepends=(boost fftw)
optdepends=(cuda)
sha1sums=('1b68ab3e1bc10755de1aa249e829e5fc4937c6b3'
          'eaea714f2430f85226a5c938ba19dcadb7adb5bf'
          '679c65c90e79b7f748ad1c2d4b5abeebebf05dfd'
          'c2398008b8416f01b01c31b9fed80e57f155fea0'
          '2df550b126a6ec6022a164a18dddffe4e59962f9')

source=("http://www.fmrib.ox.ac.uk/fsldownloads/fsl-${pkgver}-sources.tar.gz"
        "http://www.fmrib.ox.ac.uk/fsldownloads/fsl-${pkgver}-feeds.tar.gz"
	"systemvars.mk"
	"externallibs.mk"
	"fsl_exec.patch")

prepare() {
	
	cd "${srcdir}"

	export FSLDIR="${srcdir}/fsl"
	. "${FSLDIR}/etc/fslconf/fsl.sh"
	export FSLMACHTYPE=`${FSLDIR}/etc/fslconf/fslmachtype.sh`

	# Create new configuration
	if [ ! -e "${FSLDIR}/config/${FSLMACHTYPE}" ]; then
	    mkdir "${FSLDIR}/config/${FSLMACHTYPE}"
	    cp "${srcdir}/systemvars.mk" "${FSLDIR}/config/${FSLMACHTYPE}/"
	    cp "${srcdir}/externallibs.mk" "${FSLDIR}/config/${FSLMACHTYPE}/"
	fi

	# Copy makepkg build flags into configuration
	sed -i '0,/${AccumulatedIncFlags}/{s^${AccumulatedIncFlags}^& '"${CFLAGS}"'^}' "${srcdir}/fsl/config/common/vars.mk"
	sed -i '0,/${AccumulatedIncFlags}/{s^${AccumulatedIncFlags}^& '"${CPPFLAGS}"'^}' "${srcdir}/fsl/config/common/vars.mk"
	sed -i '1,/${AccumulatedIncFlags}/!{s^${AccumulatedIncFlags}^& '"${CXXFLAGS}"'^}' "${srcdir}/fsl/config/common/vars.mk"
	sed -i '1,/${AccumulatedIncFlags}/!{s^${AccumulatedIncFlags}^& '"${CPPFLAGS}"'^}' "${srcdir}/fsl/config/common/vars.mk"
	sed -i 's^LDFLAGS = .*$^& '"${LDFLAGS}"'^g' "${srcdir}/fsl/config/common/vars.mk"

	# Fix 32-bit
	if test "$CARCH" == i686; then
	    sed -i "s^-m64^^g" "${FSLDIR}/config/${FSLMACHTYPE}/systemvars.mk"
	fi

	# Use system TCL/Tk
	sed -i 's^$FSLDIR/bin/fsltclsh^/usr/bin/tclsh^g' "${FSLDIR}/etc/fslconf/fsl.sh"
	sed -i 's^$FSLDIR/bin/fsltclsh^/usr/bin/tclsh^g' "${FSLDIR}/etc/fslconf/fsl-devel.sh"
	sed -i 's^$FSLDIR/bin/fsltclsh^/usr/bin/tclsh^g' "${FSLDIR}/etc/fslconf/fsl.csh"
	sed -i 's^$FSLDIR/bin/fslwish^/usr/bin/wish^g' "${FSLDIR}/etc/fslconf/fsl.sh"
	sed -i 's^$FSLDIR/bin/fslwish^/usr/bin/wish^g' "${FSLDIR}/etc/fslconf/fsl-devel.sh"
	sed -i 's^$FSLDIR/bin/fslwish^/usr/bin/wish^g' "${FSLDIR}/etc/fslconf/fsl.csh"

	# Disable building of system libraries
	sed -i 's/ libgd / /g' "${FSLDIR}/extras/build"
	sed -i 's/ libxml2-2.9.2 / /g' "${FSLDIR}/extras/build"
	sed -i 's/ libxml++-2.34.0 / /g' "${FSLDIR}/extras/build"
	sed -i 's/ newmat / /g' "${FSLDIR}/extras/build"
	sed -i 's/ boost / /g' "${FSLDIR}/extras/build"
	sed -i 's/ libnlopt / /g' "${FSLDIR}/extras/build"
	sed -i 's/ libpng"/"/g' "${FSLDIR}/extras/build"
	sed -i 's/ libiconv"/"/g' "${FSLDIR}/extras/build"
	sed -i 's/ zlib"/"/g' "${FSLDIR}/extras/build"
	sed -i 's/ fftw"/"/g' "${FSLDIR}/extras/build"
	sed -i 's/"tcl tk"/""/g' "${FSLDIR}/extras/build"

	# Link mist-clean against system sqlite
	sed -i 's^${SQLITE_LIB}/libsqlite3.a^-lsqlite3^g' "${srcdir}/fsl/src/mist-clean/Makefile"

	# Fix Melodic use of ifstream
	sed -i 's^if(in>0)^if(!!in)^g' "${FSLDIR}/src/melodic/meldata.cc"

	# Add missing library directories
	sed -i 's^-L${LIB_ZLIB}$^& -L${LIB_PROB}^g' "${FSLDIR}/src/asl_mfree/Makefile"
	sed -i 's^-L${LIB_NEWMAT} $^&-L${LIB_PROB}^g' "${FSLDIR}/src/first/Makefile"
	sed -i 's^-L${LIB_NEWMAT} $^&-L${LIB_PROB}^g' "${FSLDIR}/src/topup/Makefile"

	# Fix problem w/ dynamically-linked boost
	sed -i 's^USRCXXFLAGS = -std=c++11$^& -DBOOST_LOG_DYN_LINK^g' "${FSLDIR}/src/mist-clean/Makefile"

	# Fix fsl_exec.tcl session issue (https://www.jiscmail.ac.uk/cgi-bin/webadmin?A2=fsl;e8fa48c1.1501)
	patch -p0 < fsl_exec.patch
	
}

build() {

	export FSLDIR="${srcdir}/fsl"
	cd "${FSLDIR}"
	./build
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

	find "${pkgdir}" -type f -exec chmod 644 {} \;
	find "${pkgdir}" -type d -exec chmod 755 {} \;
	find "${pkgdir}/opt/fsl/bin" -exec chmod 755 {} \;
	find "${pkgdir}/opt/fsl/etc/fslconf" -exec chmod 755 {} \;
	chmod 755 "${pkgdir}/etc/profile.d/fsl.sh"
	
	mkdir -p "${pkgdir}/opt/fsl/feeds/results"
	chmod -R 777 "${pkgdir}/opt/fsl/feeds/results"
	chmod 755 "${pkgdir}/opt/fsl/feeds/RUN"
	
	find "${pkgdir}" -empty -delete
	find "${pkgdir}" -type f -exec sed -i 's^/usr/local/fsl^/opt/fsl^g' "{}" \;
}
