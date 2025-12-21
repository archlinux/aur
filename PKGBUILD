# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Andy Botting <andy@andybotting.com>
_name=futurist
pkgname=python-futurist
pkgver=3.2.1
pkgrel=1
pkgdesc='Code from the future, delivered to you in the now'
arch=(any)
url=https://docs.openstack.org/futurist
license=(Apache-2.0)
makedepends=(
    git
    python-build
    python-installer
    python-pbr
)
depends=(python-debtcollector)
checkdepends=(
    python-eventlet
    python-oslotest
    python-prettytable
    python-stestr
    python-testscenarios
    python-testtools
)
source=($_name::git+https://github.com/openstack/futurist.git#tag=$pkgver)
sha512sums=('f6507b3e3ce4517fd9c834dd54213eee4174cadfe6f7b46287f84aaf24940b884b8aa4dc05c0ba30084db249b40e1f74e3da703b8d23e4eb828cb3663987cb88')

build() {
    cd $_name
    export PBR_VERSION=$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_name
    local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    python -m installer --destdir=../test_dir dist/*.whl
    mv $_name/tests .
    rm -rf $_name
    PYTHONPATH="$PWD/../test_dir/usr/lib/python$python_version/site-packages" stestr --test-path tests run
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
