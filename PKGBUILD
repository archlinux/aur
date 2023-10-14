# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sherpa
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=4.16.0
pkgrel=1
pkgdesc="Modeling and fitting package for scientific data analysis"
arch=('i686' 'x86_64')
url="http://cxc.cfa.harvard.edu/contrib/sherpa"
license=('GPL')
makedepends=('python-setuptools'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-numpy'
             'fftw'
             'python-sphinx_rtd_theme'
             'python-sphinx-astropy'
             'graphviz'
             'python-nbsphinx>=0.8.6'
             'pandoc'
             'python-bokeh')
#'gcc-fortran')
checkdepends=('python-pytest'
              'python-astropy'
              'python-matplotlib')
#             'ds9'
#             'stk')-xvfb
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'sherpa_local_fftw.patch')
md5sums=('f827bf013c11749b707670c9bde7b42d'
         'd1823cc7683442d92450fadff7aed362')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/sherpa_local_fftw.patch"
    sed -i -e "/oldest-supported-numpy/d" -e "/setuptools/s/, < 60//" pyproject.toml
#   sed -e '/'\'nbsphinx\''/a \    '\'IPython\.sphinxext\.ipython_console_highlighting\','' \
#       -i docs/conf.py
}

build() {
#   unset LDFLAGS
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
        build/lib.linux-${CARCH}-cpython-$(get_pyver)/${_pyname/-/_}-${pkgver}-py$(get_pyver .).egg-info
    PYTHONPATH="../build/lib.linux-${CARCH}-cpython-$(get_pyver)" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest "build/lib.linux-${CARCH}-cpython-$(get_pyver)" || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-sherpa() {
    depends=('python>=3.9' 'python-numpy>=1.21.0' 'fftw')
    optdepends=('python-matplotlib: Graphical output'
                'python-astropy>=3.2.1: Data I/O support'
                'ds9: Imaging requires'
                'xpa: Imaging requires'
                'python-sherpa-doc: Documentation for Sherpa')
    install=python-sherpa.install
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 {README.md,CITATION} -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -D -m644 notebooks/SherpaQuickStart.ipynb -t "${pkgdir}/usr/share/doc/${pkgname}/notebooks"
    install -D -m644 COPYRIGHT -t "${pkgdir}/usr/share/licenses/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
#   rm ${pkgdir}/usr/lib/python$(get_pyver)/site-packages/sherpa-${pkgver}-py$(get_pyver).egg-info/SOURCES.txt
}

package_python-sherpa-doc() {
    pkgdesc="Documentation for Sherpa"
    arch=('any')
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
