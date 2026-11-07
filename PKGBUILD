# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=klayout-pex
pkgver=0.8.1
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
b2sums=('6c989e03ebb59754f4983ebe47ff1e1c573a4de3cbd2798536663097a6ac2b7cdbe9cee2861a9c4a0e4ad38d06b9e9f13c928d06b5478760a8f1dd2dc4ae0fd4')

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

	local excluded_tests=(
		"edge_a1"
		"edge_a2"
		"edge_a3"
		"edge_a4"
		"edge_a5"
		"edge_a7"
		"allure_report_attaches_stdout_of_failing_tests_only"
		"test_builtin_crashes_have_distinct_exit_status_and_debug_traceback[info]"
	)

	# Make the string for pytest
	# Pattern is: not <test1> and not <test2>...
	local excl_str=""
	if (( ${#excluded_tests[@]} > 0 )); then
	    excl_str="not ${excluded_tests[0]}"
	    for t in "${excluded_tests[@]:1}"; do
	        excl_str+=" and not $t"
	    done
	fi

	pytest \
		-v \
		-m "not slow and not fastercap" \
		-k "${excl_str}" \
		-n "auto"
}

package() {
	cd "${pkgname}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: set sw=4 ts=4 et:
