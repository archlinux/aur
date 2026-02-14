# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_pkgname=trilinos
pkgname="${_pkgname}16"
pkgver=16.2.0
pkgrel=1
pkgdesc="Algorithms and solutions of large-scale, complex multi-physics engineering and scientific problems - 16.X branch"
arch=('x86_64')
url="https://github.com/trilinos/Trilinos"
license=('BSD-3-Clause' 'LGPL-2.1-or-later')
depends=(
	'glibc'
	'gklib'
	'openblas'
	'openmpi'
	'parmetis'
	'metis'
	#'superlu' # TODO: Doesn't compile ATM
	'superlu_dist'
	'suitesparse'
	'libgfortran'
	'libstdc++'
	'libgomp'
	'libgcc'
)
makedepends=(
	'git'
	'cmake'
	'gcc'
	'gcc-fortran'
)
options=()
source=(
	"${_pkgname}::git+${url}#tag=trilinos-release-${pkgver//./-}"
    "0001-epextra-openmp-linkage-workaround.patch"
    "0002-fix-kokkos-cmake-use-install_includedir.patch"
)
b2sums=('391163cccdb10e7c20373e7b6bd7eb5ecb109fac56eb9c46c5940bca2e16145a416e8451588d098c439dc4bbefa72e93e346c0f22d19203a5f333b06516b65a8'
        '76bcd57791866166387af5bd4b2984b9344c766f0a838fd5d0f32ae7670d181a17470efc429aef774b7e6feca68d1d407211bfdee885eaf8536f751b304c76d2'
        '3a11a4ebaf068da3f84e43ec475c7befd6fe3dfcc8b4705c9414218673055f8d2f856eff9e113a8759ffa18c22468e30e86be9b0391a4b546ed1a6e2f746df47')

prepare() {
	cd "${_pkgname}"

	# For newer GCC versions there is a linkage issue between C and C++
	# Suitesparse handles this internally so remove the explicit extern C
	patch -Np1 < ../0001-epextra-openmp-linkage-workaround.patch

	# Kokkos uses a fixed path of /usr/include
	# however we want it to respect CMAKE_INSTALL_INCLUDEDIR
	patch -Np1 < ../0002-fix-kokkos-cmake-use-install_includedir.patch
}

build() {
	local trilinos_options=(
		# Xyce base
		-D Trilinos_ENABLE_NOX=ON
		-D Trilinos_ENABLE_EpetraExt=ON
		-D Trilinos_ENABLE_TrilinosCouplings=ON
		-D Trilinos_ENABLE_Ifpack=ON
		-D Trilinos_ENABLE_AztecOO=ON
		-D Trilinos_ENABLE_Belos=ON
		-D Trilinos_ENABLE_Teuchos=ON
		-D Trilinos_ENABLE_Amesos=ON
		-D Trilinos_ENABLE_Sacado=ON
		-D Trilinos_ENABLE_Stokhos=ON
		-D Trilinos_ENABLE_ROL=ON
		-D Trilinos_ENABLE_Amesos2=ON
		-D Trilinos_ENABLE_COMPLEX_DOUBLE=ON
		-D Trilinos_ENABLE_ALL_OPTIONAL_PACKAGES=OFF
		-D TPL_ENABLE_AMD=ON
		-D TPL_ENABLE_BLAS=ON
		# SuperLU - Doesn't compile
		# -DTPL_ENABLE_SuperLU=ON
		# Xyce beta options - ShyLu-Basker
		-D Trilinos_ENABLE_OpenMP=ON
		-D Trilinos_ENABLE_ShyLU_NodeBasker=ON
		-D TPL_ENABLE_METIS=ON
		# Xyce MPI
		-D Trilinos_ENABLE_Zoltan=ON
		-D Trilinos_ENABLE_Isorropia=ON
		-D TPL_ENABLE_ParMETIS=ON
		-D TPL_ENABLE_SuperLUDist=ON
		# Xyce MPI Beta
		-D Trilinos_ENABLE_ShyLU_DDCore=ON
		# Compile as shared lib
		-D BUILD_SHARED_LIBS=ON
	)

	local install_options=(
		# We want to explicitly set the RPATH ourselves
		-D Trilinos_SET_INSTALL_RPATH=False
		-D Trilinos_INSTALL_INCLUDE_DIR="/usr/include/${pkgname}"
		-D Trilinos_INSTALL_LIB_DIR="/usr/lib/${pkgname}"
	)

	local nox_options=(
		-D NOX_ENABLE_LOCA=ON
	)

	local epextra_options=(
		-D EpetraExt_BUILD_BTF=ON
		-D EpetraExt_BUILD_EXPERIMENTAL=ON
		-D EpetraExt_BUILD_GRAPH_REORDERINGS=ON
	)

	local amesos_options=(
		-D Amesos_ENABLE_KLU=ON
		# SuperLU - Doesn't compile
		# -D Amesos_ENABLE_SuperLU=ON
		# SuperLUDist
		-D Amesos_ENABLE_SuperLUDist=ON
	)

	local amesos2_options=(
		-D Amesos2_ENABLE_KLU2=ON
		-D Amesos2_ENABLE_Basker=ON
	)

	local zoltan_options=(
		-D Zoltan_ENABLE_ParMETIS=ON
	)

	local tpetra_options=(
		# For Kokkos_SERIAL
		-D Tpetra_INST_SERIAL=ON
	)

	local mpi_options=(
		-D TPL_ENABLE_MPI=ON
		# -D MPI_USE_COMPILER_WRAPPERS=OFF
		-D MPI_ALLOW_PACKAGE_PREFIND=ON
	)

	local cmake_includes=(
		# Suitesparse
		-D TPL_AMD_INCLUDE_DIRS="/usr/include/suitesparse"
	)

	local cmake_options=(
		-W no-dev
		-W no-cpp
		-D CMAKE_BUILD_TYPE=None
		-D CMAKE_INSTALL_PREFIX=/usr
		-D CMAKE_POSITION_INDEPENDENT_CODE=ON
		-D CMAKE_INSTALL_RPATH_USE_LINK_PATH=FALSE
		-D CMAKE_INSTALL_RPATH="/usr/lib/${pkgname}"
		# Kokkos needs this
		-D CMAKE_INSTALL_INCLUDEDIR="include/${pkgname}"
		-D CMAKE_INSTALL_LIBDIR="lib/${pkgname}"
	)

	# Now we can finally build
	cmake \
		"${trilinos_options[@]}" \
		"${install_options[@]}"  \
		"${mpi_options[@]}"		 \
		"${nox_options[@]}"      \
		"${epextra_options[@]}"  \
		"${amesos_options[@]}"   \
		"${amesos2_options[@]}"  \
		"${zoltan_options[@]}"   \
		"${tpetra_options[@]}"   \
		"${cmake_includes[@]}"   \
		"${cmake_options[@]}"    \
		-S ${_pkgname}           \
		-B build

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build

	# Remove binary files
	rm ${pkgdir}/usr/bin/*
	rmdir ${pkgdir}/usr/bin

	# Move the version information from /usr/
	install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/" "${pkgdir}/usr/TrilinosRepoVersion.txt"
	rm "${pkgdir}/usr/TrilinosRepoVersion.txt"

	# Licenses
	local LICENSE_DIR="${pkgdir}/usr/share/licenses/${pkgname}"
	# Install top-level LICENSE
	install -Dm644 -t "${LICENSE_DIR}" "${srcdir}/${_pkgname}/LICENSE"
	(
		# Find all of the compiled packages
		local PKGS
		readarray -t PKGS < <(find "${srcdir}/build/packages" -maxdepth 1 -mindepth 1 -exec basename {} \;)

		# Find the LICENSE files from the source directory
		cd "${srcdir}/${_pkgname}/packages"

		# Find all applicable LICENSE files, and copy them to /usr/share/license/
		find "${PKGS[@]}" -type f -name LICENSE -exec install -Dm644 "{}" "${LICENSE_DIR}/{}" \;
	)
}
