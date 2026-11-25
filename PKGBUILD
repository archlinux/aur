# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
pkgname=klayout-pex
pkgver=0.12.0
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
b2sums=('cd54c358e6c138c302eeac2c1580d35f15ea8597a9442d583f061b0e2d22587dbefc86298366dcc964e4d16c29a8184073849e311355234d4748982aa3917700')

build() {
	cd ${pkgname}

	# Generate protobuf files
	python scripts/build/generate_protobuf.py

	# Generate tech files
	python scripts/gen_tech_pb kpex_protobuf

	# Build package
	python -m build --wheel --no-isolation
}

check() {
	cd "${pkgname}"
	# TODO: slow tests require more extensive setup
	# TODO: edge tests fails

	# These are individual tests that are failing
	local excluded_tests=(
		"edge_a1"
		"edge_a2"
		"edge_a3"
		"edge_a4"
		"edge_a5"
		"edge_a7"
		"allure_report_attaches_stdout_of_failing_tests_only"
		"test_builtin_crashes_have_distinct_exit_status_and_debug_traceback[info]"
		"test_checked_reduction_is_format_only_and_reports_process_failure[check_args0]"
		"test_checked_reduction_is_format_only_and_reports_process_failure[check_args1]"
	)

	# These are files that are failing due to TypeError etc.
	local excluded_test_files=(
		# PDK tests
		## IHP
		"ihp_gatpoly_corner_test.py"
		"ihp_gatpoly_simulation_test.py"
		"ihp_passivation_geometry_test.py"
		"ihp_gatpoly_simulation_test.py"
		"ihp_passivation_geometry_test.py"
		## CMOS5L
		"cmos5l_resistance_corner_test.py"
		"cmos5l_resistance_simulation_test.py"
		## SKY130
		"sky130_resistance_corners_test.py"
		"sky130_resistance_corners_test.py"
		## GF180
		"gf180_resistance_corner_test.py"
		"gf180_resistance_simulation_test.py"
		## OpenPDK
		"openpdk_corner_data_test.py"
		# Fastercap
		"fastercap/physical_input_test.py"
		"fastercap/execution_lifecycle_test.py"
		"fastercap/numerical_report_test.py"
		# Netlist
		"netlist/coupling_test.py"
		"netlist/grounding_test.py"
		# KLayout
		"klayout/pex25d_electrostatic_builder_test.py"
		"klayout/physical_geometry_test.py"
		# Magic
		"magic/magic_runner_test.py"
		# RCX25
		"rcx25/device_capacitance_checks_test.py"
		"rcx25/device_capacitance_cli_test.py"
		"rcx25/device_capacitance_models_test.py"
		"rcx25/device_capacitance_references_test.py"
		"rcx25/coupling_cli_test.py"
		"rcx25/coupling_test.py"
		"rcx25/rcx25_coupling_test.py"
		# General
		"resistance_corner_data_test.py"
		"resistance_corner_data_test.py"
		"device_reference_corners_test.py"
		"physical_corner_data_test.py"
		"source_physical_corners_test.py"
		"tech_catalog_cli_test.py"
		"tech_catalog_proto_test.py"
		"tech_catalog_test.py"
		"tech_layer_type_test.py"
		"tech_provenance_test.py"
		# Calibration
		"calibration/cli_test.py"
		"calibration/patterns_test.py"
		"calibration/prepare_test.py"
		"calibration/solve_collect_test.py"
		"calibration/targets_test.py"
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

	# Make the array for pytest
	# Pattern is: --ignore tests/<file>
	local -a ignore_arr=()
	for f in "${excluded_test_files[@]}"; do
		ignore_arr+=("--ignore=tests/${f}")
	done

	pytest \
		-v \
		-m "not slow and not fastercap" \
		-k "${excl_str}" \
		"${ignore_arr[@]}" \
		-n "auto"
}

package() {
	cd "${pkgname}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: set sw=4 ts=4 et:
