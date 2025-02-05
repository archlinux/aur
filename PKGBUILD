# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-electrum_ecc
_pkgname=electrum-ecc
pkgver=0.0.4
pkgrel=1
pkgdesc="python library for libsecp256k1, using ctypes"
arch=('any')
depends=(python)
makedepends=(python-setuptools)
url="https://github.com/spesmilo/electrum-ecc"
license=('MIT')
options=('!emptydirs')
source=("git+https://github.com/spesmilo/electrum-ecc.git"
        "git+https://github.com/bitcoin-core/secp256k1")
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd "$srcdir/$_pkgname"
    _tag=$(git tag --list --sort=taggerdate | tail -n1 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
  printf $_tag;
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^.\{5\}//'
  git submodule init
  git config submodule.secp256k1.url "$srcdir/secp256k1"
  git -c protocol.file.allow=always submodule update
#  patch --forward --strip=2 --input="../../wheel.patch"
}

build() {
  cd "$srcdir/$_pkgname"
#  python setup.py build
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
