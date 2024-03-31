# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-pytest-subprocess
pkgdesc='Pytest plugin to fake subprocess'
url='https://github.com/aklajnert/pytest-subprocess'
pkgver=1.5.0
pkgrel=2
arch=('any')
license=('MIT')

depends=('python-pytest')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=(
  'python-anyio'
  'python-docutils'
  'python-pygments'
  'python-pytest-asyncio'
  'python-pytest-rerunfailures'
)

_pkgname=pytest-subprocess
source=(
  "$_pkgname-$pkgver.tar.gz::https://github.com/aklajnert/pytest-subprocess/archive/refs/tags/$pkgver.tar.gz"
  'github-pr142.patch::https://patch-diff.githubusercontent.com/raw/aklajnert/pytest-subprocess/pull/148.patch'
)
sha256sums=(
  '80172ac95439cd4a237c5ee7f343227a7fd21fb61284bfa0de4b7802502d88dc'
  '694663a0ebc7db59c1c281984b583e78d8d63c35a616b2d7141f1ea733361b6c'
)

prepare() {
  cd "$_pkgname-$pkgver"
  git apply "$srcdir/github-pr142.patch"
}

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer --destdir=test_dir dist/pytest_subprocess-"$pkgver"-*.whl
  export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
  pytest
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/pytest_subprocess-"$pkgver"-*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
