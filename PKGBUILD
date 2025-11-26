# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-pysiaf
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.25.0
pkgrel=1
pkgdesc="Handling of Science Instrument Aperture Files (SIAF) for space telescopes"
arch=('any')
url="https://pysiaf.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm>=3.4'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-sphinx-automodapi'
             'python-stsci_rtd_theme'
             'python-numpydoc'
             'python-astropy'
             'python-lxml'
             'python-matplotlib'
             'python-openpyxl'
             'python-scipy')
checkdepends=('python-pytest'
#             'python-pytest-xdist'
              'python-requests') # astropy, lxml, matplotlib, openpyxl, scipy already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('d224074fe40f4799caffca8ca455bcce')

get_pyinfo() {
    [[ $1 == "site" ]] && python -c "import site; print(site.getsitepackages()[0])" || \
        python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-pysiaf() {
    depends=('python-astropy>=4.3.1'
             'python-lxml>=4.6.4'
             'python-matplotlib>=3.4.3'
             'python-openpyxl>=3.0.9'
             'python-requests>=2.26.0'
             'python-scipy>=1.7.2')
    optdepends=('python-pysiaf-doc: Documentation for pysiaf')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    rm -r ${pkgdir}/$(get_pyinfo site)/{docs,examples}
    cp -a examples "${pkgdir}/usr/share/doc/${pkgbase}"
}

package_python-pysiaf-doc() {
    pkgdesc="Documentation for pysiaf"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 ../../LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
