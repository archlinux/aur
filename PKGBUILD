# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-galpy
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
_torus_commit="b7bf7965db8c3b2034d6a92f5a1c1fefe13e0e5d"
pkgver=1.11.1
pkgrel=1
pkgdesc="Galactic Dynamics in python"
arch=('i686' 'x86_64')
url="https://www.galpy.org"
license=('BSD-3-Clause')
makedepends=('python-setuptools' 'gsl'
             'python-build'
             'python-installer')  # wheel required by new setuptools
#            'gcc14'
#checkdepends=('python-pytest-xdist'
#              'python-pytest-timeout'
#              'python-astroquery'
#              'python-numexpr'
#              'python-scipy'
#              'python-matplotlib'
#)
# shouldn't use pypi source for torus support
#source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
source=("https://github.com/jobovy/galpy/archive/refs/tags/v${pkgver}.tar.gz"
        "torus-200307.tar.gz::https://github.com/jobovy/Torus/archive/${_torus_commit}.tar.gz"
#       "${pkgver}-conftest.py::https://github.com/jobovy/galpy/raw/refs/tags/v${pkgver}/tests/conftest.py"
        'fix-gcc15.patch')
md5sums=('f8ea3d67391d2a367fb4080a4a083f07'
         'f84f68196975d1efbac800b1a5703c45'
         'fbccd08422b23ca669452dd64fae9306')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
#   cd ${srcdir}/${_pyname}-${pkgver}/${_pyname}/snapshot
    cd ${srcdir}/${_pyname}-${pkgver}

    mv ${srcdir}/{Torus-${_torus_commit},${_pyname}-${pkgver}/galpy/actionAngle/actionAngleTorus_c_ext/torus}
#   ln -s {${srcdir}/${pkgver}-,tests/}conftest.py
#   sed -i 's/numpy.float)/numpy.float64)/' galpy/util/leung_dop853.py
#   sed -i "/directnbody/s/directnbody/.directnbody/" Snapshot.py
#   sed -i "/from\ Snapshot/s/Snapshot/.Snapshot/" snapshotMovies.py
    patch -Np1 -i "${srcdir}/fix-gcc15.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
#   CC=gcc-14 CXX=g++-14 python -m build --wheel --no-isolation
#   CXXFLAGS="${CXXFLAGS} -Wno-register" python -m build --wheel --no-isolation
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   python setup.py build_docs
}

#check() {
#    # takes a lot of time
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    # No module named 'amuse' 'pynbody' 'jax'
#    PYTHONPATH="build/lib.linux-${CARCH}-cpython-$(get_pyver):${PYTHONPATH}" pytest -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 --timeout 300 \
#        --ignore=tests/test_amuse.py \
#        --ignore=tests/test_snapshotpotential.py \
#        --ignore=tests/test_sphericaldf.py \
#        --deselect=tests/test_actionAngle.py::test_actionAngleAdiabaticGrid_basicAndConserved_actions \
#        --deselect=tests/test_actionAngle.py::test_actionAngleStaeckelGrid_basicAndConserved_actions \
#        --deselect=tests/test_actionAngle.py::test_actionAngleIsochroneApprox_triaxialnfw_linear_angles \
#        --deselect=tests/test_actionAngle.py::test_actionAngleVerticalInverse_orbit_interpolation_pointtransform \
#        --deselect=tests/test_actionAngle.py::test_actionAngleVerticalInverse_wrtVertical_interpolation_pointtransform \
#        --deselect=tests/test_actionAngle.py::test_actionAngleVerticalInverse_freqs_wrtVertical_interpolation_pointtransform \
#        --deselect=tests/test_diskdf.py::test_dehnendf_cold_flat_kurtosisvt \
#        --deselect=tests/test_diskdf.py::test_dehnendf_cold_flat_skewvt \
#        --deselect=tests/test_diskdf.py::test_dehnendf_cold_powerfall_skewvt \
#        --deselect=tests/test_diskdf.py::test_dehnendf_cold_powerfall_kurtosisvt \
#        --deselect=tests/test_diskdf.py::test_dehnendf_cold_powerrise_kurtosisvt \
#        --deselect=tests/test_diskdf.py::test_dehnendf_cold_flat_oortA \
#        --deselect=tests/test_diskdf.py::test_dehnendf_cold_powerrise_oortA \
#        --deselect=tests/test_diskdf.py::test_dehnendf_cold_powerrise_srst \
#        --deselect=tests/test_dynamfric.py::test_dynamfric_c \
#        --deselect=tests/test_evolveddiskdf.py::test_mildnonaxi_vertexdev_direct \
#        --deselect=tests/test_evolveddiskdf.py::test_mildnonaxi_oortA_grid \
#        --deselect=tests/test_evolveddiskdf.py::test_elliptical_cold_oortABCK_position1 \
#        --deselect=tests/test_evolveddiskdf.py::test_elliptical_cold_oortABCK_position2 \
#        --deselect=tests/test_galpypaper.py::test_diskdf \
#        --deselect=tests/test_interp_potential.py::test_interpolation_potential_force_c \
#        --deselect=tests/test_orbit.py::test_liouville_planar \
#        --deselect=tests/test_orbit.py::test_analytic_ecc_rperi_rap \
#        --deselect=tests/test_orbit.py::test_energy_jacobi_conservation[DoubleExponentialDiskPotential--6.0--6.0-False] \
#        --deselect=tests/test_orbit.py::test_energy_jacobi_conservation[mockFlatSolidBodyRotationSpiralArmsPotential--10.0--10.0-False] \
#        --deselect=tests/test_potential.py::test_poisson_surfdens_potential \
#        --deselect=tests/test_potential.py::test_McMillan17 \
#        --deselect=tests/test_potential.py::test_Cautun20 \
#        --deselect=tests/test_potential.py::test_DehnenBinney98 \
#        --deselect=tests/test_pv2qdf.py::test_pvTvz_staeckel \
#        --deselect=tests/test_pv2qdf.py::test_pvTvz_staeckel_diffngl \
#        --deselect=tests/test_qdf.py::test_sampleV_interpolate \
#        --deselect=tests/test_quantity.py::test_streamgapdf_method_returntype \
#        --deselect=tests/test_scf.py::test_scf_compute_spherical_nbody_hernquist \
#        --deselect=tests/test_scf.py::test_scf_compute_nbody_twopowertriaxial \
#        --deselect=tests/test_streamdf.py::test_bovy14_callMargXZ \
#        --deselect=tests/test_streamdf.py::test_bovy14_callMargDPMLL \
#        --deselect=tests/test_streamdf.py::test_fardalpot_trackaa \
#        --deselect=tests/test_streamdf.py::test_fardalwmwpot_trackaa \
#        --deselect=tests/test_streamgapdf.py::test_sanders15_setup \
#        --deselect=tests/test_streamgapdf.py::test_sanders15_leading_setup \
#        --deselect=tests/test_streamgapdf.py::test_sample \
#        --deselect=tests/test_streamgapdf.py::test_sample_offset \
#        --deselect=tests/test_streamgapdf.py::test_sample_offset_leading \
#        --deselect=tests/test_streamgapdf_impulse.py::test_impulse_deltav_general_fullintegration_zeroforce \
#        --deselect=tests/test_streamspraydf.py::test_center \
#        --deselect=tests/test_FDMdynamfric.py::test_FDMDynamicalFrictionForce_central_limit #|| warning "Tests failed"
#
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
