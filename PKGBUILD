# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-pytest-subprocess
pkgdesc='Pytest plugin to fake subprocess'
url='https://github.com/aklajnert/pytest-subprocess'
pkgver=1.5.0
pkgrel=1
arch=('any')
license=('MIT')

depends=('python-pytest')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
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
)
sha256sums=(
  '80172ac95439cd4a237c5ee7f343227a7fd21fb61284bfa0de4b7802502d88dc'
)

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
