# Maintainer: Tomas Krizek <tomas.krizek@nic.cz>

pkgname=python-dnspython-git
_pkgname=dnspython
pkgver=v2.1.0.r200.ab53090
pkgrel=1
pkgdesc="A DNS toolkit for Python"
arch=('any')
url="http://www.dnspython.org"
license=('ISC')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=(
    'python-setuptools'
    'python-pytest'
    'python-httpx'
    'python-h2'
    # 'cython'  # uncomment dep & build option for cython optimization speedup
)
checkdepends=('python-idna' 'python-cryptography' 'python-trio')
depends=('python')
optdepends=(
    'python-idna: support for update IDNA 2008'
    'python-cryptography: DNSSEC support'
    'python-httpx: DNS-over-HTTPS support'
    'python-h2: DNS-over-HTTPS support'
    'python-trio: async I/O backend'
    'python-curio: async I/O backend'
    'python-sniffio: async I/O'
)
source=("${_pkgname}::git+https://github.com/rthalley/${_pkgname}.git")
md5sums=('SKIP')

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

    python setup.py test
}

package() {
    cd "${srcdir}/${_pkgname}"

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
