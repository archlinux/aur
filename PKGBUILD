# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=klayout-pex
pkgver=0.4.5
pkgrel=1
pkgdesc="Parasitic Extraction (PEX) tool for KLayout"
arch=("x86_64")
_git_url="https://github.com/iic-jku/klayout-pex"
url="https://iic-jku.github.io/klayout-pex-website"
license=('GPL-3.0-or-later')
depends=(	
	'klayout'
	'python'
	'python-protobuf'
	'python-rich'
	'python-rich-argparse'
	'python-packaging'
)
makedepends=(
	'git'
	'cmake'
	'protobuf'
	'abseil-cpp'
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
	'python-poetry-core'
)
checkdepends=(
	'python-pytest'
	'python-allure-commons'
	'python-csv-diff'
)
optdepends=(
	'python-matplotlib'
	'python-cairosvg'
	"magic: Alternative parasitic extraction backend"
	"fastercap: Alternative parasitic extraction backend"
	"fastcap2: Alternative parasitic extraction backend"
	"meshlab: For previewing 3D geometries (STL) representing input to FasterCap"
)
options=()
source=("${pkgname}::git+${_git_url}#tag=v${pkgver}")
b2sums=('834cfa151f6a1885e48049c75a01d628c2bce5581352d1ed315ca8c9521e153508165f2913d15944acb42dad24e4c51ae8edfa312bfb65bf02d0b7f642e0953c')

build() {
	local cmake_flags=(
		-D CMAKE_BUILD_TYPE=None
		-D PROTOBUF_USE_SYSTEM=ON
	)
	cmake \
		"${cmake_flags[@]}" \
		-B build \
		-S "${pkgname}"

	cmake --build build

	# Generate protobuf tech files
	build/gen_tech_pb ${pkgname}/klayout_pex_protobuf
	
	# Build wheel
	(
		cd ${pkgname}
		python -m build --wheel --no-isolation
	)
}

check() {
	cd "${pkgname}"
	# TODO: slow tests require more extensive setup
	pytest \
		-v \
		-m "not slow and not fastercap"
}

package() {
	cd "${pkgname}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: set sw=4 ts=4 et:
