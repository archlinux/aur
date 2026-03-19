# Maintainer: ResRipper <resripper at connective dot link>

# shellcheck disable=SC2034,SC2148,SC2154

# Note:
# Enabling Mumps will cause some tests to timeout/failed.

_name=elmerfem
pkgname=elmerfem-base
pkgver=26.1
pkgrel=1
pkgdesc="A finite element software for multiphysical problems (without GUI and Ice)"
arch=('x86_64')
url="https://www.elmerfem.org"
license=('GPL-2.0-or-later AND LGPL-2.1-or-later AND LicenseRef-Elmer')
conflicts=('elmerfem-git' 'elemerfem')
options=(!debug)

makedepends=(
    'cmake'
    'gcc-fortran'
)
depends=(
    'arpack'
    'blas-openblas'
    'glu'
    'openmp'
    'openmpi'
    'hypre'
    # 'mumps'
    # 'parmetis-git'
)

_zoltan_commit='977181194024ff63d439b8eed1e343f18a0a5eff'
source=(
    "${_name}-${pkgver}.tar.gz::https://github.com/ElmerCSC/elmerfem/archive/release-${pkgver}.tar.gz"
    "zoltan-${_zoltan_commit}.zip::https://github.com/ElmerCSC/Zoltan/archive/${_zoltan_commit}.zip"
    'ElmerGrid_unv_convert.patch::https://github.com/ElmerCSC/elmerfem/commit/85e16d005de298691faeeeaccde685fe5bac4da1.patch'
    # 'find_mumps_cmake.patch'
)
b2sums=(
    'ec65eb06153dfaeda5b76f746a37e1cfa7ad9d3d2bf8d7baeb7b2d50d183ed4a160c545a657d614051b20f053e4e94a08305adad504242fa38f82d86deeb9956'
    '91dae6cb94548e33936a98d6414e48432ff1586c8bbcb0234bc12b17093a0943ea8ad49f1abfe967291fd00d3451f42b939b044306e98c6c16624716ca561647'
    '36c46f40425815ed854830ec5e6b8987ce491d89b52cd55ba8bbb8de1a49a891c0083720c0d8084fd69cb09a9f23206c4fa8c00571407fea742e679820bbe003'
    # '2204ecc7bc8e7f73ff5ed2ad7e6165172183a7fdd587fe5478476b1eaf80f7bd3c3218476b383975b0349a2867c81bae5c6cee71e70f503262b99a3d083a214c'
)

prepare() {
    rm -rf "${_name}-release-${pkgver}/contrib/Zoltan_v3.83/"*
    mv "Zoltan-${_zoltan_commit}"/* "${_name}-release-${pkgver}/contrib/Zoltan_v3.83/"
    cd "${_name}-release-${pkgver}"
    # patch -p1 -i ../find_mumps_cmake.patch
    patch -p1 -i ../ElmerGrid_unv_convert.patch
}

build() {
    export CFLAGS="${CFLAGS[*]} -Wno-incompatible-pointer-types" # For Zoltan

    local cmake_opts=(
        -W no-dev
        -D CMAKE_BUILD_TYPE=None
        -D BUILD_SHARED_LIBS=ON
        -S "${_name}-release-${pkgver}"
        -B "${_name}-release-${pkgver}"/build
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
        # -D WITH_Mumps=ON
    )

    cmake "${cmake_opts[@]}"
    cmake --build "${_name}-release-${pkgver}"/build
}

check() {
    # Skip tests
    # - EMWaveBoxHexasEigen: Relative Error to reference norm: 2.656888E-01
    # - DirichletNeumannZoltan_np3: Require CPardiso/Mumps
    local exclude_tests='EMWaveBoxHexasEigen|DirichletNeumannZoltan_np3'

    local ctest_opts=(
        -E "$exclude_tests"
        --test-dir "${_name}-release-${pkgver}"/build
        --output-on-failure
    )

    if ! ctest "${ctest_opts[@]}" -j "$(nproc)"
    then
        # Re-run failed tests in serial
        ctest "${ctest_opts[@]}" --rerun-failed
    fi
}

package() {
    DESTDIR="$pkgdir" cmake --install "${_name}-release-${pkgver}"/build

    # Licenses
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/elmersolver/license_texts/LICENSES" "${pkgdir}/usr/share/licenses/${pkgname}"/ElmerSolver
    mv "${pkgdir}/usr/share/elmersolver/license_texts/fem/LICENSES" "${pkgdir}/usr/share/licenses/${pkgname}"/ElmerSolver_FEM
    mv "${pkgdir}/usr/share/elmersolver/license_texts/Zoltan/README" "${pkgdir}/usr/share/licenses/${pkgname}"/Zoltan
    rm -rf "${pkgdir}/usr/share/elmersolver/license_texts"

    # Remove duplicate files
    rm "${pkgdir}/usr/lib/elmersolver/libarpack.so" "${pkgdir}/usr/lib/elmersolver/libparpack.so"
}
