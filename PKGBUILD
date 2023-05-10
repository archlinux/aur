# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-pytensor
_name=${pkgname#python-}
pkgver=2.11.3
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
  'db02ade138d75cfc7e646a66426c17f2b136ef953bd93f978978519b8d047050'
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
