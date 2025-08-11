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
pkgver=8.4.0
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
provides=('python-cx_freeze')
conflicts=('python-cx_freeze')
source=("https://github.com/marcelotduarte/$_pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('6f9858d19cbfa8f565dae311a2882a0a495310c8e7f242426a9b2f3f59735cda8f8542fb8b4edf7ab5c4c3c0e4ed428a187790a9d3c3d9fd716361ddbee5c13f')

prepare() {
  cd "$_pkgname-$pkgver"
  sed -i 's/77.0.3,<=80.4.0/77.0.3/g' pyproject.toml
}
build() {
  cd "$_pkgname-$pkgver"
  python setup.py build_ext --inplace
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  # Create a temporary bin directory with the cxfreeze wrapper
  mkdir -p test-bin
  cat >test-bin/cxfreeze <<EOF
#!/usr/bin/env python
from cx_Freeze.cli import main
main()
EOF
  chmod +x test-bin/cxfreeze
  # Run tests with the wrapper script available in PATH
  PATH="$PWD/test-bin:$PATH" \
    PYTHONPATH="$PWD" \
    TMPDIR="$PWD/.pytest-tmp" \
    pytest --venv-backend=uv -rpfEsXx \
    --basetemp="$PWD/.pytest-tmp" \
    --ignore=tests/test_command_bdist_deb.py \
    --ignore=tests/test_command_bdist_rpm.py \
    --ignore=tests/hooks/test_av.py \
    --ignore=tests/hooks/test_numpy.py \
    --ignore=tests/hooks/test_mkl.py \
    --ignore=tests/hooks/test_scikit.py \
    --ignore=tests/hooks/test_module.py \
    --ignore=tests/hooks/test_multiprocessing.py \
    --ignore=tests/hooks/test_multiprocess.py \
    --ignore=tests/hooks/test_stdlib.py \
    --deselect tests/test_executables.py::test_valid_sys_path \
    --deselect tests/test_module.py::test_egg_info \
    --deselect tests/test_modulefinder.py::test_editable_packages
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim:set ts=2 sw=2 et:
