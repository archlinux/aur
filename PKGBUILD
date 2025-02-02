# Maintainer: envolution
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Ronuk Raval <ronuk.raval at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-pscript
pkgver=0.8.0
pkgrel=2
pkgdesc='Python to JavaScript compiler'
arch=('any')
url='https://github.com/flexxui/pscript'
license=('BSD')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-sphinx'
  'python-wheel')
changelog=releasenotes.rst
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1c7fcb8fa1f6ed7c33b82ee9462628ff7090357cf8de2888b088123eebd6d06b')

build() {
  cd "pscript-$pkgver"
  python -m build --wheel --no-isolation
  make -C docs man
}

package() {
  export PYTHONHASHSEED=0
  cd "pscript-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 docs/_build/man/pscript.1 "$pkgdir/usr/share/man/man1/pscript.1"

  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s \
    "$_site/pscript-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
