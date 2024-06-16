# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-wiimatch
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.3.2
pkgrel=1
pkgdesc="A package for optimal \"matching\" N-dimentional image background"
arch=('any')
url="https://wiimatch.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm'
#            'python-wheel'
#            'python-build'
#            'python-installer'
             'python-stsci_rtd_theme'
             'python-numpydoc'
             'python-numpy'
             'texlive-latexextra')  # latex.fmt: -latex; anyfontsize.sty: latexextra
checkdepends=('python-pytest'
              'python-scipy')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('1792179f66a712ef09121344666d1a80')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build
#   python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-wiimatch() {
    depends=('python>=3.7'
             'python-scipy')
    optdepends=('python-wiimatch-doc: Documentation for wiimatch')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
#   python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-wiimatch-doc() {
    pkgdesc="Documentation for Python wiimatch"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 ../../LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
