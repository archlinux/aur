# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=vacask
pkgver=0.3.2
pkgrel=2
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
)
b2sums=('a35e391017923a0c0b9c406df723674154bd3a4d433d8b8d40a143589efa7d6a8eb1a56b82758a16747e79380151fbbe156743b57d6195ed25fc90f038e5edf2')

prepare() {
    cd "${pkgname}"

    # For Boost v1.89 support
    # See upstream: https://codeberg.org/arpadbuermen/VACASK/pulls/35
    git cherry-pick -n a4d787993a39b005ddd3024fb84d3467b8ba3f15^..4300e5a3f36b8d567ce38445e377e82d6d422a4e
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

	# Remove redudant openvaf-r
	rm "${pkgdir}/usr/bin/openvaf-r"
}

# vim: sw=4 sws=4 et:
