# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=fastercap
pkgver=6.0.9
pkgrel=2
pkgdesc="Three- and two-dimensional capacitance extraction"
arch=('x86_64')
_git_url="https://github.com/martinjankoehler/FasterCap"
url="https://www.fastfieldsolvers.com/fastercap.htm"
license=('LGPL-2.1-or-later')
depends=(
	'blas'
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
)
options=()
source=(
	"${pkgname}::git+${_git_url}#tag=v${pkgver}"
	"git+https://github.com/martinjankoehler/LinAlgebra#commit=f0ac995736ac3adb73aef67e9ae164a5029a1cd9"
	"git+https://github.com/ediloren/Geometry#commit=de03ffebfd5013b96102bd60f71c8fe8b73870e2"
	"0001-fastercap-use-pkg-config-to-find-BLAS.patch"
)
b2sums=('bc13206a3f3051eb2694be1db6abc3df2889fc63eb924353d5a4a0ab86f56b49385a3533257e21b1f4f978cbedb69fe4ca489f60440124e9d5c38bc7814f834e'
        'a3b8ce40ea54e1f9e4e6e3a761580255257318c29cf6c167f1dea8c68a4b4aebcfc6d6f2a689404a1e9698b0f0c25f553c4a7b9a14515793c5e31ab02f29dd47'
        '569da9e446152eddb6fc414848aee074b386d089ee11cf33e681faa385c5e388d64be43e7d5892320b7d342210472e83acb068f98e9a4e2786737fcea4f722cc'
        '864a261c8249bb5c7f984b07708ccad87aa779a6a5060880259b64879a87cbed41a5edd9b562bbfb0bb373973ce4de559442f4758fafb1f6a9d8cd7fbb79793e')
prepare() {
	# Patch FasterCap
	cd "${pkgname}"
	git apply "../0001-fastercap-use-pkg-config-to-find-BLAS.patch"
}

build() {
	local cmake_options=(
		-B build
		-S "${pkgname}"
		-W no-dev
		-D CMAKE_BUILD_TYPE=None
		-D CMAKE_INSTALL_PREFIX=/usr
		-D FASTFIELDSOLVERS_HEADLESS=ON
	)
	cmake "${cmake_options[@]}"
	cmake --build build
		
}

package() {
	# There is no CMake installation target - manually move the binary
	install -Dm0755 "build/FasterCap" "${pkgdir}/usr/bin/FasterCap"
}

# vim: set ts=4 sw=4 et:
