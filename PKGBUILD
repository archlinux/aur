# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_pkgname=vacask
pkgname="${_pkgname}-git"
pkgver=0.3.4.r69.gb6d63ff
pkgrel=1
pkgdesc="Verilog-A Circuit Analysis Kernel is an analog circuit simulator"
arch=(
    'x86_64'
    'aarch64'
)
url="https://codeberg.org/arpadbuermen/VACASK"
license=('AGPL-3.0-or-later')
depends=(
    'suitesparse'
    'glibc'
    'libstdc++'
    'libgcc'
    'libgomp'
    'openblas'
    'fftw'
    'python'
)
makedepends=(
    'git'
    'gcc'
    'cmake'
    'ninja'
    'boost'
    'bison'
    'flex'
    'tomlplusplus'
    'boost-libs'
    'openvaf-r'
)
checkdepends=(
    'python-numpy'
    'python-scipy'
    'python-matplotlib'
)
optdepends=(
    'python-scikit-rf: For postprocessing some of the tests'
)
conflicts=("${_pkgname}")
options=()
source=("${_pkgname}::git+${url}")
b2sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/^_//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    local cmake_options=(
        -W no-author
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
        -D BLA_VENDOR="OpenBLAS"
    )

    local vacask_options=(
        -D TOMLPP_DIR=/usr
        # TODO: Add superlu_mt support
        # -D SuperluMT_DIR=/usr/include/superlu_mt/
    )

    cmake \
        "${cmake_options[@]}" \
        "${vacask_options[@]}" \
        -B build \
        -S "${_pkgname}"

    cmake --build build
}

check() {
    # NOTE: test_pssosc2.sim requires IHP PDK _and_ have the converted PDK for VACASK
    # See: https://codeberg.org/arpadbuermen/VACASK/src/branch/main/demo/ihp-sg13g2
    # For more information
    # Here we check whether that is the case, if not we skip the test
    local excluded_tests=(
        # TODO: The following tests are dependent on experimental
        # vacask build - Disable for now
        "test_delay.sim"
        "test_delayvar.sim"
        "test_delayhb.sim"
        "test_delayhbac.sim"
    )

    # Check PDK_ROOT is set and PDK equals "ihp-sg13g2"
    if [[ -z "${PDK_ROOT}" || "${PDK}" != "ihp-sg13g2" ]]; then
        printf "\t Skipping 'test_pssosc2.sim' due to missing '\$PDK' and/or '\$PDK_ROOT' env. variables pointing to IHP-PDK\n"
        excluded_tests+=("test_pssosc2.sim")
    else
        # Look for one of the converted VACASK files that is required
        if [[ ! -e "${PDK_ROOT}/${PDK}/libs.tech/vacask/models/sg13g2_vacask_common.lib" ]]; then
            printf "\t Skipping 'test_pssosc2.sim' due to missing converted PDK models\n"
            printf "\t You can run 'python /usr/lib/vacask/python/sg13g2tovc.py' to convert your PDK.\n"
            excluded_tests+=("test_pssosc2.sim")
        fi
    fi

    local ctest_flags=(
        --test-dir build
        # show the stdout and stderr when the test fails
        --output-on-failure
        # execute tests in parallel
        --parallel $(nproc)
    )

    # Only add the exlcude flag if there's actually something to exclude
    if (( ${#excluded_tests[@]} > 0 )); then
        # Join array elements with '|' for CTest regex
        local exclude_regex
        exclude_regex="$(IFS='|'; echo "${excluded_tests[*]}")"

        ctest_flags+=( --exclude-regex "$exclude_regex" )
    fi

    ctest "${ctest_flags[@]}"
}

package() {
    DESTDIR="${pkgdir}" cmake --install build

    # Remove redudant openvaf-r
    rm "${pkgdir}/usr/bin/openvaf-r"
}

# vim: ts=4 sw=4 et:
