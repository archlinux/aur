# Maintainer: Andrea Zanoni <andrea dot zanoni at polimi dot it>
pkgname=mbdyn-git
pkgver=r18.fbacc87
pkgrel=1
pkgdesc="The first *free* general purpose Multibody Dynamics analysis software"
arch=('x86_64')
url='https://www.mbdyn.org'
license=('GPL-2.0-or-later')
depends=(
	'suitesparse'
	'netcdf'
	'netcdf-cxx'
	'hdf5'
	'arpack'
	'lapack'
	'blas'
	'python'
	'python-numpy'
	'octave'
	'gtest'
	'boost'
)
makedepends=(
	'git'
	'autoconf'
	'automake'
	'gcc-fortran'
	'libtool'
)
optdepends=(
	'trilinos: advanced nonlinear solver support (NOX) - requires version 16.1.0 from AUR'
	'ginac: symbolic elements support'
	'intel-oneapi-mkl: Intel MKL PARDISO sparse solver support'
)
source=("${pkgname}::git+https://public.gitlab.polimi.it/DAER/mbdyn.git#branch=develop")
install=mbdyn.install
sha256sums=('SKIP')
options=('!buildflags')

# Note: edit the list of modules to suit your needs
# All modules enabled by default, remove ones you don't need
_modules="fabricate damper-gandhi pid hfelem fab-electric template2 cont-contact wheel4 mds indvel mcp_test1 scalarfunc muscles minmaxdrive drive-test loadinc cudatest randdrive imu convtest md autodiff_test rotor-loose-coupling namespace drive controller constlaw fab-sbearings rotor_disc hunt-crossley diff damper-hydraulic cyclocopter fab-motion flightgear hid ns damper-graall nonsmooth-node cosim-output"

# Compiler optimization flags (matching Arch build script)
_compiler_flags="-Ofast -march=native -mtune=native"

pkgver() {
	cd ${pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd ${srcdir}/${pkgname}
	sh bootstrap.sh
}

build() {
	cd ${srcdir}/${pkgname}
	
	# Setup include paths
	CPPFLAGS="-I/usr/include/suitesparse"
	
	# Check if Trilinos is installed
	_trilinos_flag="--without-trilinos"
	if pacman -Q trilinos &>/dev/null; then
		echo "==> Trilinos detected, enabling Trilinos support"
		_trilinos_flag="--with-trilinos"
		CPPFLAGS+=" -I/usr/include/trilinos -I/usr/include/trilinos/kokkos"
	else
		echo "==> Trilinos not found, building without Trilinos support"
		echo "==> Install 'trilinos' from AUR for advanced nonlinear solver support (NOX)"
	fi
	
	# Check if Intel MKL is installed
	_pardiso_flag="--without-pardiso"
	if [[ -d "/opt/intel/oneapi/mkl" ]]; then
		echo "==> Intel MKL detected, enabling PARDISO support"
		_pardiso_flag="--with-pardiso"
		_mkl_pc=$(find /opt/intel/oneapi/mkl -name "mkl-dynamic-lp64-gomp.pc" 2>/dev/null | head -1)
		if [[ -n "$_mkl_pc" ]]; then
			export PKG_CONFIG_PATH="$(dirname $_mkl_pc):${PKG_CONFIG_PATH}"
			CPPFLAGS+=" $(pkg-config --cflags-only-I mkl-dynamic-lp64-gomp)"
			LDFLAGS+=" $(pkg-config --libs-only-L mkl-dynamic-lp64-gomp)"
			LDFLAGS+=" $(pkg-config --libs-only-L mkl-dynamic-lp64-gomp | sed 's/^-L\//-Wl,-rpath=\//g')"
		fi
	fi
	
	# Python configuration
	PYTHON_VERSION="3"
	export CPPFLAGS
	export LDFLAGS
	
	# Enable runtime loading for modules
	CXXFLAGS="${_compiler_flags} -std=c++20 -rdynamic"
	CFLAGS="${_compiler_flags}"
	FFLAGS="${_compiler_flags}"
	FCFLAGS="${_compiler_flags}"
	
	./configure \
		PYTHON_VERSION="${PYTHON_VERSION}" \
		CPPFLAGS="${CPPFLAGS}" \
		CXXFLAGS="${CXXFLAGS}" \
		CFLAGS="${CFLAGS}" \
		FFLAGS="${FFLAGS}" \
		FCFLAGS="${FCFLAGS}" \
		--prefix=/usr \
		--libexecdir=/usr/lib/${pkgname::-4} \
		--with-module="${_modules}" \
		--enable-python \
		--enable-octave \
		--enable-octave-utils \
		--enable-netcdf \
		--with-lapack \
		--with-arpack \
		--with-umfpack \
		--with-klu \
		--with-suitesparseqr \
		--with-static-modules \
		--without-mpi \
		--without-siconos \
		--enable-runtime-loading \
		--enable-Werror=no \
		--with-gtest \
		--enable-override-operator-new \
		--enable-multithread \
		${_trilinos_flag} \
		${_pardiso_flag}
	
	make -j$(nproc)
}

package() {
	cd ${srcdir}/${pkgname}
	make DESTDIR="${pkgdir}" install
}
