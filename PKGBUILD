# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sherpa
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=4.16.1
pkgrel=1
pkgdesc="Modeling and fitting package for scientific data analysis"
arch=('i686' 'x86_64')
url="http://cxc.cfa.harvard.edu/contrib/sherpa"
license=('GPL-3.0-or-later')
makedepends=('python-setuptools'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-numpy'
             'fftw'
             'python-sphinx_rtd_theme'
             'python-sphinx-astropy'
             'python-matplotlib'
             'graphviz'
             'python-nbsphinx>=0.8.6'
             'pandoc'
             'python-bokeh')
#'gcc-fortran')
#checkdepends=('python-pytest-xdist'
#              'python-astropy'
#              'python-matplotlib')
#             'ds9'
#             'stk')-xvfb   # bokeh already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
#       "sherpa-test-data-${pkgver}.tar.gz::https://github.com/sherpa/sherpa-test-data/archive/refs/tags/${pkgver}.tar.gz"
        'sherpa_local_fftw.patch')
md5sums=('9a9f55d53c2f345ba82018e66d6d09c2'
         'd1823cc7683442d92450fadff7aed362')

#get_pyver() {
#    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
#}

get_pyinfo() {
     [[ $1 == "site" ]] && python -c "import site; print(site.getsitepackages()[0])" || \
             python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    patch -Np1 -i "${srcdir}/sherpa_local_fftw.patch"
    rm -r extern/fftw-*
    sed -i -e '/^import\ setuptools/c from setuptools import setup' -e '/distutils/d' setup.py
    sed -i -e '/setuptools.command/s/^#\ //' -e '/distutils/d' helpers/__init__.py
    sed -i -e "/^sherpa_inc/s/]/, numpy.get_include()]/" \
           -e '/^from/a import numpy' helpers/extensions/__init__.py
#   sed -e '/'\'nbsphinx\''/a \    '\'IPython\.sphinxext\.ipython_console_highlighting\','' \
#       -i docs/conf.py
}

build() {
#   unset LDFLAGS
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation --skip-dependency-check
    cp build/{lib/python$(get_pyinfo .)/site-packages/*.so,lib.linux-${CARCH}-cpython-$(get_pyinfo)}

    msg "Building Docs"
    ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
        build/lib.linux-${CARCH}-cpython-$(get_pyinfo)/${_pyname/-/_}-${pkgver}-py$(get_pyinfo .).egg-info
    PYTHONPATH="../build/lib.linux-${CARCH}-cpython-$(get_pyinfo)" make -C docs html
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#    # Take more than 10 min
#    PYTHONPATH="${srcdir}/sherpa-test-data-${pkgver}" pytest --pyargs "build/lib.linux-${CARCH}-cpython-$(get_pyinfo)/sherpa" --runslow --runzenodo -vv -l -ra --color=yes -o console_output_style=count #|| warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count --dist=loadgroup -n auto
#}

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
    mv ${pkgdir}/{usr/*.so,$(get_pyinfo site)}
#   rm ${pkgdir}/usr/lib/python$(get_pyver)/site-packages/sherpa-${pkgver}-py$(get_pyver).egg-info/SOURCES.txt
}

package_python-sherpa-doc() {
    pkgdesc="Documentation for Sherpa"
    arch=('any')
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
