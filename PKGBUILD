# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=klayout-pex
pkgver=0.3.7
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
)
makedepends=(
	'git'
	'cmake'
	'protobuf'
	'abseil-cpp'
	'python-build'
	'python-installer'
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
	# "fastercap: Alternative parasitic extraction backend"
	# "fastcap2: Alternative parasitic extraction backend"
	"meshlab: For previewing 3D geometries (STL) representing input to FasterCap"
)
options=()
source=(
	"${pkgname}::git+${_git_url}#tag=v${pkgver}"
	"0001-fix-use-locally-installed-protobuf.patch"
)
b2sums=('3f8bce85a4fa88634b89013993c4cac47c154715b7099213f611debac6f6be4aeabf3bb8e916a172cdd56bbbf431e3144d35393480862ec2d25cc8eb2f6d7c2a'
        '6adf186dd2a46c1919d6d03e380628679926901975d160f416616ae5bfb905be9a96b88cac42966611539f647a742c106cb10d237bd0f404e369a0d909ad80de')


prepare() {
	cd "${pkgname}"

	# Apply patch
	git apply "../0001-fix-use-locally-installed-protobuf.patch"
}

build() {
	cd "${pkgname}"
	# Generate protobuf files and gen_tech_pb
	cmake \
		-B build \
		-S . \
		-DCMAKE_BUILD_TYPE=None

	cmake --build build

	# Generate protobuf tech files
	build/gen_tech_pb klayout_pex_protobuf
	
	# Build wheel
	python -m build --wheel --no-isolation
}

check() {
	cd "${pkgname}"
	# TODO: slow tests require more extensive setup
	pytest \
		-v \
		-m "not slow and not fastercap" \
		--ignore=tests/klayout/netlist_expander_test.py # TODO: Fails for some reason
}

package() {
	cd "${pkgname}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: set sw=4 ts=4 et:
