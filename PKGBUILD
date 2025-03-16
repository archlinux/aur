# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=python-sushy
pkgver=5.5.0
pkgrel=1
pkgdesc="Small Python library to communicate with Redfish based systems"
arch=(any)
url="https://opendev.org/openstack/sushy"
license=('Apache-2.0')
depends=(
    'python'
    'python-pbr'
    'python-requests'
    'python-dateutil'
    'python-stevedore'
    'python-urllib3'
    'python-oslotest'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'tar'
)
checkdepends=(
    'python-coverage'
    'python-stestr'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('ce22791e39b9fda849cd7795fd0edb2843aa5cefc8244e67908fbaa18392372c04bf39f784089e695a01e1af9aad26cdcb9116a81565627d2915f439da461361')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build(){
    cd "$pkgname-$pkgver" || exit
    PBR_VERSION="$pkgver" python -m build --wheel --no-isolation
}

check(){
    cd "$pkgname-$pkgver" || exit
    stestr run
}

package(){
    cd "$pkgname-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 README.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
