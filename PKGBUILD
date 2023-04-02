# Maintainer: Benoît Allard <benoit.allard@gmx.de>
pkgname=python-grpclib
pkgver=0.4.3
pkgrel=3
pkgdesc="Pure-Python gRPC implementation for asyncio"
arch=('any')
url="http://grpclib.readthedocs.io/"
license=('BSD')
makedepends=("python-pytest" "python-pytest-asyncio" "python-async-timeout" "python-faker")
depends=("python" "python-h2" "python-multidict" "python-certifi"
         "python-importlib-metadata" "python-setuptools" "python-googleapis-common-protos" "python-certifi")
optdepends=(
    "python-protobuf: for protobuf support"
)
_name=${pkgname#python-}
source=("$pkgname-$pkgver.tar.gz::https://github.com/vmagamedov/$_name/archive/v$pkgver.tar.gz"
        "90eb869.patch" "ff9d555.patch")
sha256sums=('b8f191a0596698f40777af007056ababb92c74561cf67fbc62bd8d5b5a19b12a'
            '07944a18f957c0d9cc16607a5795524dd71637345e59e2db153488acb81eaedd'
            '29befd67ac7eb408d89fb658b5dc371a3404571a8b4f1284648c8a9f101c57d7')

prepare() {
    cd $_name-$pkgver
    patch --forward --strip=1 --input="${srcdir}/90eb869.patch"
    patch --forward --strip=1 --input="${srcdir}/ff9d555.patch"
}

build() {
    cd $_name-$pkgver
    export PYTHONSEED=1
    python setup.py build
}

check() {
    cd $_name-$pkgver
    python -m pytest -v
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
