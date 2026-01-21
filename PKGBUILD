# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=vacask
pkgver=0.3.2
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
    'gcc-libs'
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
    "0001-no_install_openvaf-r.patch"
    "0002-compile_with_boost_1_89.patch"
)
b2sums=('a35e391017923a0c0b9c406df723674154bd3a4d433d8b8d40a143589efa7d6a8eb1a56b82758a16747e79380151fbbe156743b57d6195ed25fc90f038e5edf2'
        'c8458db954ab4cd3132244b3da49538f3c33f2f7779f3b858b9bbe7e31ccd7b35552c79a087d68e5eb6895d95fb15035fbc8d34355e69c5db73b3bdf3aad449a'
        'cfeec714c28c83d04c14e08f965cee404c9ba4550bc0a946ff8073e2b33ba8157277bb43cb01577e6a20dfcb3e14928e3614d4074ce635fa2f568ece28c7cc90')

prepare() {
    cd "${pkgname}"

    # Avoid installing openvaf-r it should be installed already from openvaf-reloaded
    patch -Np1 < "../0001-no_install_openvaf-r.patch"
    # We need to patch to allow for Boost 1.89 compatability
    patch -Np1 < "../0002-compile_with_boost_1_89.patch"
}

build() {
    local cmake_options=(
	    -B build
	    -S "${pkgname}"
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
}

# vim: sw=4 sws=4 et:
