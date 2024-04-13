# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-pylint
pkgver=0.21.0
pkgrel=2
pkgdesc='pytest plugin to check source code with pylint'
arch=('any')
url='https://github.com/carsongee/pytest-pylint'
license=('MIT')
depends=(
  'python'
  'python-pytest'
  'python-pylint'
  'python-toml'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
_commit='229b64fcef27c5ac436f3b3a3d0ca07df0bf8b52'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('9d68725b60c7723e7c014212a0015c2fd2aad7099b271b922b41fdffd3b54225a4b3fd08c4a8aeb9354e10264b43e48df35093f2e7678af731ab7b7636f41e4b')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed -e 's/^v//'
}

prepare() {
  cd "$pkgname"

  # pytest-runner is certainly not required to build a wheel...
  sed -e '/pytest-runner/d' -i setup.py
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # install to temporary location, as importlib is used
  python -m installer --destdir=test_dir dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="test_dir/$site_packages:$PYTHONPATH"
  pytest -vv --ignore test_dir/
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$site_packages/pytest_pylint-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
