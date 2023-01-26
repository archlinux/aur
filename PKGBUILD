# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Submitter: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Andrés J. Díaz <ajdiaz@ajdiaz.me>

pkgname=('libolm-git' 'python-olm-git')
_pkg=olm
pkgver=3.2.14.r2.g0eb4550
pkgrel=1
pkgdesc='An implementation of a well known cryptographic ratchet in C++'
arch=('x86_64')
url="https://gitlab.matrix.org/matrix-org/olm"
license=('Apache')
makedepends=(
  'cmake'
  'git'
  'python-build'
  'python-cffi'
  'python-installer'
  'python-setuptools'
  'python-wheel')
checkdepends=('python-pytest' 'python-pytest-benchmark' 'python-aspectlib' 'python-future')
source=("$_pkg::git+$url")
md5sums=('SKIP')

pkgver() {
  git -C "$_pkg" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkg"
  cmake \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build

  cd python
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkg"
  ctest --test-dir build/tests --output-on-failure
  cd python
  PYTHONPATH="$(find build -name 'lib.*' -type d -print)" LD_LIBRARY_PATH="../build" pytest -x --disable-warnings
}

package_libolm-git() {
  depends=('gcc-libs')
  provides=('libolm' 'libolm.so')
  conflicts=('libolm')

  cd "$_pkg"
  DESTDIR="$pkgdir" cmake --install build
}

package_python-olm-git() {
  depends=('libolm.so' 'python-cffi' 'python-future')
  provides=('python-olm')
  conflicts=('python-olm')

  cd "$_pkg/python"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sts=2 sw=2 et:
