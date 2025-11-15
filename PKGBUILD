# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-spectral-cube
_pname=${pkgbase#python-}
_pyname=${_pname//-/_}
pkgname=("python-${_pname}" "python-${_pname}-doc")
pkgver=0.6.7
pkgrel=1
pkgdesc="Library for reading and analyzing astrophysical spectral data cubes"
arch=('any')
url="http://spectral-cube.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm'
             'python-build'
             'python-installer'
             'python-sphinx-astropy'
#            'python-matplotlib'
             'python-dask'
             'python-radio_beam'
             'python-tqdm'
             'python-casa-formats-io')  # wheel required by new setuptools, astropy <- radio_beam
#checkdepends=('python-pytest-astropy-header'
#              'python-pytest-doctestplus'
#              'python-pytest-xvfb'
#              'xorg-server-xvfb'
#              'python-joblib'
#              'python-matplotlib'
#               'python-reproject'
#               'python-bottleneck'
##              'python-zarr<3'
#               'python-aplpy'
#               'python-pvextractor'
#               'python-regions'
#               'python-yt'
#               'python-glue-qt'
#               'qt6-declarative'
#               'qt6-svg'
#)
# dask radio_beam tqdm 'python-casa-formats-io' already in makedepends; matplotlib <- aplpy, glue(also scipy), pvextractor...
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('96e349422f1bd5a89ff0412abce72265')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -e 's/glue.viewers.image.qt/glue_qt.viewers.image/' \
        -e "s/glue.app.qt/glue_qt.app/" -i ${_pyname}/spectral_cube.py
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
##   for _tpy in $(find spectral_cube -name 'test_*.py'); do
##       echo -e "\n\n\n============================= ${_tpy} ===============================\n\n\n"
##       pytest -vv -l -ra --color=yes -o console_output_style=count ${_tpy}
##   done
#    # No space left on device
#    pytest -vv -l -ra --color=yes -o console_output_style=count \
#        --deselect=spectral_cube/tests/test_dask.py::test_lazy_data_loading
##       spectral_cube/tests/test_dask.py
##       spectral_cube/tests/test_io.py
##        --deselect=spectral_cube/tests/test_io.py::test_3d_beams_roundtrip[True] \
##        --deselect=spectral_cube/tests/test_io.py::test_4d_beams_roundtrip[True] \
##        --deselect=spectral_cube/tests/test_spectral_cube.py::test_read_write_rountrip[True] || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
#}

package_python-spectral-cube() {
    depends=('python-numpy>=1.24'
             'python-astropy>=6.1'
             'python-radio_beam>=0.3.5'
             'python-joblib>=1.3'
             'python-dask>=2025.1.1'
             'python-casa-formats-io>=0.1'
             'python-packaging>=19'
             'python-setuptools>=62.3.3'
             'python-tqdm>=4.64')
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
