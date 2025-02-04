# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Submitter: Nbiba Bedis <bedisnbiba@gmail.com>

pkgname=python-ansimarkup
_pyname=${pkgname#python-}
pkgver=2.1.0
pkgrel=1
pkgdesc='Produce colored terminal text with an xml-like markup'
arch=('any')
url='https://github.com/gvalkov/python-ansimarkup'
license=('BSD-3-Clause')
makedepends=('python-setuptools'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
#             'python-pytest-xdist'
              'python-colorama')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "${pkgver}-conftest.py::https://raw.githubusercontent.com/gvalkov/python-ansimarkup/refs/tags/v${pkgver}/tests/conftest.py")
#source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7b3e3d93fecc5b64d23a6e8eb96dbc8b0b576a211829d948afb397d241a8c51b'
            '944a40e46b66fd3c2e10354a6c9c472b2e57f6a83ba6f2c26663e29533de9784')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    ln -rs {${srcdir}/${pkgver}-,tests/}conftest.py
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}
    depends=('python-colorama')
    #PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
