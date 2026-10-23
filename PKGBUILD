# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=klayout-pex
pkgver=0.6.12
pkgrel=1
pkgdesc="Parasitic Extraction (PEX) tool for KLayout"
arch=("any")
_git_url="https://github.com/iic-jku/klayout-pex"
url="https://iic-jku.github.io/klayout-pex-website"
license=('GPL-3.0-or-later')
depends=(	
	'klayout'
	'python'
	'python-packaging'
	'python-matplotlib'
	'python-protobuf'
	'python-rich'
	'python-rich-argparse'
)
makedepends=(
	'git'
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
	'python-poetry-core'
	'python-grpcio-tools'
)
checkdepends=(
	'python-pytest'
	'python-allure-commons'
	'python-csv-diff'
)
optdepends=(
	'python-cairosvg'
	"magic: Alternative parasitic extraction backend"
	"fastercap: Alternative parasitic extraction backend"
	"fastcap2: Alternative parasitic extraction backend"
	"meshlab: For previewing 3D geometries (STL) representing input to FasterCap"
)
options=()
source=("${pkgname}::git+${_git_url}#tag=v${pkgver}")
b2sums=('44978bbf5dbf9b3a7ef57f2fff2d0a3511460dfac89abf46474261a1ac199aa0c4ec9906fe1ff10cb986ee08e663c4882d564f23fb3432258684ce5321651b12')

build() {
	cd ${pkgname}

	# Generate protobuf files
	python -m grpc_tools.protoc \
		--proto_path=protos \
		--python_out=klayout_pex_protobuf \
		$(find protos -name '*.proto')

	# Generate tech files
	python scripts/gen_tech_pb  klayout_pex_protobuf

	# Build package
	python -m build --wheel --no-isolation
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
