# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-aesara
_name=${pkgname#python-}
pkgver=2.8.12
pkgrel=2
pkgdesc="Library for defining, optimizing, and efficiently evaluating mathematical expressions involving multi-dimensional arrays"
arch=(any)
url="https://github.com/aesara-devs/aesara"
license=(custom)
makedepends=(
  python-build
  python-installer
  python-wheel
  python-hatchling
  python-hatch-vcs
)
depends=(
  python-cons
  python-etuples
  python-filelock
  python-numpy
  python-scipy
  python-sympy
  python-typing_extensions
)
optdepends=(
  'python-numba: for graph transpilation compilation'
  'python-jax: for graph transpilation compilation'
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/rel-${pkgver}.tar.gz"
  "remove-bin-package.patch"
)
sha256sums=(
  '497a9a0c2379f3453f33ccd8bb51414f3fc548390b8a1d9ac65ddbe27b5844bd'
  '26a048c151f022411e90ff6793b61b19b0a3bf5588086d7cf9572c312be75dad'
)

_archive="$_name-rel-$pkgver"

prepare() {
    patch --directory="$_archive" --forward --strip=1 --input="$srcdir/remove-bin-package.patch"
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
