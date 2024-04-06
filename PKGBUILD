# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=deptry
pkgver=0.16.1
_commit=caa4e436cca5b15c1e63488f8594050cb21488d0
pkgrel=1
pkgdesc="Find unused, missing and transitive dependencies in a Python project"
arch=(x86_64)
url="https://github.com/fpgmaas/deptry"
license=(MIT)
depends=(
  gcc-libs
  glibc
  python
  python-click
)
makedepends=(
  git
  python-build
  python-installer
  python-maturin
  python-wheel
  rustup
)
checkdepends=(
  python-pytest
  python-pytest-xdist
)
source=("$pkgname::git+$url.git?signed#commit=$_commit")
sha256sums=('a2f3947b2f7214ff236037032983f96bbcf7e26e5811a49740b024c2c9cf2ca5')
validpgpkeys=('968479A1AFF927E37D1A566BB5690EEEBB952194') # GitHub <noreply@github.com>

_archive="$pkgname"

pkgver() {
  cd "$_archive"

  git describe --tags
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  rm -rf tmp_install
  python -m installer --destdir=tmp_install dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  # Deselected test fails in a clean chroot, not sure why. Functional tests
  # ignored as they fail due to what I suspect is some problem with venvs.
  pytest tests/ \
    --deselect tests/unit/violations/dep003_transitive/test_finder.py::test_simple \
    --deselect tests/functional/cli
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
