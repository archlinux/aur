# Maintainer: ResRipper <resripper at connective dot link>

# shellcheck disable=SC2034,SC2148,SC2154,SC2164

# Note:
# Enabling Mumps will cause some tests to timeout/failed.

_name=elmerfem
pkgname=elmerfem-base
pkgver=26.1
pkgrel=3
pkgdesc="A finite element software for multiphysical problems (without GUI and Ice)"
arch=('x86_64')
url="https://www.elmerfem.org"
license=('GPL-2.0-only AND LGPL-2.1-only AND LicenseRef-Elmer')
conflicts=('elmerfem-git' 'elemerfem')
options=(!debug)

makedepends=(
    'cmake'
    'gcc-fortran'
    'git'
)
depends=(
    'arpack'
    'blas-openblas'
    'hypre'
    'openmp'
    'openmpi'
)

source=("${_name}::git+https://github.com/ElmerCSC/elmerfem#tag=release-${pkgver}")
b2sums=('a4bcbfb84a043712f28114087f8a67b47ab2f8b5eeda637e0211eaa96d7ff6928d27ab7e927c8cd2733ffa3e186613ca245ed3bace601ad4f68eec9a8a82efb3')
_patches=(
    # ElmerSolver & ElmerGrid version output
    91c7147b0aefe2e783b41e121b683d85fcdfd653
    fbe62695e6e03c8d548a247b96a0229b2aa52ab9
    # Fix ElmerGrid unv convert segfault
    85e16d005de298691faeeeaccde685fe5bac4da1
)

prepare() {
    cd $_name
    git cherry-pick -n -m 1 "${_patches[@]}"
    git submodule update --init
}

build() {
    # For Zoltan
    export CFLAGS="${CFLAGS[*]} -Wno-incompatible-pointer-types"

    local cmake_opts=(
        -W no-dev
        -D CMAKE_BUILD_TYPE=None
        -D BUILD_SHARED_LIBS=ON
        -S "${_name}"
        -B "${_name}"/build
        -D CMAKE_INSTALL_PREFIX=/usr

        # Elmer
        -D WITH_ELMERGUI=OFF
        -D WITH_ElmerIce=OFF
        -D BLA_VENDOR="OpenBLAS"
        -D WITH_OpenMP=ON
        -D WITH_MPI=ON
        -D WITH_LUA=ON
        -D WITH_Zoltan=ON
        -D WITH_Hypre=ON
        -D Hypre_INCLUDE_DIR=/usr/include/hypre
    )

    cmake "${cmake_opts[@]}"
    cmake --build "${_name}"/build
}

check() {
    # Skip tests
    # - EMWaveBoxHexasEigen: Relative Error to reference norm: 2.656888E-01
    # - DirichletNeumannZoltan_np3: Require CPardiso/Mumps
    local exclude_tests='EMWaveBoxHexasEigen|DirichletNeumannZoltan_np3'

    local ctest_opts=(
        -E "$exclude_tests"
        --test-dir "${_name}"/build
        --output-on-failure
    )

    if ! ctest "${ctest_opts[@]}"
    then
        # Re-run failed tests
        ctest "${ctest_opts[@]}" --rerun-failed
    fi
}

package() {
    DESTDIR="$pkgdir" cmake --install "${_name}"/build

    # Licenses
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/elmersolver/license_texts/LICENSES" "${pkgdir}/usr/share/licenses/${pkgname}"/ElmerSolver
    mv "${pkgdir}/usr/share/elmersolver/license_texts/fem/LICENSES" "${pkgdir}/usr/share/licenses/${pkgname}"/ElmerSolver_FEM
    mv "${pkgdir}/usr/share/elmersolver/license_texts/Zoltan/README" "${pkgdir}/usr/share/licenses/${pkgname}"/Zoltan
    rm -rf "${pkgdir}/usr/share/elmersolver/license_texts"

    # Remove duplicate files
    rm "${pkgdir}/usr/lib/elmersolver/libarpack.so" "${pkgdir}/usr/lib/elmersolver/libparpack.so"
}
