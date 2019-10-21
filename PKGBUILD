# Maintainer: Darjan Krijan (daren) <darjan_krijan@gmx.de>
# Manual download of '${pkgname}-${os}-${pkgver}.tar.gz' required from upstream

pkgname=aocl
pkgver=2.0
pkgrel=2
pkgdesc="AMD Optimizing CPU Libraries"
arch=('x86_64')
license=('custom')
url="https://developer.amd.com/amd-aocl/"
os=ubuntu
source=(
	"local://${pkgname}-${os}-${pkgver}.tar.gz"
	"local://aocl.install"
	"local://modulefile"
)
options=('staticlibs' '!strip')
depends=('env-modules')
install=aocl.install
sha256sums=(
	"4fd14dc838ce13a6d1468ed0812905b102d85709b17ab8228513da37448d2993"
	"SKIP"
	"SKIP"
)

aocl_prefix=/opt/aocl

# gen_pkg_config_file \
# <basename> <libdir_from_prefix> <includedir_from_prefix> <ldflags> <requires>
gen_pkg_config_file() {
	pcfile=${prefix}/${_pkgname}/lib/pkgconfig/${1}.pc
	mkdir -p ${prefix}/${_pkgname}/lib/pkgconfig
	echo " -> Generating pkg-config file '${pcfile}'..."
	cat > ${pcfile} <<EOF
prefix=${aocl_prefix}/${_pkgname}
includedir=\${prefix}/${3}
libdir=\${prefix}/${2}

Name: ${_pkgname}
Version: ${_pkgver}
Description: ${_pkgdesc}
URL: ${_pkgurl}
Requires: ${5}
Cflags: -I\${includedir}
Libs: -L\${libdir} ${4}
EOF
}

# gen_static pkg_config_file \
# <basename> <libdir_from_prefix> <includedir_from_prefix> <ldflags> <ldflags_private> <requires>
gen_static_pkg_config_file() {
	pcfile_static=${prefix}/${_pkgname}/lib/pkgconfig/${1}.pc
	echo " -> Generating pkg-config file '${pcfile_static}'..."
	cat > ${pcfile_static} <<EOF
prefix=${aocl_prefix}/${_pkgname}
libdir=\${prefix}/${2}
includedir=\${prefix}/${3}

Name: ${_pkgname}
Version: ${_pkgver}
Description: ${_pkgdesc}
URL: ${_pkgurl}
Requires: ${6}
Cflags: -I\${includedir}
Libs: -L\${libdir} ${4}
Libs.private: ${5}
EOF
}

get_dynlibs() {
	objdump -p ${prefix}/${_pkgname}/lib/lib${1}.so | grep NEEDED >> /tmp/get_dynlibs.txt
	objdump -p ${prefix}/${_pkgname}/lib/lib${1}.so \
		| grep "NEEDED" \
		| grep -v "libc\|linux-" \
		| sed -e "s/.*lib\(.*\)\.so.*/-l\1/g" \
		| tr '\n' ' ' \
		&& echo ""
}

package() {
	prefix=${pkgdir}/${aocl_prefix}
	mkdir -p ${prefix}

	src_prefix=${srcdir}/${pkgname}-${os}-${pkgver}

	cp ${src_prefix}/AOCL_User_Guide_${pkgver}.pdf \
		${prefix}

	# =========================
	# amd-blis
	# -------------------------
	_pkgname="amd-blis"
	_pkgver="2.0"
	_pkgdesc="BLIS is a portable software framework for instantiating high-performance BLAS-like dense linear algebra libraries"
	_pkgurl="https://developer.amd.com/amd-aocl/blas-library/"

	echo -e "\nInstalling ${_pkgname} to '${prefix}/${_pkgname}/..."
	mkdir -p ${prefix}/${_pkgname}
	tar --no-same-owner -xf \
		${src_prefix}/aocl-${_pkgname#"amd-"}-${os}-${_pkgver}.tar.gz \
		--strip-components=1 \
		-C ${prefix}/${_pkgname}

	# The shared library is missing all dynamic links, linking against this won't work
	gen_pkg_config_file \
		${_pkgname} lib include/blis -lblis
	# Hardcoding Libs.private
	gen_static_pkg_config_file \
		${_pkgname}-static lib include/blis -l:libblis.a "-lm -lpthread"

	# =========================
	# amd-blis-mt
	# -------------------------
	_pkgname="amd-blis-mt"
	_pkgver="2.0"
	_pkgdesc="BLIS is a portable software framework for instantiating high-performance BLAS-like dense linear algebra libraries"
	_pkgurl="https://developer.amd.com/amd-aocl/blas-library/"

	echo -e "\nInstalling ${_pkgname} to '${prefix}/${_pkgname}/..."
	mkdir -p ${prefix}/${_pkgname}
	tar --no-same-owner -xf \
		${src_prefix}/aocl-${_pkgname#"amd-"}-${os}-${_pkgver}.tar.gz \
		--strip-components=1 \
		-C ${prefix}/${_pkgname}

	# fix lib: symlink libblis-mt.so -> libblis.so.2.0.0 collides with amd-blis
	#          since the linker resolves the link during compile time
	#          when all the lib directories are set in LD_LIBRARY_PATH
	mv ${prefix}/${_pkgname}/lib/libblis.so.2.0.0 ${prefix}/${_pkgname}/lib/libblis-mt.so

	gen_pkg_config_file \
		${_pkgname} lib include/blis -lblis-mt

	gen_static_pkg_config_file \
		${_pkgname}-static lib include/blis -l:libblis-mt.a "$(get_dynlibs blis-mt)"

	# =========================
	# amd-fftw
	# -------------------------
	_pkgname="amd-fftw"
	_pkgver="2.0"
	_pkgdesc="Fast Fourier transform library"
	_pkgurl="https://developer.amd.com/amd-aocl/fftw/"

	echo -e "\nInstalling ${_pkgname} to '${prefix}/${_pkgname}/..."
	mkdir -p ${prefix}/${_pkgname}
	tar --no-same-owner -xf \
		${src_prefix}/aocl-${_pkgname#"amd-"}-${os}-${_pkgver}.tar.gz \
		--strip-components=1 \
		-C ${prefix}/${_pkgname}

	# pkg-config fftw3
	gen_pkg_config_file \
		${_pkgname} lib include -lfftw3
	gen_static_pkg_config_file \
		${_pkgname}-static lib include -l:libfftw3.a "$(get_dynlibs fftw3)"
	gen_pkg_config_file \
		${_pkgname}-mpi lib include -lfftw3_mpi ${_pkgname}
	gen_static_pkg_config_file \
		${_pkgname}-mpi-static lib include -l:libfftw3_mpi.a "$(get_dynlibs fftw3_mpi)" ${_pkgname}-static
	gen_pkg_config_file \
		${_pkgname}-omp lib include -lfftw3_omp ${_pkgname}
	gen_static_pkg_config_file \
		${_pkgname}-omp-static lib include -l:libfftw3_omp.a "$(get_dynlibs fftw3_omp)" ${_pkgname}-static

	# pkg-config fftw3f
	gen_pkg_config_file \
		${_pkgname}f lib include -lfftw3f
	gen_static_pkg_config_file \
		${_pkgname}f-static lib include -l:libfftw3f.a "$(get_dynlibs fftw3f)"
	gen_pkg_config_file \
		${_pkgname}f-mpi lib include -lfftw3f_mpi ${_pkgname}f
	gen_static_pkg_config_file \
		${_pkgname}f-mpi-static lib include -l:libfftw3f_mpi.a "$(get_dynlibs fftw3f_mpi)" ${_pkgname}f-static
	gen_pkg_config_file \
		${_pkgname}f-omp lib include -lfftw3f_omp ${_pkgname}f
	gen_static_pkg_config_file \
		${_pkgname}f-omp-static lib include -l:libfftw3f_omp.a "$(get_dynlibs fftw3f_omp)" ${_pkgname}f-static

	# =========================
	# amd-libflame
	# -------------------------
	_pkgname="amd-libflame"
	_pkgver="2.0"
	_pkgdesc="libFLAME is a portable library for dense matrix computations, providing much of the functionality present in LAPACK"
	_pkgurl="https://developer.amd.com/amd-aocl/blas-library/#libflame"

	echo -e "\nInstalling ${_pkgname} to '${prefix}/${_pkgname}/..."
	mkdir -p ${prefix}/${_pkgname}
	tar --no-same-owner -xf \
		${src_prefix}/aocl-${_pkgname#"amd-"}-${os}-${_pkgver}.tar.gz \
		--strip-components=1 \
		-C ${prefix}/${_pkgname}

	gen_pkg_config_file \
		${_pkgname} lib include -lflame
	gen_static_pkg_config_file \
		${_pkgname}-static lib include -l:libflame.a $(get_dynlibs flame)

	# =========================
	# amd-libm
	# -------------------------
	_pkgname="amd-libm"
	_pkgver="3.4.0"
	_pkgdesc="AMD LibM is a software library containing a collection of basic math functions optimized for x86-64 processor based machines"
	_pkgurl="https://developer.amd.com/amd-aocl/amd-math-library-libm/"

	echo -e "\nInstalling ${_pkgname} to '${prefix}/${_pkgname}/..."
	mkdir -p ${prefix}/${_pkgname}
	tar --no-same-owner -xf \
		${src_prefix}/aocl-${_pkgname#"amd-"}-${os}-${_pkgver}.tar.gz \
		--strip-components=1 \
		-C ${prefix}/${_pkgname}

	# amd-libm cleanup
	mv ${prefix}/${_pkgname}/lib/dynamic/* ${prefix}/${_pkgname}/lib
	mv ${prefix}/${_pkgname}/lib/static/* ${prefix}/${_pkgname}/lib
	rmdir ${prefix}/${_pkgname}/lib/dynamic
	rmdir ${prefix}/${_pkgname}/lib/static

	gen_pkg_config_file \
		${_pkgname} lib include -lamdlibm
	gen_pkg_config_file \
		${_pkgname}-static lib include -l:libamdlibm.a $(get_dynlibs amdlibm)

	# =========================
	# amd-rng
	# -------------------------
	_pkgname="amd-rng"
	_pkgver="2.0"
	_pkgdesc="AMD Random Number Generator Library is a pseudorandom number generator library. A pseudo-random number generator (PRNG) produces a stream of variates that are independent and statistically indistinguishable from a random sequence"
	_pkgurl="https://developer.amd.com/amd-aocl/rng-library/"

	echo -e "\nInstalling ${_pkgname} to '${prefix}/${_pkgname}/..."
	mkdir -p ${prefix}/${_pkgname}
	tar --no-same-owner -xf \
		${src_prefix}/aocl-${_pkgname#"amd-"}-${os}-${_pkgver}.tar.gz \
		--strip-components=1 \
		-C ${prefix}/${_pkgname}

	# amd-rng cleanup
	mv ${prefix}/${_pkgname}/rng/* ${prefix}/${_pkgname}
	rm -r ${prefix}/${_pkgname}/rng
	mv ${prefix}/${_pkgname}/rng-omp/lib_omp/* ${prefix}/${_pkgname}/lib
	rm -r ${prefix}/${_pkgname}/rng-omp
	rm -r ${prefix}/${_pkgname}/lib/libamdsecrng* # duplicate from aocl-securerng? not linked to rng_amd
	chmod a-x ${prefix}/${_pkgname}/include/rng.h # for some reason this is executable

	gen_pkg_config_file \
		${_pkgname} lib include -lrng_amd
	gen_static_pkg_config_file \
		${_pkgname}-static lib include -l:librng_amd.a $(get_dynlibs rng_amd)
	gen_pkg_config_file \
		${_pkgname}-omp lib include -lrng_omp_amd
	gen_static_pkg_config_file \
		${_pkgname}-omp-static lib include -l:librng_omp_amd.a $(get_dynlibs rng_omp_amd)

	# =========================
	# amd-securerng
	# -------------------------
	_pkgname="amd-securerng"
	_pkgver="2.0"
	_pkgdesc="The AMD Secure Random Number Generator (RNG) is a library that provides APIs to access the cryptographically secure random numbers generated by AMD’s hardware-based random number generator implementation"
	_pkgurl="https://developer.amd.com/amd-aocl/rng-library/"

	echo -e "\nInstalling ${_pkgname} to '${prefix}/${_pkgname}/..."
	mkdir -p ${prefix}/${_pkgname}
	tar --no-same-owner -xf \
		${src_prefix}/aocl-${_pkgname#"amd-"}-${os}-${_pkgver}.tar.gz \
		--strip-components=1 \
		-C ${prefix}/${_pkgname}

	# Name this lib properly
	mv ${prefix}/${_pkgname}/lib/libamdsecrng-*.so ${prefix}/${_pkgname}/lib/libamdsecrng.so
	mv ${prefix}/${_pkgname}/lib/libamdsecrng-*.a ${prefix}/${_pkgname}/lib/libamdsecrng.a

	gen_pkg_config_file \
		${_pkgname} lib include -lamdsecrng
	gen_static_pkg_config_file \
		${_pkgname}-static lib include -l:libamdsecrng.a $(get_dynlibs amdsecrng)

	# =========================
	# Finalize
	# -------------------------
	# Delete symlinks, remove version string from dynamic libs so they can be linked directly
	echo -e "\nRemoving lib symlinks and renaming the libs..."
	find ${prefix} -type l \( -name "lib*.so*" -o -name "lib*.a*" \) -delete
	sofiles=`find ${prefix} -type f -name "lib*.so*" -printf '%p\n' | sort`

	for so in ${sofiles}; do
		if [ ${so} != ${so%.so*}.so ]; then
			mv ${so} ${so%.so*}.so
		fi
	done

	afiles=`find ${prefix} -type f -name "lib*.a*" -printf '%p\n' | sort`

	for a in ${afiles}; do
		if [ ${a} != ${a%.a*}.a ]; then
			mv ${a} ${a%.a*}.a
		fi
	done

	# Some dynamic libs are not executable for some reason, fix this
	echo -e "\nFixing some dynamic libs not being executable..."
	find ${prefix} -type f -name "lib*.so" -exec chmod a+x {} \;

	# Clean pkg-config files
	echo -e "\nCleaning pkg-config files..."
	find ${prefix} -type f -name "*.pc" -exec sed -i {} -e "s/[[:space:]]*$//g" \;

	
	# modulefile
	echo -e "\nSymlinking modulefile '${modulefile}'..."
	cp ${srcdir}/modulefile ${pkgdir}${aocl_prefix}
	mkdir -p ${pkgdir}${MODULESHOME}/modulefiles/
	ln -s ${aocl_prefix}/modulefile ${pkgdir}${MODULESHOME}/modulefiles/${pkgname}
}
