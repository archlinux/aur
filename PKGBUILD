# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-pytensor
_name=${pkgname#python-}
pkgver=2.12.1
pkgrel=1
pkgdesc="Fork of Aesara -- Library for defining, optimizing, and efficiently evaluating mathematical expressions involving multi-dimensional arrays"
arch=(x86_64)
url="https://github.com/pymc-devs/pytensor"
license=(custom)
makedepends=(
  python-build
  python-installer
  python-versioneer
  python-wheel
)
depends=(
  cython
  python-cons
  python-etuples
  python-filelock
  python-logical-unification
  python-minikanren
  python-numpy
  python-pydot
  python-scipy
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
  '24f2c933b62fadb17369d9ac837d223a06c414f8bb43298985ee8bca248b69a4'
  '73360d53a5c5e5718a544c69218d3d64adc2390007a9b6781f7b61cc32415e59'
)

_archive="$_name-rel-$pkgver"

prepare() {
  patch --directory="$_archive" --forward --strip=1 --input="$srcdir/remove-bin-package.patch"

  cd "$_archive"
  cp doc/LICENSE.txt LICENSE.txt-copy
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt-copy "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
