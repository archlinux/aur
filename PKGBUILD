# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

_pkgname=mfem
pkgname=${_pkgname}-palace
pkgver=4.9
pkgrel=2
pkgdesc="Lightweight, general, scalable C++ library for finite element methods - With Palace EM Solver patches"
arch=(x86_64)
url="https://github.com/${_pkgname}/${_pkgname}"
license=(BSD-3-Clause)
depends=(
  "metis"
  "parmetis"
  "hypre"
  "openmpi"
  "superlu_dist"
  "libgomp"
  "libstdc++"
  "libgcc"
  "zlib-ng"
  "glibc"
  "strumpack"
  "suitesparse"
  "scalapack"
  "scotch"
)
makedepends=(
  "git"
  "cmake"
)
provides=(
  "${_pkgname}"
  "libmfem.so=${pkgver}-64"
)
conflicts=("${_pkgname}")
options=()
source=(
  "${_pkgname}::git+${url}#tag=v${pkgver}"
  "0001-mfem_pr3847.diff::https://github.com/mfem/mfem/compare/2d574015756711029556c14d096ca52c15d5b663...50ead1a9a785e3273b2a72ff59ac8ed8a496b498.diff"
  "0002-mfem_gmsh_parser_performance.diff::https://github.com/mfem/mfem/commit/e4a2b9568c40f20e24612066d155cc6a9973b247.diff"
  "0003-mfem_pr5246.diff::https://raw.githubusercontent.com/awslabs/palace/b22f654ab36fe01f1f3176349c60626efed1a6a2/extern/patch/mfem/mfem_pr5246.diff"
  "0004-mfem_pr5353.diff::https://raw.githubusercontent.com/awslabs/palace/b22f654ab36fe01f1f3176349c60626efed1a6a2/extern/patch/mfem/mfem_pr5353.diff"
  "0005-mfem_pr4983.diff::https://raw.githubusercontent.com/awslabs/palace/b22f654ab36fe01f1f3176349c60626efed1a6a2/extern/patch/mfem/mfem_pr4983.diff"
  "0006-mfem_pr5415.diff::https://github.com/mfem/mfem/commit/9d1438d8a2502cc927c63e093cf8c855ff17918e.diff"
  "0007-enable-MPI_C-interface.patch"
)

b2sums=('402e2c0086dd9542300513c7f304c8b1774a03bad6391893918fdc09fd265ce92a729d30d9210aeb6023152d7f1fb88bcb6c544d41bbd628801a1b3601f566af'
        'f82e0b6392fe52e67c0b50abbf5e9fcdca0aacaf74f93f9114a16426f69e0c629c402bbd0d24d9dad01c0538530c35690a01d95fbbe357710cf902ca10319752'
        'c1695cd6235b40ad22dec5b46b53b2c63804946bea2909dd5e6d1f44fbbf00d5e69036720f9b849168d6c1c49a77516f4e7e5d1bc3df556619a433362e2c0d4c'
        '563ae808d3d5bcf918c552cae1b89c214e18ccd29f42e2539997e05b79acbfebcc6bd5f276ed20706ff25c92e00e9ca1b98d2ec3533a2e6379022087e5e8e27c'
        '7e6267b157ea0c0847428d0c381d2212caaa8c66253e988877c4caa1acb31805e4dfdb59938e8953b17b4de09a3ce639de95875d909c3e8f24f0e09521d438a2'
        '18aacda2b07d1859f8f0aa9b06698e9c412064e81e11fd5f3e7377a64b7c0a6ddb72acc4a36dd25acd826b766b8f22015bc12f666446b077a6da012e26b1fd18'
        '976cb7e847d90eed39b9e9227010a2a91a5198d4d9b6413ecd786aa391b2395470e26000fbcbe3f3461eb94618d58e222a50a22921b9947657663623df0c260a'
        '4618e8739b4c0e8fedb77858ecf13ec3961d08e274c11a3df1a04a528104af37f5e6e95ce6f342cdafe7eeadf319cdb3b3a166eab28eb1647796d9693e55b394')

prepare() {
  cd "${_pkgname}"

  # Patch 1: "Consistent edge ordering for MarkTetMeshForRefinement for tetrahedal meshes"
  # https://github.com/mfem/mfem/pull/3847
  patch -Np1 < ../"0001-mfem_pr3847.diff"

  # Patch 2: "Some refactoring and performance improvements for Gmsh v2 parser"
  # https://github.com/mfem/mfem/commit/e4a2b9568c40f20e24612066d155cc6a9973b247
  patch -Np1 < ../"0002-mfem_gmsh_parser_performance.diff"

  # Patch 3: "Add positive-weight simplex quadrature rules for orders 0-20"
  # https://github.com/mfem/mfem/pull/5246
  patch -Np1 < ../"0003-mfem_pr5246.diff"

  # Patch 4: "Distribute DeltaCoefficient over containing elements"
  # https://github.com/mfem/mfem/pull/5353
  patch -Np1 < ../"0004-mfem_pr5353.diff"

  # Patch 5: "Methods for extracting boundary edge DOFs from a 3D ParMesh and for synchronizing boundary conditions across processor boundaries"
  # https://github.com/mfem/mfem/pull/4983
  patch -Np1 < ../"0005-mfem_pr4983.diff"

  # Patch 6: "Create node-local DataCollection output folders"
  # https://github.com/mfem/mfem/pull/5415
  patch -Np1 < ../0006-mfem_pr5415.diff

  # ArchLinux specific patches!
  # For Strumpack support, we need the MPI-C interface as well as Fortran
  patch -Np1 < ../"0007-enable-MPI_C-interface.patch"

}

build() {
  local mfem_options=(
    -D MFEM_USE_MPI=ON
    -D MFEM_USE_METIS=ON
    -D MFEM_USE_ZLIB=ON
    -D MFEM_USE_LAPACK=ON
    -D MFEM_USE_SUITESPARSE=ON
    -D MFEM_USE_SUPERLU=ON
    -D MFEM_USE_MUMPS=OFF
    -D MFEM_USE_STRUMPACK=ON
    -D MFEM_USE_OPENMP=ON
    # HIP
    -D MFEM_USE_HIP=OFF
    -D MFEM_USE_UMPIRE=OFF
  )

  local mfem_external=(
    -D SuperLUDist_DIR=/usr/include/superlu_dist
    -D STRUMPACK_DIR=/usr/include/strumpack
    -D Scotch_DIR=/usr/include/scotch
    -D HYPRE_DIR=/usr/include/hypre
    -D ScaLAPACK_DIR=/usr/include/
    -D METIS_DIR=/usr/include/
    -D SuiteSparse_DIR=/usr/include/suitesparse
    -D ParMETIS_DIR=/usr/include/
    -D TPL_BLAS_LIBRARIES="/usr/lib/libblas.so"
    -D TPL_LAPACK_LIBRARIES="/usr/lib/liblapack.so"
    -D TPL_SCALAPACK_LIBRARIES="/usr/lib/liscalapack.so"
  )

  local cmake_options=(
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr 
    -D CMAKE_SKIP_INSTALL_RPATH=ON
    -D BUILD_SHARED_LIBS=TRUE
    -W no-dev
    -D BLA_VENDOR="OpenBLAS"
  )
  
  cmake \
    "${mfem_options[@]}"     \
    "${mfem_external[@]}"    \
    "${cmake_options[@]}"    \
    -S ${_pkgname}           \
    -B build

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm 644 ${_pkgname}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: set ts=4 sw=4 et:
