# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-aesara
_name=${pkgname#python-}
pkgver=2.9.0
pkgrel=1
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
  python-etuples
  python-filelock
  python-minikanren
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
  '579ad9e4c7daeba22d2ae09892926d908e936a785e38db4a77195a7abb3f8b67'
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
