# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-steam
_name=${pkgname#python-}
pkgver=1.6.1
pkgrel=3
pkgdesc="Python package for interacting with Steam"
arch=('any')
url="https://github.com/solsticegamestudios/steam"
license=('MIT')
depends=(
  'python'
  'python-cachetools'
  'python-gevent'
  'python-lxml'
  'python-protobuf'
  'python-pycryptodomex'
  'python-requests'
  'python-six'
  'python-urllib3'
  'python-vdf'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-gevent-eventemitter'
  'python-pytest'
  'python-vcrpy'
)
replaces=('python-steam-solstice')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'mock.patch'
        'pkg_resources.patch')
sha256sums=('dcc305f11e1686a3557cd87afdc50ce177a5015ba3fdd51bef63c7302dd21b05'
            '984fce88957834c527ced824b9ab7dfadbf564ef18f6b232d6d1c9b02bb7bdc0'
            '91fee1a59979dd29ee9667b60bd3b20e542923b98a129e90db1cbdddc3a68827')

prepare() {
  cd "$_name-$pkgver"

  # Regenerate protos
  for p in protobufs/*.proto; do
    protoc --python_out ./steam/protobufs/ --proto_path=./protobufs "${p}"
  done

  sed -i 's/urllib3<2/urllib3/' requirements.txt setup.py

  # Mock module has mostly been replaced by Python's stdlib unittest.mock
  # https://archlinux.org/todo/drop-python-mock-checkdepends/
  patch -Np1 -i ../mock.patch

  # pkg_resources deprecated in Setuptools 82+
  # https://archlinux.org/todo/python-pkg_resources-deprecation/
  patch -Np1 -i ../pkg_resources.patch
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  pytest || :
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
