# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Andy Botting <andy@andybotting.com>
_name=futurist
pkgname=python-futurist
pkgver=3.5.0
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
sha512sums=('ae9b358e0ab5588f392df7d48a0087f6ec97c69a0553ce9a44f9a283c372cca5bc5aef83b495f45904cf88a7f33cb184b566e963828aa2c5461c06683bf7816a')

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
