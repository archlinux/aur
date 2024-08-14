# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-astroplan
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.10.1
pkgrel=1
pkgdesc="A python package to help astronomers plan observations"
arch=('any')
url="https://astroplan.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-sphinx-astropy'
             'python-sphinx-copybutton'
             'python-pydata-sphinx-theme'
             'python-astroquery'
             'graphviz')
checkdepends=('python-pytest-astropy-header'
              'python-pytest-doctestplus'
              'python-pytest-mpl') # six <- dateutil <- matplotlib <- pytest-mpl; pytz <- babel <- sphinx; astropy <- astroquery
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
#       "http://hpiers.obspm.fr/iers/eop/eopc04/eopc04_IAU2000.62-now"
#       "https://skyview.gsfc.nasa.gov/tempspace/fits/skv9820097384828.fits"
        'fix_doc_index_astropy_link.patch')
md5sums=('9c0c5def3324369b47a7ff62b161fcc0'
         'be56be5926b43589b273c16544c5241a')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
        build/lib/${_pyname/-/_}-${pkgver}-py$(get_pyver .).egg-info
    PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-astroplan() {
    depends=('python>=3.7' 'python-numpy>=1.17' 'python-astropy>=4' 'python-pytz' 'python-six')
    optdepends=('python-matplotlib: Plotting support'
                'python-astroquery: Astroquery support'
                'python-astroplan-doc: Documentation for astroplan')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
#   install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-astroplan-doc() {
    pkgdesc="Documentation for Python astroplan module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.rst
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
