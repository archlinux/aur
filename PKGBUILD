# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=atopile
pkgver=0.3.23
pkgrel=1
pkgdesc="A tool to build electronic circuit boards with code"
arch=(x86_64)
url="https://github.com/atopile/atopile"
license=(Apache-2.0)
depends=(
  easyeda2kicad
  gcc-libs
  glibc
  python
  python-antlr4
  python-attrs
  python-black
  python-case-converter
  python-cookiecutter
  python-dataclasses-json
  python-deprecated
  python-gitpython
  python-matplotlib
  python-more-itertools
  python-natsort
  python-numpy
  python-pathvalidate
  python-pint
  python-psutil
  python-pydantic
  python-pydantic-settings
  python-pygments
  python-questionary
  python-requests
  python-rich
  python-ruamel-yaml
  python-semver
  python-sexpdata
  python-shapely
  python-typer
  python-yaml
)
makedepends=(
  nanobind
  python-build
  python-hatch-vcs
  python-hatchling
  python-installer
  python-scikit-build-core
  python-wheel
)
checkdepends=(
  python-hypothesis
  python-pytest
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('66076cb147e03836b9576bfdffc205ee30209518ad4ae4c8fdb18ff50585d2a6')

build() {
  cd $pkgname-$pkgver
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd $pkgname-$pkgver
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest --override-ini="addopts=" \
    --deselect test/core/performance/test_performance_pick.py::test_performance_pick_rc_formulas \
    --deselect test/core/performance/test_performance_pick.py::test_performance_pick_real_module \
    --deselect test/core/solver/test_literal_folding.py::test_can_evaluate_literals \
    --deselect test/core/solver/test_solver.py::test_solve_realworld_biggest \
    --deselect test/core/solver/test_solver.py::test_solve_voltage_divider_complex \
    --deselect test/end_to_end \
    --deselect test/front_end/test_front_end.py::test_reserved_attrs \
    --deselect test/front_end/test_front_end.py::test_resistor \
    --deselect test/front_end/test_front_end_pick.py::test_ato_pick_capacitor \
    --deselect test/front_end/test_front_end_pick.py::test_ato_pick_resistor \
    --deselect test/front_end/test_front_end_pick.py::test_ato_pick_resistor_dependency \
    --deselect test/libs/picker/test_pickers.py::test_pick_dependency_advanced_1 \
    --deselect test/libs/picker/test_pickers.py::test_pick_module \
    --deselect test/test_cli.py::test_app \
    --deselect test/test_create.py::test_fabll_create_component \
    --deselect test/test_errors.py::test_build_error_logging \
    --deselect test/test_regressions.py \
    --ignore test/library/test_names.py \
    --ignore test/test_examples.py \
    --ignore test/test_parse_utils.py
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
