# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=klayout-pex
pkgver=0.8.0
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
	'python-pytest-xdist'
	'python-psutil'
	'python-allure-commons'
	'python-csv-diff'
	'procps-ng'
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
b2sums=('b1e898a597600a6a1040c3985e333eec314a4ddbb405687cd148596911960726794ac4ed0ef9d2ef0693174d4a465af133486e13057adf341922f8fab405886a')

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
	# TODO: edge tests fails
	pytest \
		-v \
		-m "not slow and not fastercap" \
		-k "not edge_a1 and not edge_a2 and not edge_a3 and not edge_a4 and not edge_a5 and not edge_a7 and not allure_report_attaches_stdout_of_failing_tests_only" \
		-n "auto"
}

package() {
	cd "${pkgname}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: set sw=4 ts=4 et:
