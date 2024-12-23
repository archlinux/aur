# Maintainer: envolution
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Ronuk Raval <ronuk.raval at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-dialite
pkgver=0.5.3
pkgrel=5
pkgdesc='Lightweight pure-Python package to show simple dialogs'
arch=('any')
url='https://github.com/flexxui/dialite'
license=('BSD')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-sphinx'
  'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('327b172a722b05b63d1427d110cf431c4de260c7d48bcac8fa312369ab1e79c2')

build() {
  cd "dialite-$pkgver"
  python -m build --wheel --no-isolation
  make -C docs man
}

check() {
  cd "dialite-$pkgver"
  PYTHONPATH="$PWD" pytest -x --disable-warnings
}

package() {
  export PYTHONHASHSEED=0
  cd "dialite-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 docs/_build/man/Dialite.1 "$pkgdir/usr/share/man/man1/dialite.1"

  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s \
    "$_site/dialite-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
