# Maintainer: envolution
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Ronuk Raval <ronuk.raval at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-pscript
pkgver=0.7.7
pkgrel=1
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
sha256sums=('f02f4bba234aac0088dd674f72de63d16baf4827fbeaf5150515eac90bbf2761')

build() {
  cd "pscript-$pkgver"
  python -m build --wheel --no-isolation
  make -C docs man
}

package() {
  export PYTHONHASHSEED=0
  cd "pscript-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 docs/_build/man/PScript.1 "$pkgdir/usr/share/man/man1/pscript.1"

  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s \
    "$_site/pscript-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
