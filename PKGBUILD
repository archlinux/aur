# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-cel-python
_pkgname=cel-python
pkgver=0.5.0
_tagver=0.5
pkgrel=2
pkgdesc="Pure Python implementation of Google Common Expression Language"
arch=('any')
url="https://github.com/cloud-custodian/cel-python"
license=('Apache-2.0')
depends=(
    'python'
    'python-google-re2>=1.1.20240702'
    'python-jmespath>=1.0.1'
    'python-lark-parser>=1.2.2'
    'python-packaging'
    'python-pendulum>=3.1'
    'python-yaml>=6.0.2'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
    'python-wheel'
)
checkdepends=(
    'python-behave'
    'python-pytest'
)
_archive="cel-python-$_tagver"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$_tagver.tar.gz")
sha256sums=('b370b2494e838a05e9a0d3bdabe045640fb2cc46c4fb9d853cb0559f513eeed9')

prepare() {
    cd "$_archive"
    # Upstream 0.5.0 points the console script at a non-existent module.
    # The actual CLI entry point is defined in celpy.__main__.
    sed -i 's/cel_python:main/celpy.__main__:main/' pyproject.toml
}

build() {
    cd "$_archive"
    python -m build --wheel --no-isolation
}

check() {
    rm -rf "$srcdir/test-install"
    cd "$_archive"
    python -m installer --destdir="$srcdir/test-install" dist/*.whl
    local site_packages
    site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
    local staged="$srcdir/test-install$site_packages"
    local test_path="$staged:$srcdir/$_archive/src"

    # Run the complete unit suite against celpy from the built wheel. The source
    # path remains second only for the unshipped developer-only xlate helpers.
    PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 \
        PYTHONPATH="$test_path${PYTHONPATH:+:$PYTHONPATH}" \
        python -m pytest -c /dev/null -p no:cacheprovider \
        --rootdir="$srcdir/$_archive" -v tests \
        --deselect=tests/test_c7nlib.py::test_value_from
    # This parametrized test temporarily replaces the process-wide os.path
    # module. Pytest 9's terminal reporter now calls os.path.commonpath before
    # fixture teardown, so run it separately without that reporter.
    PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 \
        PYTHONPATH="$test_path${PYTHONPATH:+:$PYTHONPATH}" \
        python -m pytest -c /dev/null -p no:cacheprovider -p no:terminal \
        --rootdir="$srcdir/$_archive" tests/test_c7nlib.py::test_value_from

    # Upstream's module and documentation doctests are entirely offline.
    PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 \
        PYTHONPATH="$test_path${PYTHONPATH:+:$PYTHONPATH}" \
        python -m pytest -c /dev/null -p no:cacheprovider -v \
        --rootdir="$srcdir/$_archive" \
        --doctest-modules "$staged/celpy"
    PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 \
        PYTHONPATH="$test_path${PYTHONPATH:+:$PYTHONPATH}" \
        python -m pytest -c /dev/null -p no:cacheprovider -v \
        --rootdir="$srcdir/$_archive" \
        --doctest-glob='README.rst' README.rst
    PYTHONPATH="$test_path${PYTHONPATH:+:$PYTHONPATH}" \
        python -m doctest \
        docs/source/api.rst \
        docs/source/cli.rst \
        docs/source/index.rst \
        docs/source/integration.rst

    # Exercise all shipped Behave scenarios with both upstream execution engines.
    PYTHONPATH="$test_path${PYTHONPATH:+:$PYTHONPATH}" \
        behave --tags='not @wip' --tags='not @future' \
        -D env=arch -D runner=interpreted -D PYTHONPATH="$test_path" \
        --logging-level=CRITICAL -f progress
    PYTHONPATH="$test_path${PYTHONPATH:+:$PYTHONPATH}" \
        behave --tags='not @wip' --tags='not @future' \
        -D env=arch -D runner=compiled -D PYTHONPATH="$test_path" \
        --logging-level=CRITICAL -f progress

    # tools/test_gherkinize.py requires generated CEL conformance protobuf
    # packages that are not published in the Arch repositories or AUR.

    # Representative calculator and JSON-query workflows through the wheel's
    # patched console entry point.
    local cli="$srcdir/test-install/usr/bin/cel-python"
    local result
    result=$(PYTHONPATH="$staged${PYTHONPATH:+:$PYTHONPATH}" \
        "$cli" -n '6 * 7')
    [[ "$result" == "42" ]]
    result=$(printf '%s\n' '{"account":{"balance":500},"withdrawal":125}' |
        PYTHONPATH="$staged${PYTHONPATH:+:$PYTHONPATH}" \
        "$cli" '.account.balance - .withdrawal')
    [[ "$result" == "375" ]]
}

package() {
    cd "$_archive"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
