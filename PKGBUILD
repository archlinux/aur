# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Maintainer: Ista Zahn <istazahn@gmail.com>

pkgbase=python-glue-core
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}" "python-${_pname}-doc")
pkgver=1.24.1
pkgrel=1
pkgdesc="Core library for the glue multidimensional data visualization project"
arch=('any')
url="http://glueviz.org"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm'
             'python-build'
             'python-installer'
             'python-sphinx-automodapi'
             'python-sphinx-book-theme'
             'python-numpydoc'
             'python-astropy'
             'python-echo'
             'python-mpl-scatter-density'
             'python-pandas'
             'python-scipy'
             'python-shapely'
             'ipython')  # wheel required by new setuptools
#checkdepends=('python-pytest-mpl'
#             'python-pytest-xdist'
#              'python-astrodendro'
#              'python-dask'
#              'python-openpyxl'
#              'python-pyavm'
##              'python-qtpy'
#              'python-scikit-image'
#              'python-xlrd'
#)  # pandas echo astropy ipython shapely scipy already in makedepends, fast-histogram, matplotlib <- mpl-scatter-density; h5py <- astrodendro
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('73ae968daf31ae48c3c213685631d2e32589479e84494bf3577ab700e1225418')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
        build/lib/${_pyname/-/_}-${pkgver}-py$(get_pyver .).egg-info
    PYTHONPATH="../build/lib" make -C doc html
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#    # Costs ~10min
##   pytest -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 # || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
#    PYTHONPATH="${PWD}/build/lib" pytest -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 # || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
#}

package_python-glue-core() {
    depends=('python>=3.10'
             'python-numpy>=1.17'
             'python-matplotlib>=3.2'
             'python-scipy>=1.1'
             'python-pandas>=1.2'
             'python-echo>=0.6'
             'python-astropy>=4.0'
             'ipython>=4.0'
             'python-dill>=0.2'
             'python-h5py>=2.10'
             'python-xlrd>=1.2'
             'python-openpyxl>=3.0'
             'python-shapely>=2.0'
             'python-mpl-scatter-density>=0.8')
    optdepends=('python-glue-qt: Qt GUI of glue'
                'python-astrodendro: for dendrograms'
                'python-pyavm: for reading AVM metadata'
                'python-spectral-cube: for reading spectral cubes'
                'python-scikit-image: highly recommended and domain-independent'
                'python-glue-core-doc: Documentation for glue-core'
                'glueviz-doc: Documentation for glueviz')
    cd "${srcdir}/${_pyname}-${pkgver}"

    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}

package_python-glue-core-doc() {
    pkgdesc="Documentation for Glue core library"
    cd ${srcdir}/${_pyname}-${pkgver}/doc/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
