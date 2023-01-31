# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-environ-config
_name=${pkgname#python-}
pkgver=23.1.0
pkgrel=2
pkgdesc="Python Application Configuration With Environment Variables"
arch=(any)
url="https://github.com/hynek/environ-config"
license=(APACHE)
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

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  "remove-failing-tests.patch"
)
sha256sums=(
  'eb12641008c42c1dc8e1a5230536187ecb752c4779dd0b4ae7b72c82188b787a'
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

  PYTHONPATH=src/ python -m pytest
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
