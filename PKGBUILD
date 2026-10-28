# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=fastercap
pkgver=6.1.0
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
b2sums=('5746f37decdc4558e116147c65a9cd5a0cd420829e82a9afc732030000bf4aecf8a7cc6cdf6ef4a9e030912bb2d6dfa64d6ae0d13ad867d836c5127e3efb8d08'
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

package() {
	# There is no CMake installation target - manually move the binary
	install -Dm0755 "build/FasterCap" "${pkgdir}/usr/bin/FasterCap"
}

# vim: set ts=4 sw=4 et:
