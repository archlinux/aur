#!/usr/bin/env bash
# Maintainer: Kevin McNamara <kevin.j.mcnamara+tech@proton.me>

_name=niripy
pkgname=python-$_name
pkgver=0.2.5
pkgrel=1
pkgdesc="Python bindings for Niri."
arch=(any)
url="https://github.com/kjmcnamara1/$_name"
license=(MIT)
depends=(python python-pydantic)
makedepends=(python-build python-installer)
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4e512a4f4eaa5d6c9332d86bbb02c03591bc91c8fe2f0d22a39d1f28cf488769')

build() {
  # Extracted dirname is only niripy (not python-niripy)
  cd "$_name-$pkgver"
  # Use uv to install dependencies, then build wheel
  python -m build --wheel
}

check() {
  cd "$_name-$pkgver/src"
  # Test import package
  python -c "import niripy"
}

package() {
  cd "$_name-$pkgver"
  # Use python installer to install wheel
  python -m installer --destdir="$pkgdir" dist/*.whl
  # Copy license to system licenses directory
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
