# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>

pkgname=python-beartype
_name=${pkgname#python-}
pkgver=0.17.0
pkgrel=1
pkgdesc="Unbearably fast near-real-time hybrid runtime-static type-checking in pure Python"
arch=(any)
url="https://github.com/beartype/beartype"
license=(MIT)
depends=(
  python
  python-numpy
  python-typing-extensions
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('911fba33d0ebd3fc974a2da8d576e10057c2c4f114b1937271804ca28c6d526c')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  pytest \
    --deselect beartype_test/a00_unit/a90_claw/a00_core/test_claw_api.py::test_claw_api \
    --deselect beartype_test/a00_unit/a90_claw/a90_hook/test_claw_extraprocess.py::test_claw_extraprocess_executable_submodule \
    --deselect beartype_test/a00_unit/a90_claw/a90_hook/test_claw_extraprocess.py::test_claw_extraprocess_executable_package \
    --deselect beartype_test/a00_unit/a90_claw/a90_hook/test_claw_intraprocess.py::test_claw_intraprocess_beartype_this_package \
    --deselect beartype_test/a00_unit/a90_claw/a90_hook/test_claw_intraprocess.py::test_claw_intraprocess_beartype_package \
    --deselect beartype_test/a00_unit/a90_claw/a90_hook/test_claw_intraprocess.py::test_claw_intraprocess_beartype_packages \
    --deselect beartype_test/a00_unit/a90_claw/a90_hook/test_claw_intraprocess.py::test_claw_intraprocess_beartype_all \
    --deselect beartype_test/a00_unit/a90_claw/a90_hook/test_claw_intraprocess.py::test_claw_intraprocess_beartyping
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
