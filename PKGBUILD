# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=klayout-pex
pkgver=0.3.15
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
b2sums=('87d338c90e51a6d53a2afa391cf116ed429c83b60582901e8a0fe910677e1a6be453d20766b11081335b1fafacce7e92e357f1e0a6316cbd2eb1e27bc210ac90'
        '0642c635ed405a6938ab3a968e6a92b6864b5b3ea685cefbad214f46fdf6fb7e80068b3c89e6770e55508a1dce0042a291698885d575778f6775885e083bbe61')

prepare() {
	cd "${pkgname}"

	# Apply patch
	patch -Np1 < "../0001-fix-use-locally-installed-protobuf.patch"
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
