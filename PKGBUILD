# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-stpsf
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=2.1.0
pkgrel=1
pkgdesc="Creates simulated point spread functions for Space Telescopes (James Webb, Roman)"
arch=('any')
url="https://stpsf.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm>=3.4.3'
             'python-build'
             'python-installer'
             'python-sphinx-astropy'
             'python-sphinx-issues'
             'python-nbsphinx'
             'python-stsci_rtd_theme'
             'python-astroquery'
             'python-poppy'
             'python-photutils'
             'python-pysiaf'
             'pandoc'
             'graphviz')  # wheel required by new setuptools; matplotlib, scipy <- poppy
# takes long time and needs big data
#checkdepends=('python-pytest-xdist'
#              'python-pytest-timeout')   # poppy, astroquery, pysiaf, photutils
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#       "https://stsci.box.com/shared/static/kqfolg2bfzqc4mjkgmujo06d3iaymahv.gz")
md5sums=('6db148cb6f1c44b476168ba8ae111a4e')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../build/lib" make -C docs html
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    # deselect tests that may take long time
#    STPSF_PATH=${srcdir}/stpsf-data pytest -vv -l -ra --color=yes -o console_output_style=count --timeout 300 -p xdist -n 4 \
#        --deselect=stpsf/tests/test_trending.py::test_monthly_trending_plot_auto_opdtable \
#        --deselect=stpsf/tests/test_trending.py::test_monthly_trending_plot_opdtable_param \
#        --deselect=stpsf/tests/test_errorhandling.py::test_get_stpsf_data_path_invalid \
#        --deselect=stpsf/tests/test_mast_wss.py::test_load_mast_opd_larger_npix \
#        --deselect=stpsf/tests/test_nircam.py::test_coron_extra_lyot_plane \
#        --deselect=stpsf/tests/test_roman.py::test_WFI_fwhm \
#        --deselect=stpsf/tests/test_roman.py::test_WFI_filters
#}

package_python-stpsf() {
    depends=('python>=3.10'
             'python-astroquery>=0.4.6'
             'python-scipy>=1.5.0'
             'python-matplotlib>=3.2.0'
             'python-photutils>=1.10.0'
             'python-poppy>=1.0.0'
             'python-pysiaf>=0.23.3'
             'python-synphot>=1.0.0')
    optdepends=('python-stpsf-doc: Documentation for STPSF')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-stpsf-doc() {
    pkgdesc="Documentation for Python STPSF"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 ../../LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
