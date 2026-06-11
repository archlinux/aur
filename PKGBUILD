# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=vacask
pkgver=0.3.3
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
source=("${pkgname}::git+${url}#tag=_${pkgver}")
b2sums=('3f8552e2714b535f5a08d2a95960c602909ae28d33723f3dc06f1bb9e82e8e5eeadd832b805901df6cdac728d9a82009088c9491c37cda650194a4dc74694a5c')

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
