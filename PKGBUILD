# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-writer-sdk
_pkgname=${pkgname#python-}
pkgver=2.2.0
pkgrel=1
pkgdesc="Writer REST API"
arch=(any)
url="https://github.com/writer/writer-python"
license=(Apache-2.0)
provides=('python-writerai')
depends=(
  python
  python-httpx
  python-typing_extensions
  python-pydantic-core
  python-distro
  python-jiter
  python-pydantic
)
makedepends=(
  python-build
  python-installer
  python-wheel
  python-hatchling
)
optdepends=(
  'python-pytorch-cuda: cuda extensions'
  'cuda: cuda toolkit'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('aab123052defa919503c07a07f4db9d7a0a1255ceb17c1c47d4feb415ba65f0b')

_archive="writer-python-$pkgver"

prepare() {
  cd "$_archive"
  sed -i '/^requires *= *\[/ s/hatchling==/hatchling>=/g' pyproject.toml
}
build() {
  cd "$_archive"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
# vim:set ts=2 sw=2 et:
