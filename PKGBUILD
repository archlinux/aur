# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: fenuks

pkgname=python-language-server
pkgver=0.36.2
pkgrel=5
pkgdesc="An implementation of the Language Server Protocol for Python"
arch=(any)
url="https://github.com/palantir/python-language-server"
license=(MIT)
depends=(python python-setuptools python-jsonrpc-server python-future python-jedi python-pluggy python-ujson)
optdepends=('python-mccabe: for complexity checking'
            'python-rope: for completions and renaming'
            'python-pyflakes: for linter to detect various errors'
            'flake8: for code linting'
            'python-pycodestyle: for style checking'
            'python-pylint: for code linting'
            'autopep8: for code formatting'
            'yapf: for code formatting (preferred over autopep8)'
            'python-pydocstyle: for docstring style checking')
checkdepends=(python-pytest python-pytest-runner python-pytest-cov python-pyflakes flake8
              python-mock python-jedi python-future yapf python-mccabe python-pycodestyle
              autopep8 python-rope python-pydocstyle python-pylint python-jsonrpc-server
              python-numpy python-pandas python-matplotlib python-flaky)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz
        fix-test.patch
        jedi-018-support.patch::${url}/commit/40afab312a6bf0dcd620c82e59555ea2967aacdf.patch)
sha256sums=('9984c84a67ee2c5102c8e703215f407fcfa5e62b0ae86c9572d0ada8c4b417b0'
            '75bee7f9e288bf72e116c8a8f10d32758a800409a91266c7cd15888c6c254bdf'
            '84dc8c69f7bee9d60679141b25c81a849ff0b45e91f435e1aa8ae6dd6db6bb84')


prepare() {
    cd ${pkgname}-${pkgver}
    patch -Np1 < ../fix-test.patch
    patch -Np1 < ../jedi-018-support.patch
    sed -i 's/jedi<0.18.0,/jedi/' python_language_server.egg-info/requires.txt
    sed -i 's/pycodestyle<2.7.0,/pycodestyle/g' python_language_server.egg-info/requires.txt setup.py
    sed -i 's/pyflakes<2.3.0,/pyflakes/g' python_language_server.egg-info/requires.txt setup.py
    sed -i 's/pycodestyle>=2.6.0,<2.7.0/pycodestyle>=2.6.0/g' python_language_server.egg-info/requires.txt setup.py
    sed -i 's/pyflakes>=2.2.0,<2.3.0/pyflakes>=2.2.0/g' python_language_server.egg-info/requires.txt setup.py
}

build() {
    cd ${pkgname}-${pkgver}
    python setup.py build
}

check() {
    cd ${pkgname}-${pkgver}
    py.test -k 'not test_pyqt_completion and not test_snippet_parsing and not test_numpy_hover'
}

package() {
    cd ${pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}

# vim:set ts=4 sw=4 et:
