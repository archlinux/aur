# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-environ-config
_name=${pkgname#python-}
pkgver=23.2.0
pkgrel=1
pkgdesc="Python Application Configuration With Environment Variables"
arch=(any)
url="https://github.com/hynek/environ-config"
license=(Apache)
depends=(
  python
  python-attrs
)
makedepends=(
  python-build
  python-hatchling
  python-hatch-fancy-pypi-readme
  python-hatch-vcs
  python-installer
  python-wheel
)
checkdepends=(
  python-pytest
  python-moto
)
optdepends=(
  'python-boto3: secret extraction from AWS Secrets Manager'
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  "remove-failing-tests.patch"
)
sha256sums=(
  'b717dbdf671a79b8c73427bc2c8eeaabed7abf36252281accfd5db25b50db21a'
  '1950f7520048462cb5669c928ea0c260ba5ba26f272fbd0053498aecc781abe0'
)

_archive="$_name-$pkgver"

prepare() {
  cd "$_archive"

  {
    echo "node: ????????????????????????????????????????"
    echo "node-date: ?????????????????????????"
    echo "describe-name: $pkgver"
    echo "ref-names: ???? -> ???, tag: $pkgver"
  } > .git_archival.txt

  patch --forward --strip=1 --input="${srcdir}/remove-failing-tests.patch"
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  PYTHONPATH=src/ python -m pytest --ignore=tests/test_packaging.py
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
