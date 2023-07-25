# Maintainer: Tom Krizek <tkrizek@isc.org>

pkgname=python-dnspython-git
_pkgname=dnspython
pkgver=2.4.0
pkgrel=1
pkgdesc="A DNS toolkit for Python"
arch=('any')
url="http://www.dnspython.org"
license=('custom:ISC')
depends=('python')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=(
    'python-setuptools'
    # 'cython'  # uncomment dep & build option for cython optimization speedup
)
checkdepends=('python-idna' 'python-cryptography' 'python-trio' 'python-pytest')
optdepends=('python-cryptography: DNSSEC support'
            'python-requests-toolbelt: DoH support'
            'python-idna: support for updated IDNA 2008'
            'python-curio: async support'
            'python-trio: async support'
            'python-sniffio: async support')
source=("${_pkgname}::git+https://github.com/rthalley/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "${srcdir}/${_pkgname}"

    python setup.py build  # --cython-compile
}

check() {
    cd "${srcdir}/${_pkgname}"

    # https://github.com/rthalley/dnspython/issues/622
    pytest -k 'not test_unpickle'
}

package() {
    cd "${srcdir}/${_pkgname}"

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
