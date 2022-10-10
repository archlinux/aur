# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-rpp
pkgver=0.4
pkgrel=1
pkgdesc='Read and write Reaper RPP files with Python'
arch=('any')
url='https://github.com/Perlence/rpp'
license=('MIT')
depends=('python' 'python-attrs' 'python-ply')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
checkdepends=('python-pytest' 'python-pytest-runner')
_commit='a53222364f51469572fd9b008d0d24fe23cca957'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # fix iterable import for Python 3.10
  git cherry-pick -n 0ba3583fb0995a4bb7f654f1bee635a7668f8947
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  PYTHONPATH="$PWD:$PYTHONPATH" pytest -v
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.rst
}
