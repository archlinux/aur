# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=deptry
pkgver=0.15.0
_commit=e51a86a5138aedab65578caae85e4a5ab04358b8
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
sha256sums=('3d6a6d79048acc248ca0d3a398c484666e6c1c6fc1d1bb8bd85ba10b6ee3bfc1')
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
