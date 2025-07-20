# Maintainer: devome <evinedeng@hotmail.com>
# Contributer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>

_pkgname=bonsai
pkgname="python-$_pkgname"
pkgver=1.5.4
pkgrel=1
pkgdesc="Python 3 module for accessing LDAP directory servers."
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://github.com/noirello/bonsai'
license=('MIT')
depends=('libldap>=2' 'libsasl>=2' 'python>=3.8' 'krb5')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-timeout')
optdepends=('python-gevent: enable bonsai.gevent'
            'python-tornado: enable bonsai.tornado'
            'python-trio: enable bonsai.trio')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6dd1710b1458bc3a4b7602d075b3691d9c18dd60a74a9968b942316c96fa62ed')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="tmp_install" dist/*.whl

    export PYTHONPATH="$PWD/tmp_install/$_site_packages/:$PYTHONPATH:$PWD/tests"
    pytest -vv -k 'not (test_asyncio or test_gevent or'` \
        `' test_ldapclient or test_ldapconnection or test_ldapentry or'` \
        `' test_ldapreference or test_pool or test_tornado or test_trio or'` \
        `' test_utils)'
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
