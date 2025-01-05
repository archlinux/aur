# Maintainer: Harriet O'Brien <harrietobrien@protonmail.com>
# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=python-pytest-check
_pkgname="${pkgname#python-}"
pkgver=2.4.1
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
_commit='54a7f39546eecfd58aa1f97275177a714770e0ba'
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
