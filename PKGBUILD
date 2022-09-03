# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-reproject
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.9
pkgrel=1
pkgdesc="Python-based Astronomical image reprojection"
arch=('i686' 'x86_64')
url="http://reproject.readthedocs.io"
license=('BSD')
makedepends=('cython'
             'python-setuptools-scm'
             'python-extension-helpers'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-sphinx-astropy'
             'python-astropy-healpix'
             'python-scipy'
             'python-pyvo')
#            'python-mimeparse')    # numpy for package itself
checkdepends=('python-pytest-arraydiff'
              'python-pytest-astropy-header'
              'python-pytest-doctestplus'
              'python-matplotlib'
              'python-sunpy'
              'python-gwcs'
              'python-shapely')     # astropy-healpix scipy already in makedep
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('7ca84f61b5185e58c8dced85bae84356')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e "/cython/s/==/>=/" -e "/oldest-supported-numpy/d" pyproject.toml
#   sed -i "/NaNs/a \	ignore:Subclassing validator classes is not intended:DeprecationWarning" setup.cfg
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    PYTHONPATH="../build/lib.linux-${CARCH}-cpython-$(get_pyver)" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest "build/lib.linux-${CARCH}-cpython-$(get_pyver)" || warning "Tests failed"
}

package_python-reproject() {
    depends=('python>=3.8'
             'python-numpy>=1.17'
             'python-scipy>=1.3'
             'python-astropy>=4.0'
             'python-astropy-healpix>=0.6')
    optdepends=('python-shapely>=1.6: For some of the mosaicking functionality'
                'python-reproject-doc: Documentation for Reproject'
                'python-pytest-astropy: For testing')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-reproject-doc() {
    pkgdesc="Documentation for Python Reproject module"
    arch=('any')
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
