# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Erol V. Aktay <e.aktay@gmail.com>

pkgname='python2-html5lib'
pkgver=1.1
pkgrel=12
pkgdesc='HTML parser based on the WHATWG HTML specification (for Python 2)'
arch=('any')
url="https://pypi.org/project/html5lib/${pkgver}/"
license=('MIT')
depends=(
    'python2-six'
    'python2-webencodings'
)
makedepends=('python2' 'python2-setuptools')
optdepends=(
    'python2-lxml: recommended – fast parser, uses native code'
    'python2-chardet: recommended – fallback for unrecognized encodings'
    'python2-genshi: support reading Genshi streams'
)
checkdepends=(
    'python2-chardet'
#     'python2-lxml'    # heavy build from AUR, for a few optional tests (skipped if not found)
    'python2-mock'
    'python2-pytest'
    'python2-pytest-expect'
)
_test_commit='71eebd59772d1d39aced0c0582ae9c09acf3ce6e'
source=("html5lib-python-${pkgver}.tar.gz::https://github.com/html5lib/html5lib-python/archive/${pkgver}.tar.gz"
        "https://github.com/html5lib/html5lib-tests/archive/${_test_commit}.tar.gz")
sha256sums=('66e9e24a53c10c27abb6be8a3cf2cf55824c6ea1cef8570a633cb223ec46e894'
            'c866f5e4ae9ef34313e2b61fcb74849b6f8aef970bf8249956b6a5d142197087')

prepare() {
    cd "html5lib-python-${pkgver}"

    echo 'Preparing test data dir (linking it inside main source dir)'
    rmdir -v "html5lib/tests/testdata"
    ln -vsfT "../../../html5lib-tests-${_test_commit}" "html5lib/tests/testdata"
}

build() {
    cd "html5lib-python-${pkgver}"
    python2 setup.py build
}

check() {
    cd "html5lib-python-${pkgver}"
    LC_ALL='C.UTF-8' py.test2
}

package() {
    cd "html5lib-python-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    install -Dm 644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
