# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-ccdproc
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=2.5.1
pkgrel=1
pkgdesc="Affiliated package for the AstroPy package for basic data reductions of CCD images"
arch=('any')
url="http://ccdproc.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-hatch-vcs'
             'python-build'
             'python-installer'
             'python-sphinx-astropy'
             'python-matplotlib'
             'python-astropy'
             'python-scipy'
             'graphviz')
##            'python-scikit-image'
##            'python-astroscrappy'
##            'python-reproject'
checkdepends=('python-pytest-astropy-header'
              'python-pytest-doctestplus'
              'python-pytest-remotedata'
#             'python-pytest-xdist'
              'python-astroscrappy'
              'python-scikit-image'
              'python-reproject'
              'python-memory-profiler') # psutil required by memory-profiler
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "${pkgver}-CHANGES.rst::https://github.com/astropy/ccdproc/raw/refs/tags/${pkgver}/CHANGES.rst"
        "${pkgver}-CITATION.rst::https://github.com/astropy/ccdproc/raw/refs/tags/${pkgver}/CITATION.rst"
        "${pkgver}-CODE_OF_CONDUCT.rst::https://github.com/astropy/ccdproc/raw/refs/tags/${pkgver}/CODE_OF_CONDUCT.rst")
#       'fix-underline-length.patch')
md5sums=('9fb9e75030b894d20e302c89634a68ff'
         '3cc3a9f8e03fba3147d351b57b105a48'
         'd32eebebfa65d99d19cc22c2b928c93c'
         'a35d0182f210d708ec29f9f73918be43')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

#   patch -Np1 -i "${srcdir}/fix-underline-length.patch"
    for rts in ${srcdir}/${pkgver}-*.rst; do ln -rs ${rts} ${rts##*-}; done
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH=".." make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-ccdproc() {
    depends=('python>=3.8' 'python-scipy' 'python-astropy>=5.0.1' 'python-scikit-image' 'python-astroscrappy>=1.1.0' 'python-reproject>=0.7')
    optdepends=('python-ccdproc-doc: Documentation for CCDPROC')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
#   install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-ccdproc-doc() {
    pkgdesc="Documentation for Python CCDPROC module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../licenses/*
    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.rst
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
