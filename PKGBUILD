# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Mathijs Kadijk <maccain13@gmail.com>

_name=dnspython
pkgname=python38-dnspython
pkgver=2.2.1
pkgrel=2
epoch=1
pkgdesc="A DNS toolkit for Python"
arch=('any')
url="http://www.dnspython.org"
license=('custom:ISC')
depends=('python38')
makedepends=('python38-build' 'python38-installer'
             'python38-wheel' 'python38-poetry-core')
checkdepends=('python38-idna' 'python38-cryptography' 'python38-trio' 'python38-pytest')
optdepends=('python38-cryptography: DNSSEC support'
            'python38-requests-toolbelt: DoH support'
            'python38-idna: support for updated IDNA 2008'
            'python38-curio: async support'
            'python38-trio: async support'
            'python38-sniffio: async support')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0f7569a4a6ff151958b64304071d370daa3243d15941a7beedf0c9fe5105603e')
validpgpkeys=('A580DEE052FEC78D8ACF383DF24B3AFC8CA2F5C7') # Bob Halley <halley@dnspython.org>

prepare() {
    cd dnspython-${pkgver}
}

build() {
    cd dnspython-${pkgver}

    #python3.8 setup.py build
    python3.8 -m build --wheel --no-isolation
}

check() {
    cd dnspython-${pkgver}

    # https://github.com/rthalley/dnspython/issues/622
    pytest -k 'not test_unpickle'
}

package() {
    cd dnspython-${pkgver}

    python3.8 -m installer --destdir="$pkgdir" dist/*.whl
    #python3.8 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
