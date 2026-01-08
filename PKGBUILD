# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_pkgname=vacask
pkgname="${_pkgname}-git"
pkgver=0.2.0.r270.gbfc1bed
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
source=(
	"${_pkgname}::git+${url}"
	"0001-no_install_openvaf-r.patch"
	"0002-compile_with_boost_1_89.patch"
)
b2sums=('SKIP'
        'c8458db954ab4cd3132244b3da49538f3c33f2f7779f3b858b9bbe7e31ccd7b35552c79a087d68e5eb6895d95fb15035fbc8d34355e69c5db73b3bdf3aad449a'
        'cfeec714c28c83d04c14e08f965cee404c9ba4550bc0a946ff8073e2b33ba8157277bb43cb01577e6a20dfcb3e14928e3614d4074ce635fa2f568ece28c7cc90')

pkgver() {
	cd "${_pkgname}"
	git describe --long --abbrev=7 | sed 's/^_//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${_pkgname}"
	# Avoid installing openvaf-r it should be installed already from openvaf-reloaded
	patch -Np1 < "../0001-no_install_openvaf-r.patch"
	# upstream specifically builds for Boost 1.88, here we fix it such that it builds for 1.89 (current release)
	patch -Np1 < "../0002-compile_with_boost_1_89.patch"
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
}
