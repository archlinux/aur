# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=python-sushy-tools
pkgver=2.0.0
pkgrel=1
pkgdesc="A set of tools to support the development and test of the Sushy library"
arch=(any)
url="https://opendev.org/openstack/sushy-tools"
license=('Apache-2.0')
depends=(
    'python'
    'python-flask'
    'python-requests'
    'python-tenacity'
    'libvirt-python'
    'python-munch'
    'python-werkzeug'
    'python-oslotest'
    'python-openstacksdk'
    'python-bcrypt'
    'python-webob'
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
    'python-testtools'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('f3e4dc6412385b70176f79f24b677f987ed126272a8e91a1778e3069d228785aebd7bbf0074898034262de7fb9e55ce8189c3c2950d2aed798ed6383f027774d')

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
