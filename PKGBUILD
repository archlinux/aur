# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-flake8-annotations
pkgver=2.9.0
pkgrel=1
pkgdesc="A flake8 extension that checks type annotations"
arch=('any')
url="https://github.com/sco1/flake8-annotations"
license=('MIT')
depends=('python' 'flake8')
makedepends=(
  'git'
  'python-build'
  'python-poetry-core'
  'python-installer'
)
checkdepends=(
  'python-pytest'
  'python-pytest-check'
  'python-pytest-cov'
)
_commit='2044dc84fbb6390205cf8c663a121ad02d3e16c3'
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  python -m build \
    --wheel \
    --no-isolation
}

check() {
  cd "$pkgname"

  pytest \
    --deselect testing/test_flake8_actually_runs_checker.py::test_checker_runs \
    --deselect testing/test_opinionated_any.py::test_ANN401_fire_when_selected
}

package() {
  cd "$pkgname"

  python -m installer \
    --destdir="$pkgdir" \
    dist/*.whl

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
