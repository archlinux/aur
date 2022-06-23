# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Erol V. Aktay <e.aktay@gmail.com>

pkgname='python2-html5lib'
_basename="${pkgname#python2-}"
_distname="${_basename}-python"
pkgver=1.1
pkgrel=11
pkgdesc='HTML parser based on the WHATWG HTML specification (for Python 2)'
arch=('any')
url="https://pypi.org/project/${_distname}/${pkgver}/"
license=('MIT')
depends=(
    'python2-six'
    'python2-webencodings'
)
makedepends=('python2-setuptools')
optdepends=(
    'python2-lxml: recommended – fast parser, uses native code'
    'python2-chardet: recommended – fallback for unrecognized encodings'
    'python2-genshi: support reading Genshi streams'
)
checkdepends=(
    'python2-chardet'
    'python2-lxml'
    'python2-mock'
    'python2-pytest'
    'python2-pytest-expect'
)
_test_commit='71eebd59772d1d39aced0c0582ae9c09acf3ce6e'
_tarname="${_distname}-${pkgver}"
source=("${_tarname}.tar.gz::https://github.com/${_basename}/${_distname}/archive/${pkgver}.tar.gz"
        "https://github.com/${_basename}/${_basename}-tests/archive/${_test_commit}.tar.gz")
sha256sums=('66e9e24a53c10c27abb6be8a3cf2cf55824c6ea1cef8570a633cb223ec46e894'
            'c866f5e4ae9ef34313e2b61fcb74849b6f8aef970bf8249956b6a5d142197087')

prepare() {
    cd "${_tarname}"

    echo 'Preparing test data dir (linking it inside main source dir)'
    rmdir -v "${_basename}/tests/testdata"
    ln -vsfT "../../../${_basename}-tests-${_test_commit}" "${_basename}/tests/testdata"
}

build() {
    cd "${_tarname}"
    python2 setup.py build
}

check() {
    cd "${_tarname}"
    LC_ALL='C.UTF-8' py.test2
}

package() {
    cd "${_tarname}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    install -Dm 644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
