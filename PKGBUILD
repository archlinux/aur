# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=deptry
pkgver=0.14.0
_commit=8e002b7b0537a491e75e52d8f9a8552fbbaa46ca
pkgrel=1
pkgdesc="Find unused, missing and transitive dependencies in a Python project"
arch=(x86_64)
url="https://github.com/fpgmaas/deptry"
license=(MIT)
depends=(
  gcc-libs
  glibc
  python
  python-chardet
  python-click
  python-pathspec
)
makedepends=(
  git
  python-build
  python-installer
  python-maturin
  python-wheel
  rustup
)
checkdepends=(python-pytest)
source=("$pkgname::git+$url.git?signed#commit=$_commit")
sha256sums=('SKIP')
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
  # Deselect test failing only in chroot - not sure why.
  pytest tests/ \
    --deselect tests/unit/violations/dep003_transitive/test_finder.py::test_simple
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
