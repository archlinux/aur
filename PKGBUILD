# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

_pkgname=mfem
pkgname=${_pkgname}-palace
pkgver=4.10
pkgrel=1
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
  "0002-mfem_pr5353.diff::https://raw.githubusercontent.com/awslabs/palace/b22f654ab36fe01f1f3176349c60626efed1a6a2/extern/patch/mfem/mfem_pr5353.diff"
  "0003-mfem_pr5494.diff::https://github.com/mfem/mfem/compare/10b0b596dbc26dca384b9f25f23026b1a6403592...399d72c2b7607e25d196dc19fd70b8840eaf1cc8.diff"
  "0004-mfem_pr5502.diff::https://github.com/mfem/mfem/commit/3091ba40b238c4008b67216314bb26da6738b833.diff"
  "0005-enable-MPI_C-interface.patch"
)

b2sums=('9b37057a242f5867e1961c998252995f977b539e1487f8f6d8148b8be9a2200c4f66802e676422eb6eab3ec0869acc99586a43b50199e91f17daef521a848fa6'
        'f82e0b6392fe52e67c0b50abbf5e9fcdca0aacaf74f93f9114a16426f69e0c629c402bbd0d24d9dad01c0538530c35690a01d95fbbe357710cf902ca10319752'
        '7e6267b157ea0c0847428d0c381d2212caaa8c66253e988877c4caa1acb31805e4dfdb59938e8953b17b4de09a3ce639de95875d909c3e8f24f0e09521d438a2'
        'c9023398170e276b34ab27733aec85a12bd6636a832e6164699623b677fbf18e6d7b7f6eeea7e3802795bc525026ac360540083100a1ac73df9ec96ab7a173d7'
        '585d8b4647b4ca5da63e87df7ef65348f52ba253e97562ea488074eebb391cef93861011765430b2a739c5878b97aebfbea18abf37d67b22207080a0a099d5c8'
        '4618e8739b4c0e8fedb77858ecf13ec3961d08e274c11a3df1a04a528104af37f5e6e95ce6f342cdafe7eeadf319cdb3b3a166eab28eb1647796d9693e55b394')

prepare() {
  cd "${_pkgname}"

  # Patch 1: "Consistent edge ordering for MarkTetMeshForRefinement for tetrahedal meshes"
  # https://github.com/mfem/mfem/pull/3847
  patch -Np1 < ../"0001-mfem_pr3847.diff"

  # Patch 2: "Distribute DeltaCoefficient over containing elements"
  # https://github.com/mfem/mfem/pull/5353
  patch -Np1 < ../"0002-mfem_pr5353.diff"

  # Patch 3: "Fix parallel NC hanging-vertex ownership and tetrahedral edge-face communication"
  # https://github.com/mfem/mfem/pull/5494
  patch -Np1 < ../"0003-mfem_pr5494.diff"

  # Patch 4: "NCMesh: fix 8-bit reference-counter overflow at high-valence vertices"
  # https://github.com/mfem/mfem/pull/5502
  patch -Np1 < ../"0004-mfem_pr5502.diff"

  # ArchLinux specific patches!
  # For Strumpack support, we need the MPI-C interface as well as Fortran
  patch -Np1 < ../"0005-enable-MPI_C-interface.patch"

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
  )

  local cmake_options=(
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr 
    -D CMAKE_SKIP_INSTALL_RPATH=ON
    -D BUILD_SHARED_LIBS=TRUE
    -W no-author
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
