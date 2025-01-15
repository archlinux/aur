# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-poppy
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.1.2
pkgrel=1
pkgdesc="Physical Optics Propagation in Python"
arch=('any')
url="https://poppy-optics.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm>=7.1'
             'python-build'
             'python-installer'
             'python-sphinx-astropy'
             'python-sphinx-issues'
             'python-stsci_rtd_theme'
             'python-nbsphinx'
             'python-numpydoc'
             'python-matplotlib'
             'python-astropy'
             'python-scipy'
             'pandoc')  # wheel required by new setuptools
#checkdepends=('python-pytest'
#              'python-pytest-xdist'
#              'python-numexpr'
#              'python-pyfftw'
#              'python-pyopencl'
#              'python-scikit-image'
#              'python-synphot'
#)   #   astropy, matplotlib, scipy already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('0cd54ad5f8d72d071c682971f068d6a5')

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
##   sed -i "/language\ = /s/None/'en'/" docs/conf.py
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../build/lib" make -C docs html
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    # takes long time
#    pytest -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 5 #|| warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
#}

package_python-poppy() {
    depends=('python>=3.10'
             'python-astropy>=5.1.0'
             'python-matplotlib>=3.2.0'
             'python-numexpr>=2.9.0'
             'python-scipy>=1.5.0')
    optdepends=('python-psutil: enables slightly better automatic selection of numbers of processes for multiprocess calculations'
                'python-pyfftw: speed up the FFTs used in multi-plane optical simulations'
                'python-synphot: enables the simulation of PSFs'
                'python-poppy-doc: Documentation for poppy')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-poppy-doc() {
    pkgdesc="Documentation for Python poppy"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 ../../LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
