# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-typing-validation
_pname=${pkgbase#python-}
#_pyname=${_pname//-/_}
_pyname=${_pname}
pkgname=("python-${_pname}" "python-${_pname}-doc")
pkgver=2.2.1
pkgrel=1
pkgdesc="A simple library for runtime type-checking"
arch=('any')
url="https://typing-validation.readthedocs.io"
license=('LGPL-3.0-or-later')
makedepends=('python-hatchling'
             'python-build'
             'python-installer'
             'python-sphinx-autodoc-typehints'
             'python-sphinx_rtd_theme'
             'python-numpy')
checkdepends=('python-pytest'
              'python-numpy'
              'mypy')
#source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
source=("https://github.com/hashberg-io/typing-validation/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('31d0b957821dc2429d3961be08be8229')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="${srcdir}/${_pyname}-${pkgver}" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count # no xdist
}

package_python-typing-validation() {
    depends=('python>=3.14')
    optdepends=('python-typing-validation-doc: Documentation for typing-validation')
    provides=("python-${_pyname}")
    conflicts=("python-${_pyname}")
    cd ${srcdir}/${_pyname}-${pkgver}

#   install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-typing-validation-doc() {
    pkgdesc="Documentation for Python typing-validation"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

#   install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
