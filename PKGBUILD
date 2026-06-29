# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Andy Botting <andy@andybotting.com>
_name=futurist
pkgname=python-futurist
pkgver=3.4.0
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
sha512sums=('d1a215b98d6a28b2a5411ceaf33a498936498aebe3edc2e4f28d3777daf0f7c02e14ca4c2eb10033db887254a98d61f53ba234323b12d3b51ad8d232bbe984b9')

build() {
    cd $_name
    export PBR_VERSION=$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_name
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    mv $_name/tests .
    rm -rf $_name
    test-env/bin/python -P -m stestr --test-path tests run
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
