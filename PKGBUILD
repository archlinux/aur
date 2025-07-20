# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-kiss-headers
_name=${pkgname#python-}
pkgver=2.5.0
pkgrel=1
pkgdesc="Python package for HTTP/1.1 style headers. Parse headers to objects."
arch=('any')
url="https://ousret.github.io/kiss-headers"
license=('MIT')
depends=('python')
makedepends=(
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
#checkdepends=(
#  'python-pytest'
#  'python-requests'
#)
source=("${_name}-$pkgver.tar.gz::https://github.com/Ousret/kiss-headers/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0c3548f5c89df24a79afe5052b5e9d8655cf95fea3c106fe8a0aa6f221a6c014')

prepare() {
  cd "${_name}-$pkgver"

  # Do not measure test coverage
  sed -i '/"--doctest-modules -rxXs"/d' \
    pyproject.toml
}

build() {
  cd "${_name}-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_name}-$pkgver"

  # Do not run tests that access external network
#  pytest -k 'not encode_decode and not httpbin and not parse_response'
}

package() {
  cd "${_name}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
