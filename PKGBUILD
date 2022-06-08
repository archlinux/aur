# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-sphinx-asdf
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.1.3
pkgrel=1
pkgdesc="Sphinx plugin for generating documentation from ASDF schemas"
arch=('any')
url="https://github.com/spacetelescope/sphinx-asdf"
license=('BSD')
makedepends=('python-setuptools-scm')
#            'python-wheel'
#            'python-build'
#            'python-installer')
checkdepends=('python-pytest' 'python-sphinx' 'python-yaml' 'python-mistune=0.8.4')
#checkdepends=('python-pytest' 'python-sphinx' 'python-yaml' 'python-mistune=0.8.4' 'python-sphinx-bootstrap-theme')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('9b594350a1ddb7464d598584c541883e57736a275f976dfb2ea90835a3084e67')

get_pyver() {
    python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))'
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
#   python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
        build/lib/${_pyname/-/_}-${pkgver}-py$(get_pyver).egg-info
    PYTHONPATH="build/lib" pytest || warning "Tests failed"
#   python setup.py test
}

package() {
    depends=('python-yaml' 'python-mistune=0.8.4' 'python-sphinx' 'python-sphinx-bootstrap-theme')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}
