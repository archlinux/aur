# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-astrodendro
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.3.1
pkgrel=1
pkgdesc="Python package for computation of astronomical dendrograms"
arch=('any')
url="https://dendrograms.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools-scm'
             'python-build'
             'python-installer'
             'python-sphinx-automodapi'
             'python-numpydoc'
             'python-matplotlib'
             'python-aplpy')  # wheel required by new setuptools
checkdepends=('python-pytest-xvfb'
              'xorg-server-xvfb'
#             'python-pytest-xdist'
              'python-h5py'
              'qt6-svg'
              'python-pyqt6') # 'python-astropy' 'python-matplotlib'
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('e64ecc4ffcc26b47f7c9401ae58d923c')

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
##   patch -Np1 -i "${srcdir}/fix-collection-py3.10.patch"
##   patch -Np1 -i "${srcdir}/fix-compability-to-numpy-1.24.patch"
##   patch -Np1 -i "${srcdir}/new-doc-building.patch"
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-astrodendro() {
    depends=('python>=3.8'
             'python-numpy>=1.24'
             'python-astropy>=5'
             'python-h5py>=3.0'
             'python-matplotlib>=3.3')
    optdepends=('python-astrodendro-doc: Documentation for astrodendro')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-astrodendro-doc() {
    pkgdesc="Documentation for Python astrodendro module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
