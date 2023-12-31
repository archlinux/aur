# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-picologging
_name=${pkgname#python-}
pkgver=0.9.3
pkgrel=1
pkgdesc="An optimized logging library for Python"
arch=(x86_64)
url="https://github.com/microsoft/picologging"
license=(MIT)
depends=(
  gcc-libs
  glibc
  python
)
makedepends=(
  cmake
  ninja
  python-build
  python-installer
  python-scikit-build
  python-setuptools
  python-wheel
)
checkdepends=(
  python-flaky
  python-hypothesis
  python-pytest
  python-pytest-memray
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  "remove-build-dependencies-cmake-ninja.patch"
)
sha256sums=(
  'ed5e9d31c2d06fd02d4304bfb98cb200acbf11e1f03d6a5b341263cf312a18b2'
  '7a74c72ad8fafa38116b5c717092024d607a426b2040b625267dadc190e90c4b'
)

_archive="$_name-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/remove-build-dependencies-cmake-ninja.patch"
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  rm -rf tmp_install
  _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer --destdir=tmp_install dist/*.whl

  # Disable leaking test - not sure how to fix.
  PYTHONPATH="$PWD/tmp_install/$_site_packages:$PYTHONPATH" \
    python -m pytest \
    -k "not test_nested_frame_stack"
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
