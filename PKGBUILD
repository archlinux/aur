# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_pkgname=vacask
pkgname="${_pkgname}-git"
pkgver=0.3.3.r0.g8729bbf
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
    'tomlplusplus'
    'openvaf-r'
)
checkdepends=(
    'python'
    'python-numpy'
    'python-scipy'
)
optdepends=(
    'python-matplotlib: For plotting the individual tests'
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
        -B build
        -S "${_pkgname}"
        -W no-dev
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="${pkgdir}" cmake --install build

    # Remove redudant openvaf-r
    rm "${pkgdir}/usr/bin/openvaf-r"
}

# vim: ts=4 sw=4 et:
