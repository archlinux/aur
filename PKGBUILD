# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=fastercap
pkgver=6.2.1
pkgrel=1
pkgdesc="Three- and two-dimensional capacitance extraction"
arch=('x86_64')
_git_url="https://github.com/iic-jku/FasterCap"
url="https://www.fastfieldsolvers.com/fastercap.htm"
license=('LGPL-2.1-or-later')
depends=(
	'openblas'
	'libstdc++'
	'libgomp'
	'libgcc'
	'libgfortran'
	'glibc'
	'wxwidgets-common'
)
makedepends=(
	'git'
	'cmake'
	'pkg-config'
	'wxwidgets-gtk3'
	'cblas'
)
options=()
source=(
	"${pkgname}::git+${_git_url}#tag=v${pkgver}"
	"git+https://github.com/iic-jku/LinAlgebra#commit=c240583108de50758eb9eaa561ad8b6a734f0e08"
	"git+https://github.com/iic-jku/Geometry#commit=d85b854c20c4089028c3da104c99bcfdfccad957"
)
b2sums=('4696c0945e26b3a89fdfde889fabd6c4c0b12f69af3c08d38f61519f5ada53c21ca5f6a2ec8641420cb67ba025607e2195e25e748453d5737b12ba99baa54230'
        '2f9153f511986e342db67f37d95b26986432c1e2f176a6bf8483ea8abdab62d6e2fdf44c48da11f178abfdc34638af3818293eb587e5e8d96faa2a3389ee5b3c'
        'bd28a092f6703303f846121dbdcd4667ba2e3464b35a7cad24daab49dc0edebb42a176e229c6c1813f1b1c60d408263a824a4300a622eec37dc113b6fcd5d3f7')

build() {
	local cmake_options=(
		-B build
		-S "${pkgname}"
		-W no-dev
		-D CMAKE_BUILD_TYPE=None
		-D CMAKE_INSTALL_PREFIX=/usr
		-D FASTFIELDSOLVERS_HEADLESS=ON
		-D BLA_VENDOR="OpenBLAS"
	)
	cmake "${cmake_options[@]}"
	cmake --build build
}

check() {
	local excluded_tests=""
	local ctest_flags=(
	--test-dir build
	# show the stdout and stderr when the test fails
	--output-on-failure
	# execute tests in parallel
	--parallel $(nproc)
	# exclude problematic tests
	--exclude-regex "$excluded_tests"
	)
	ctest "${ctest_flags[@]}"
}

package() {
	# There is no CMake installation target - manually move the binary
	# DESTDIR="${pkgdir} cmake --install build"
	install -Dm0755 "build/FasterCap" "${pkgdir}/usr/bin/FasterCap"
}

# vim: set ts=4 sw=4 et:
