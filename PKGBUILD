# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Andy Botting <andy@andybotting.com>
_name=futurist
pkgname=python-futurist
pkgver=3.3.0
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
sha512sums=('b9318e914e009d903d81c693a73e7d8dd6e5468c70b91a89448be673aa238c64441d7ff7cc60f4f58eda8621c6a131eb81c02c2b16cbde33b22842e2178143f8')

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
