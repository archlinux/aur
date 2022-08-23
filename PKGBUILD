# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-specutils
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.8.0
pkgrel=1
pkgdesc="Astropy Affiliated package for 1D spectral operations"
arch=('any')
url="http://specutils.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm' 'python-wheel' 'python-build' 'python-installer' 'python-sphinx-astropy' 'python-gwcs' 'python-ndcube>=2.0' 'python-mpl-animators' 'graphviz')
checkdepends=('python-pytest-remotedata' 'python-pytest-astropy-header')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://stsci.box.com/shared/static/28a88k1qfipo4yxc4p4d40v4axtlal8y.fits"
        "https://data.sdss.org/sas/dr16/sdss/spectro/redux/26/spectra/1323/spec-1323-52797-0012.fits"
        'use_local_doc_fits_offline.patch')
#https://dr15.sdss.org/sas/dr15/manga/spectro/redux/v2_4_3/8485/stack/manga-8485-1901-LOGRSS.fits.gz
md5sums=('39cb753998d5d45bfa937488cb78bc7e'
         '6de4c8ee5659e87a302e3de595074ba5'
         '3586c5d0810108a182ba9146908dc180'
         'b527ca1f834de432631d530c937d6cd1')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    cp ${srcdir}/*.fits docs
    patch -Np1 -i "${srcdir}/use_local_doc_fits_offline.patch"
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    PYTHONPATH="../build/lib" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    # skip some tests that need lots of online data or cost lots of time
    pytest "build/lib" \
        --ignore=build/lib/specutils/io/asdf/tags/tests/test_spectra.py \
        --ignore=build/lib/specutils/io/default_loaders/tests/test_apogee.py \
        --deselect=build/lib/specutils/tests/test_loaders.py::test_ctypye_not_compliant[remote_data_path0] \
        --deselect=build/lib/specutils/tests/test_loaders.py::test_hst_cos[remote_data_path0] \
        --deselect=build/lib/specutils/tests/test_loaders.py::test_hst_cos[remote_data_path1] \
        --deselect=build/lib/specutils/tests/test_loaders.py::test_hst_stis[remote_data_path0] \
        --deselect=build/lib/specutils/tests/test_loaders.py::test_hst_stis[remote_data_path1] \
        --deselect=build/lib/specutils/tests/test_loaders.py::test_hst_stis[remote_data_path2] \
        --deselect=build/lib/specutils/tests/test_loaders.py::test_apstar_loader \
        --deselect=build/lib/specutils/tests/test_loaders.py::test_manga_cube \
        --deselect=build/lib/specutils/tests/test_loaders.py::test_manga_cube \
        --deselect=build/lib/specutils/tests/test_loaders.py::test_manga_rss \
        --deselect=build/lib/specutils/tests/test_loaders.py::test_sdss_spplate \
        --deselect=build/lib/specutils/tests/test_loaders.py::test_sdss_spspec \
        --deselect=build/lib/specutils/tests/test_loaders.py::test_sdss_compressed[gzip] \
        --deselect=build/lib/specutils/tests/test_loaders.py::test_sdss_compressed[bzip2] \
        --deselect=build/lib/specutils/tests/test_loaders.py::test_sdss_compressed[xz] \
        --deselect=build/lib/specutils/tests/test_loaders.py::TestAAOmega2dF::test_with_rwss[remote_data_path0] \
        --deselect=build/lib/specutils/tests/test_loaders.py::TestAAOmega2dF::test_without_rwss[remote_data_path0] \
        --deselect=build/lib/specutils/tests/test_loaders.py::TestAAOmega2dF::test_with_rwss_guess[remote_data_path0] \
        --deselect=build/lib/specutils/tests/test_loaders.py::TestAAOmega2dF::test_without_rwss_guess[remote_data_path0] \
        --deselect=build/lib/specutils/tests/test_loaders.py::test_apvisit_loader \
        --deselect=build/lib/specutils/tests/test_loaders.py::test_iraf_multispec_chebyshev \
        --deselect=build/lib/specutils/tests/test_loaders.py::test_iraf_multispec_legendre \
        --deselect=build/lib/specutils/tests/test_loaders.py::test_muscles_loader \
        --deselect=build/lib/specutils/tests/test_loaders.py::test_subaru_pfs_loader \
        --deselect=build/lib/specutils/tests/test_spectral_axis.py::test_create_spectral_axis || warning "Tests failed"
}

package_python-specutils() {
    depends=('python>=3.7' 'python-scipy' 'python-gwcs>=0.17.0' 'python-ndcube>=2.0')
    optdepends=('python-specutils-doc: Documentation for Specutils')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" licenses/*
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-specutils-doc() {
    pkgdesc="Documentation for Python Specutils module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../licenses/*
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
