# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-steam
_name=${pkgname#python-}
_pkgver=2.0.0-alpha1
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Python package for interacting with Steam"
arch=('any')
url="https://github.com/solsticegamestudios/steam"
license=('MIT')
depends=(
  'python'
  'python-cachetools'
  'python-certifi'
  'python-gevent'
  'python-lxml'
  'python-protobuf'
  'python-pycryptodomex'
  'python-requests'
  'python-six'
  'python-vdf'
  'python-wsproto'
  'python-zstandard'
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
source=("$_name-${_pkgver}.tar.gz::$url/archive/refs/tags/v${_pkgver}.tar.gz"
        'https://github.com/solsticegamestudios/steam/pull/14.patch'
        'pkg_resources.patch')
sha256sums=('6447a3c97248885b44b73fec3bdcaee0421fe3e6e062d1bb195b9de3acc7eb0a'
            '70d3ba6f86f341c9b00ba43fa5feec76870bc4421e6b528e3378f9b2a7d30221'
            '91fee1a59979dd29ee9667b60bd3b20e542923b98a129e90db1cbdddc3a68827')

prepare() {
  cd "$_name-${_pkgver}"

  # Regenerate protos
  sed -i 's/protoc3/protoc/g' Makefile
  make pb_compile
  make pb_services
  make pb_gen_enums

  # cdn: Add ZSTD support
  # https://github.com/solsticegamestudios/steam/issues/13
  patch -Np1 -i ../14.patch

  # pkg_resources deprecated in Setuptools 82+
  # https://archlinux.org/todo/python-pkg_resources-deprecation/
  patch -Np1 -i ../pkg_resources.patch
}

build() {
  cd "$_name-${_pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-${_pkgver}"
  pytest || :
}

package() {
  cd "$_name-${_pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
