# Maintainer: envolution
# Contributor: rumpelsepp <stefan at rumpelsepp dot org>
# Contributor: Carl Smedstad <carsme@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-msgspec
_pkgname=${pkgname#python-}
pkgver=0.19.0
pkgrel=1
pkgdesc="A fast and friendly JSON/MessagePack library, with optional schema validation"
arch=(x86_64 aarch64)
url="https://github.com/jcrist/msgspec"
license=(BSD-3-Clause)
depends=(
  glibc
  python
  python-attrs
  python-typing_extensions
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-msgpack
  python-pytest
)
optdepends=(
  'python-tomli-w: for TOML support'
  'python-tomli: for TOML support'
  'python-yaml: for YAML support'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jcrist/msgspec/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1412dd9e1f1fbd12420a4dd25419a2e8772bf35416bbc6d43c5fd7dde3b74fdd')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  rm -rf test-env
  python -m venv --system-site-packages test-env
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0].replace('/usr/', ''))")
  export PYTHONPATH="$PWD/test-env/$site_packages"
  test-env/bin/python -m installer "$_pkgname-$pkgver/dist/"*.whl
  test-env/bin/python -m pytest "$_pkgname-$pkgver/tests/"
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
# vim:set ts=2 sw=2 et:
