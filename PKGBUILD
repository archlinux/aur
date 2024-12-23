# Maintainer: envolution
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Ronuk Raval <ronuk.raval at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-flexx
pkgver=0.8.4
pkgrel=2
pkgdesc='Write desktop and web apps in pure Python'
arch=('any')
url='https://github.com/flexxui/flexx'
license=('BSD-3-Clause')
depends=('python-dialite' 'python-pscript' 'python-tornado' 'python-webruntime')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-sphinx'
  'python-wheel')
# checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9d4ba7b94a2aa60157eae7727d973fbf8fc97fc7e3309632dd1390d78515d707')

build() {
  cd "flexx-$pkgver"
  python -m build --wheel --no-isolation
  make -C docs man
}

## FIXME: requires firefox and node
# check() {
#   cd "flexx-$pkgver/"
#   PYTHONPATH="$PWD" pytest --disable-warnings
# }

package() {
  export PYTHONHASHSEED=0
  cd "flexx-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 docs/_build/man/flexx.1 -t "$pkgdir/usr/share/man/man1/"

  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s \
    "$_site/flexx-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
