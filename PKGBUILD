# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-expecttest
pkgver=0.3.0
pkgrel=1
pkgdesc='Python library for expect-style testing'
arch=('any')
url='https://github.com/ezyang/expecttest'
license=('MIT')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry-core'
)
checkdepends=(
  'python-hypothesis'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e35ef2df7f97071c735a93612bfeb4d60b1c5f0990656bccffaf81b917cab09b')

build() {
  cd "expecttest-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  local _source_dir="$srcdir/expecttest-$pkgver"
  local _test_dir="$srcdir/test-work"
  local _test_venv="$srcdir/test-venv"

  rm -rf "$_test_dir" "$_test_venv"
  mkdir -p "$_test_dir"
  cp "$_source_dir/test_expecttest.py" "$_test_dir/"
  cp -a "$_source_dir/smoketests" "$_test_dir/"

  python -m venv --system-site-packages "$_test_venv"
  "$_test_venv/bin/python" -m installer "$_source_dir"/dist/*.whl
  cd "$_test_dir"
  PYTHONDONTWRITEBYTECODE=1 "$_test_venv/bin/python" test_expecttest.py
}

package() {
  cd "expecttest-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
