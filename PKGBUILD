# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-galpy
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
_torus_commit="b7bf7965db8c3b2034d6a92f5a1c1fefe13e0e5d"
pkgver=1.8.1
# not update to 1.8.2: galpyWarning: libgalpy C extension module not loaded, because of error '/usr/lib/python3.10/site-packages/libgalpy.cpython-310-x86_64-linux-gnu.so: undefined symbol: GOMP_loop_nonmonotonic_dynamic_start'
pkgrel=2
pkgdesc="Galactic Dynamics in python"
arch=('i686' 'x86_64')
url="https://www.galpy.org"
license=('BSD')
makedepends=('python-setuptools' 'gsl'
             'python-wheel'
             'python-build'
             'python-installer')
#checkdepends=('python-pytest'
#              'python-astropy'
#              'python-scipy'
#              'python-matplotlib')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "torus-200307.tar.gz::https://github.com/jobovy/Torus/archive/${_torus_commit}.tar.gz")
md5sums=('02926db04ece780d713e5ef979cae769'
         'f84f68196975d1efbac800b1a5703c45')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
#   cd ${srcdir}/${_pyname}-${pkgver}/${_pyname}/snapshot
    cd ${srcdir}/${_pyname}-${pkgver}

    mv ${srcdir}/{Torus-${_torus_commit},${_pyname}-${pkgver}/galpy/actionAngle/actionAngleTorus_c_ext/torus}
    sed -i 's/numpy.float)/numpy.float64)/' galpy/util/leung_dop853.py
#   sed -i "/directnbody/s/directnbody/.directnbody/" Snapshot.py
#   sed -i "/from\ Snapshot/s/Snapshot/.Snapshot/" snapshotMovies.py
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   python setup.py build_docs
}

#check() {
#    takes a lot of time
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    PYTHONPATH="build/lib.linux-${CARCH}-cpython-$(get_pyver):${PYTHONPATH}" pytest -vv --color=yes \
#        --ignore=tests/test_amuse.py \
#        --ignore=tests/test_snapshotpotential.py \
#        --ignore=tests/test_sphericaldf.py
##   nosetests
#}

package_python-galpy() {
    depends=('python-packaging' 'python-scipy' 'python-matplotlib')
    optdepends=('python-galpy-doc: Documentation for galpy'
                'gsl>=1.14: For some advanced features'
                'python-astropy: For Quantity support'
                'python-astroquery: For the Orbit.from_name initialization method'
                'python-numexpr: For or plotting arbitrary expressions of Orbit quantities'
                'python-numba: for speeding up the evaluation of certain functions when using C orbit integration'
                'python-jax: For use of constant-anisotropy DFs in galpy.df.constantbetadf'
                'python-tqdm: For displaying a progress bar for certain operations (e.g., orbit integration of multiple objects at once'
                'python-pynbody: Foruse of SnapshotRZPotential and InterpSnapshotRZPotential')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README* -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-galpy-doc() {
#    pkgdesc="Documentation for Python Radio Beam module"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
