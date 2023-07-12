# Maintainer: getzze <getzze at gmail dot com>
# Maintainer: Jelle van der Waa <jelle@archlinux.org>

pkgname=python-asgiref_patch
_pkgname=python-asgiref
pkgver=3.4.1
pkgrel=3
pkgdesc="Reference ASGI adapters and channel layers (patched for funkwhale 1.2)"
arch=(any)
provides=('python-asgiref')
conflicts=('python-asgiref')
url="http://github.com/django/asgiref"
license=('BSD')
makedepends=('python-setuptools')
checkdepends=(python-pytest python-pytest-asyncio)
depends=('python')
source=("https://pypi.io/packages/source/a/asgiref/asgiref-${pkgver}.tar.gz"
        "bug_stateless_server_django_channels.patch"
        "0001-Fixed-292-Use-get_event_loop-in-class-level-code.patch")
sha256sums=('4ef1ab46b484e3c706329cedeff284a5d40824200638503f5768edb6de7d58e9'
            '32b3c65b39f16a392af41321a9e123591768628b55e73e295697217e81094853'
            'ba48f47d815e1982d8f59c6d3f4bffeb9d939242d42ddebecd39943e35e3e1db')

prepare() {
    cd "asgiref-${pkgver}"
    patch -u -p0 -i "${srcdir}"/bug_stateless_server_django_channels.patch
    patch -p1 -i "${srcdir}"/0001-Fixed-292-Use-get_event_loop-in-class-level-code.patch
}

build() {
    cd "asgiref-${pkgver}"
    python setup.py build
}

check() {
    cd "asgiref-${pkgver}"
    PYTHONPATH=. pytest .
}

package() {
    cd "asgiref-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1

    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/${_pkgname}/LICENSE
}
