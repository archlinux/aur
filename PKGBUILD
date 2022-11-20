# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python38-isoduration
_pkgname="${pkgname#python38-}"
pkgver=20.11.0
pkgrel=1
pkgdesc='Operations with ISO 8601 durations'
arch=('any')
url='https://github.com/bolsote/isoduration'
license=('ISC')
depends=('python' 'python38-arrow')
makedepends=(
  'git'
  'python38-build'
  'python38-installer'
  'python38-wheel'
  'python38-setuptools'
)
checkdepends=(
  'python38-pytest'
  'python38-pytest-benchmark'
  'python38-isodate'
  'python38-hypothesis'
)
_commit='f7316c5dad4d087d823795feaa401653906ac340'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  python3.8 -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  PYTHONPATH="$PWD/src:$PYTHONPATH" pytest -v
}

package() {
  cd "$pkgname"

  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
