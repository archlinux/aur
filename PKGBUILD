# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-refurb
pkgver=1.9.1
pkgrel=1
pkgdesc='A tool for refurbishing and modernizing Python codebases'
arch=('any')
url='https://github.com/dosisod/refurb'
license=('GPL3')
depends=(
  'python'
  'mypy'
  'python-tomli'
)
makedepends=(
  'git'
  'python-build'
  'python-poetry-core'
  'python-installer'
  'python-wheel'
)
checkdepends=('python-pytest')
_commit='6977854c443f3a83d434c23c9b7f09f6c08ec681'
source=(
  "$pkgname::git+$url#commit=$_commit"
  'skip-coverage-report.patch'
)
b2sums=('SKIP'
        '89f67f2799c5d2207158cb79113cd425156abf1ba53ec6e4d60cb0eae2fc1a942849a5bee020bfbf1c2b34e7489e659baa4bb69ed0cf50b7a9d67129685069c5')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # don't need coverage report, so skip it
  patch -p1 -i "$srcdir/skip-coverage-report.patch"
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  # NOTE: test_checks() from test/test_checks.py takes a while to run
  pytest
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
