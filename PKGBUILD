# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-pytest-check
_pkgname="${pkgname#python-}"
pkgver=2.0.0
pkgrel=1
pkgdesc='Pytest plugin that allows multiple failures per test'
arch=('any')
url='https://github.com/okken/pytest-check'
license=('MIT')
depends=(
  'python'
  'python-pytest'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-flit-core'
)
_commit='33c19a950f96be439fc0230f820409a49fb1e174'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # remove flit-core version constraint
  sed \
    -i pyproject.toml \
    -e 's/,<3//'
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
