# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-spectral-cube
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.6.5
pkgrel=1
pkgdesc="Library for reading and analyzing astrophysical spectral data cubes"
arch=('any')
url="http://spectral-cube.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-sphinx-astropy'
             'python-dask'
             'python-radio_beam'
             'python-casa-formats-io')  # astropy <- radio_beam
#checkdepends=('python-pytest-astropy-header'
#              'python-joblib'
#              'python-reproject'
#              'python-six'
#              'python-bottleneck'
#              'python-zarr'
#              'python-aplpy'
#              'python-pvextractor'
#              'python-regions'
#              'python-yt'
#              'python-glue-qt'
#              'qt5-svg')
# dask radio_beam 'python-casa-formats-io' already in makedepends; matplotlib <- aplpy, glue(also scipy), pvextractor...
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('9088a0db1f7fddf3a79d799abc14bae2')

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

#check() {  # Circular deps
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    pytest -vv -l -ra --color=yes -o console_output_style=count \
##        --deselect=spectral_cube/tests/test_io.py::test_3d_beams_roundtrip[True] \
##        --deselect=spectral_cube/tests/test_io.py::test_4d_beams_roundtrip[True] \
##        --deselect=spectral_cube/tests/test_spectral_cube.py::test_read_write_rountrip[True] || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
#}

package_python-spectral-cube() {
    depends=('python-numpy>=1.8' 'python-astropy>=4.0' 'python-radio_beam>=0.3.3' 'python-joblib' 'python-dask' 'python-six' 'python-casa-formats-io')
    optdepends=('python-scipy: Used for subcube creation'
                'python-bottleneck: Speeds up median and percentile operations on cubes with missing data'
                'python-regions>=0.7: Serialises/Deserialises DS9/CRTF region files and handles them. Used when extracting a subcube from region'
                'python-spectral-cube-doc: Documentation for spectral-cube'
                'python-fsspec: Used for storing computations to disk when using the dask-enabled classes'
                'python-zarr: Used for storing computations to disk when using the dask-enabled classes')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-spectral-cube-doc() {
    pkgdesc="Documentation for Python Radio Beam module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.rst
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
