# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-typing-validation
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}")
# "python-${_pname}-doc")
pkgver=1.2.12
pkgrel=1
pkgdesc="A simple library for runtime type-checking"
arch=('any')
url="https://typing-validation.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools-scm>=6.2'
             'python-build'
             'python-installer'
#            'python-sphinx-autodoc-typehints'
#            'python-sphinx_rtd_theme'
             'python-typing_extensions')  # wheel required by new setuptools
checkdepends=('python-pytest'
#             'python-pytest-xdist'
              'python-numpy')   # typing_extensions already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('c4ecf70bf701f96683b5a91cc6aecd4d')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-typing-validation() {
    depends=('python>=3.7' 'python-typing_extensions>=4.6.0')
    optdepends=('python-typing-validation-doc: Documentation for typing-validation')
    provides=("python-${_pyname}")
    conflicts=("python-${_pyname}")
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-typing-validation-doc() {
#    pkgdesc="Documentation for Python typing-validation"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
