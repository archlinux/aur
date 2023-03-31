# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Eric Toombs

pkgname=python-binance-git
_pkgname="${pkgname%-git}"
_pkg="${_pkgname#python-}"
pkgver=1.0.17.r1.g1b9dd48
pkgrel=1
pkgdesc="An unofficial Python wrapper for the Binance exchange REST API"
arch=('any')
url="https://github.com/sammchardy/python-binance"
license=('MIT')
depends=(
  'python-aiohttp'
  'python-pycryptodome'
  'python-dateparser'
  'python-pytz'
  'python-requests'
  'python-ujson'
  'python-websockets')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
# checkdepends=('python-pytest' 'python-requests-mock')
provides=("$_pkgname=${pkgver%.r*}")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

# check() {
#   cd "$_pkgname"
#   pytest -x
# }

package() {
  cd "$_pkgname"
  python -m installer --destdir "$pkgdir" dist/*.whl
  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -dv "$pkgdir/usr/share/licenses/$pkgname/"
  ln -sv "$_site/${_pkgname/-/_}-${pkgver%.r*}.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
