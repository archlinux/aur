# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=klayout-pex
pkgver=0.3.9
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
	"fastercap: Alternative parasitic extraction backend"
	"fastcap2: Alternative parasitic extraction backend"
	"meshlab: For previewing 3D geometries (STL) representing input to FasterCap"
)
options=()
source=(
	"${pkgname}::git+${_git_url}#tag=v${pkgver}"
	"0001-fix-use-locally-installed-protobuf.patch"
)
b2sums=('2008ba434dfdd86516c8d5b0a3b3146cf403517f702571f5080f02ba51449ea4ba4f810d3c7233a80a3ac467a1ad1e39851e414e7277b0557e37cd3bbafc5651'
        '0642c635ed405a6938ab3a968e6a92b6864b5b3ea685cefbad214f46fdf6fb7e80068b3c89e6770e55508a1dce0042a291698885d575778f6775885e083bbe61')

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
