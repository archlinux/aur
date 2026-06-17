# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

_pkgname=mfem
pkgname=${_pkgname}-palace
pkgver=4.9
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
  "0001-palace-mfem-pr5246.patch"
  "0002-palace-mfem-pr5353.patch"
  "0003-palace-gmsh-parser-performance.patch"
  "0004-palace-par-tet-mesh-fix-dev.patch"
  "0005-enable-MPI_C-interface.patch"
)

b2sums=('402e2c0086dd9542300513c7f304c8b1774a03bad6391893918fdc09fd265ce92a729d30d9210aeb6023152d7f1fb88bcb6c544d41bbd628801a1b3601f566af'
        '563ae808d3d5bcf918c552cae1b89c214e18ccd29f42e2539997e05b79acbfebcc6bd5f276ed20706ff25c92e00e9ca1b98d2ec3533a2e6379022087e5e8e27c'
        '7e6267b157ea0c0847428d0c381d2212caaa8c66253e988877c4caa1acb31805e4dfdb59938e8953b17b4de09a3ce639de95875d909c3e8f24f0e09521d438a2'
        'aa6c8296073df231d435c0de089b5815eef8b4d3dfed823a877b3afd38941d1d64e428608b1523158e53723b893b0212cbc29c292bf70faebd7cb3385f9faf68'
        'f6ad3a2e8faf1a54f21b7b958965478b5ba90901d3ba9c6a45b9307e18db5a68dcd3cf648d7018607181d622bd31cbced9c0a7d47bcc72408baf5a02f8af5af8'
        '4618e8739b4c0e8fedb77858ecf13ec3961d08e274c11a3df1a04a528104af37f5e6e95ce6f342cdafe7eeadf319cdb3b3a166eab28eb1647796d9693e55b394')

prepare() {
  cd "${_pkgname}"

  # The following are custom patches used by Palace
  # Patch 1: "Backport patch from MFEM pr 5246. Introduces improved quadrature rules for triangles and tetrahedra (and prisms by construction)"
  # https://github.com/awslabs/palace/commit/7c0423fc4188f6c2bdb3414ca27bbe19852c5fc2
  patch -Np1 < ../"0001-palace-mfem-pr5246.patch"

  # Patch 2: "Patch MFEM DeltaCoefficient assembly"
  # https://github.com/awslabs/palace/commit/0382e2bc61255a1aef30d45511b2e43ff2fb5f76
  patch -Np1 < ../"0002-palace-mfem-pr5353.patch"

  # Patch 3: "update mfem and hypre dependencies"
  # https://github.com/awslabs/palace/commit/247ed8143da13e624efd87bd1905259decde1aa8
  patch -Np1 < ../"0003-palace-gmsh-parser-performance.patch"

  # Patch 4: "Test another patch fix, and update further"
  # https://github.com/awslabs/palace/commit/1ab8e7dec2d6c70bac692cfaa258bdb24e237a51
  patch -Np1 < ../"0004-palace-par-tet-mesh-fix-dev.patch"

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
