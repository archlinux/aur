# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-pytest-blender
_name=${pkgname#python-}
pkgver=3.0.8
pkgrel=1
pkgdesc="Blender Pytest plugin."
arch=('any')
url="https://github.com/mondeja/pytest-blender"
license=('BSD-3-Clause')
depends=(python-pytest)
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(blender python-pytest-cov)
optdepends=('blender: headless Blender execution')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz
        "pytest-blender-tests-$pkgver.tar.gz::https://github.com/mondeja/pytest-blender/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1d2592c6b8a7666225905e90d944c3efcf102a3e816eb0d44429112928287cc3'
            '939e6601b560ea3b75ab0b397004329b9625ab3a332efab40868496e143fb4ae')

prepare() {
    cd "${_name//-/_}-$pkgver"
    cp -a "$srcdir/${_name}-$pkgver/tests/." tests/
}

build() {
    cd "${_name//-/_}-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_name//-/_}-$pkgver"
    # Install the wheel to a PYTHONUSERBASE dir so the pytest11 entry point
    # registers in subprocess pytest runs. PYTHONUSERBASE puts the install on
    # sys.path via the user-site mechanism, which survives PYTHONPATH overrides
    # that some tests perform (e.g. test_coverage_with_pytest_cov_pythonpath).
    export PYTHONUSERBASE="$srcdir/test-install/usr"
    rm -rf "$srcdir/test-install"
    python -m installer --destdir="$srcdir/test-install" dist/*.whl
    # Deselected tests fail under Blender 5.x due to upstream stdout-format
    # and addon-handling changes, not packaging issues:
    #   - test_blender_template_*: Blender 5.x quotes paths and prefixes log
    #     lines with timestamps, breaking the substring assertion.
    #   - test_install_addons_from_dir_invalid_addon: Blender 5.x installs
    #     bl_info-less addons with a warning instead of letting pytest-blender
    #     skip them, so the expected skip message never appears.
    pytest tests/ \
        --deselect tests/test_options/test_blender_template_option.py::test_blender_template_cli_option \
        --deselect tests/test_options/test_blender_template_option.py::test_blender_template_inicfg_option \
        --deselect tests/test_functionality_fixtures.py::test_install_addons_from_dir_invalid_addon
}

package() {
    cd "${_name//-/_}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
