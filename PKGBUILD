# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Maintainer: Ista Zahn <istazahn@gmail.com>

pkgname=python-glue-core
_pyname=glue-core
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.17.1
pkgrel=1
pkgdesc="Core library for the glue multidimensional data visualization project"
arch=('any')
url="http://glueviz.org"
license=('BSD')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-sphinx-automodapi'
             'python-sphinx-book-theme'
             'python-numpydoc'
             'python-astropy'
             'python-echo'
             'python-matplotlib'
             'python-mpl-scatter-density'
             'python-pandas'
             'python-scipy'
             'python-shapely'
             'ipython')
checkdepends=('python-pytest-mpl'
              'python-astrodendro'
              'python-dask'
              'python-openpyxl'
              'python-pyavm'
              'python-scikit-image'
              'python-xlrd')  # matplotlib pandas echo astropy ipython shapely scipy already in makedepends, fast-histogram <- mpl-scatter-density; h5py <- astrodendro
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('5e894e7896cec315521f148e1d8b4c13a1fd0ddf5a1b5790c4c3ae27db0de2bd')

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

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-glue-core() {
    cd "${srcdir}/${_pyname}-${pkgver}"
    depends=('python>=3.8'
             'python-numpy>=1.17'
             'python-matplotlib>=3.2'
             'python-scipy>=1.1'
             'python-pandas>=1.2'
             'python-echo>=0.6'
             'python-astropy>=4.0'
             'python-setuptools>=30.3.0'
             'ipython>=4.0'
             'python-dill>=0.2'
             'python-h5py>=2.10'
             'python-xlrd>=1.2'
             'python-openpyxl>=3.0'
             'python-pvextractor>=0.2'
             'python-shapely>=2.0'
             'python-mpl-scatter-density>=0.7')
    optdepends=('python-glue-qt: Qt GUI of glue'
                'python-astrodendro: for dendrograms'
                'python-pyavm: for reading AVM metadata'
                'python-spectral-cube: for reading spectral cubes'
                'python-scikit-image: highly recommended and domain-independent'
                'python-glue-core-doc: Documentation for glue-core'
                'glueviz-doc: Documentation for glueviz')

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
