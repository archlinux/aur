# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=vacask
pkgver=0.3.4
pkgrel=1
pkgdesc="Verilog-A Circuit Analysis Kernel is an analog circuit simulator"
arch=(
    'x86_64'
    'aarch64'
)
url="https://codeberg.org/arpadbuermen/VACASK"
license=('AGPL-3.0-or-later')
depends=(
    'openvaf-r'
    'suitesparse'
    'boost-libs'
    'glibc'
    'libstdc++'
    'libgcc'
    'libgomp'
)
makedepends=(
    'git'
    'gcc'
    'cmake'
    'ninja'
    'boost'
    'bison'
    'flex'
)
checkdepends=(
    'python'
    'python-numpy'
    'python-scipy'
)
optdepends=(
    'python-matplotlib: For plotting the individual tests'
)
options=()
source=(
    "${pkgname}::git+${url}#tag=_${pkgver}"
    "0001-fix-cblas-header.patch"
)
b2sums=('cbb6c166112655587d942af60032bb01efd89ef442487e3f241433f2acc99483f68200b3466de856d0e94392d864e4749e0a2af2b34caeb50786b1b2b4b3cda3'
        'b4381c63751fc27dad25d139180f60cd03def51f81f8203791cd9b8e86da06bd4918a923924537b4b0b160532aacddabaad3a821c7a519553853c2913c82c42b')

prepare() {
    cd "${pkgname}"

    # Currently cblas.h is not included, we need to patch it in:
    patch -Np1 < "../0001-fix-cblas-header.patch"
}

build() {
    local cmake_options=(
        -B build
        -S "${pkgname}"
        -W no-author
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

check() {
    local excluded_tests=(
    # This need IHP PDK, in most cases it's easier to just skip it:
    "test_pssosc2.sim"
        # TODO: The following tests are dependent on experimental
        # OpenVAF build - Disable for now
        "test_delay.sim"
        "test_delayvar.sim"
        "test_delayhb.sim"
        "test_delayhbac.sim"
    )
    local ctest_flags=(
        --test-dir build
        # show the stdout and stderr when the test fails
        --output-on-failure
        # execute tests in parallel
        --parallel $(nproc)
        # exclude tests
        --exclude-regex "$(IFS='|'; echo "${excluded_tests[*]}")"
    )
    echo "${ctest_flags[@]}"
    ctest "${ctest_flags[@]}"
}

package() {
    DESTDIR="${pkgdir}" cmake --install build

    # Remove redudant openvaf-r
    rm "${pkgdir}/usr/bin/openvaf-r"
}

# vim: ts=4 sw=4 et:
