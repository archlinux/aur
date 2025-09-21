# Maintainer: envolution
# Contributor: Self Denial <selfdenial@pm.me>
# Contributor: Brian Thompson <brianrobt@pm.me>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Julien Duponchelle <julien@gns3.net>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-cx-freeze
_pkgname=cx_Freeze
pkgver=8.4.1
pkgrel=1
pkgdesc='Create standalone executables from Python scripts'
arch=('x86_64')
url="https://marcelotduarte.github.io/$_pkgname"
license=('PSF-2.0')
depends=(
  glibc
  patchelf
  python
  python-filelock
  python-tomli
  pyside6
  python-pyqt6)
makedepends=(
  python-wheel
  python-setuptools
  python-packaging
  python-build
  python-installer)
checkdepends=(
  uv
  python-uv
  python-packaging
  python-pytest
  python-pluggy
  python-pytest-cov
  python-coverage
  python-pytest-timeout
  python-typeguard
  python-anyio
  python-typeguard
  python-hypothesis
  python-faker
  python-pytest-asyncio
  python-respx
  python-pytest-mock
  python-pytest-xdist
  python-pytest-examples
  python-pytest-datafiles)
optdepends=(
  'perl-alien-build: Alien support for rpm, dpkg, stampede slp, and slackware tgz file formats'
  'rpm-tools: RPM Package Manager RPM.org support')
# pypi module alternate naming
provides=('python-cx_freeze')
conflicts=('python-cx_freeze')
source=("https://github.com/marcelotduarte/$_pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('6efa67cc5b6fd20614bff4abb1e55e7cb3eaf8fc0334d7c643606f1a55898083e578f499432e71ad4dc7a16702e44c58aa743bcd034b5762b3a794fe1fad23d8')

prepare() {
  cd "$_pkgname-$pkgver"
  # substitute multi-line requires with single line
  sed -i '/^requires = \[/,/^\]/crequires = ["setuptools"]' pyproject.toml

}
build() {
  cd "$_pkgname-$pkgver"
  python setup.py build_ext --inplace
  python -m build --wheel --no-isolation
}
check() {
    cd "$_pkgname-$pkgver"
    export UV_CACHE_DIR="$PWD/.uv-cache"
    export UV_LINK_MODE=copy
    # temporary install location for testing
    rm -rf test-install ; mkdir -p test-install
    uv run --no-project --python /usr/bin/python python -m installer --destdir="$PWD/test-install" dist/cx*freeze-${pkgver}-*-linux_x86_64.whl
    # python path for pytest
    python_version=$(/usr/bin/python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
    export PYTHONPATH="$PWD/test-install/usr/lib/python${python_version}/site-packages:$PYTHONPATH"    

    deselect_tests=(
        "tests/test_module.py::test_egg_info"
        "tests/test_modulefinder.py::test_editable_packages"
    )
    ignore_files=(
        "tests/test_command_bdist_rpm.py"
    )
    
    deselect_args=()
    for test in "${deselect_tests[@]}"; do
        deselect_args+=(--deselect="$test")
    done
    
    ignore_args=()
    for file in "${ignore_files[@]}"; do
        ignore_args+=(--ignore="$file")
    done
    
    # run tests excluding venv-marked tests, deselected tests, and ignored files
    uv run --no-project --python /usr/bin/python pytest -v -m "not venv" "${deselect_args[@]}" "${ignore_args[@]}"
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/cx*freeze-${pkgver}-*-linux_x86_64.whl
}
# vim:set ts=2 sw=2 et:
