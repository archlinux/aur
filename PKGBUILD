# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-specreduce
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.5.1
pkgrel=1
pkgdesc="Astropy coordinated package for Spectroscopic Reductions"
arch=('any')
url="https://specreduce.readthedocs.io"
license=('BSD-3-Clause' 'MIT')
makedepends=('python-setuptools-scm'
             'python-build'
             'python-installer'
             'python-sphinx-astropy'
             'python-matplotlib'
             'python-photutils'
             'python-specutils'
             'python-synphot')  # wheel required by new setuptools
checkdepends=('python-pytest-astropy-header'
#             'python-pytest-xdist'
              'python-pytest-doctestplus'
              'python-pytest-remotedata')   # photutils, specutils, synphot already in makedepends
#_peiver=1.16.0
#_datcom=dcba1c6
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
#        "pypeit-${_peiver}-HeI_lines.dat::https://github.com/pypeit/PypeIt/raw/${_peiver}/pypeit/data/arc_lines/lists/HeI_lines.dat"
#        "https://archive.stsci.edu/hlsps/reference-atlases/cdbs/calspec/agk_81d266_stisnic_007.fits"
#        "https://archive.stsci.edu/hlsps/reference-atlases/cdbs/calspec/ltt9491_002.fits"
#        "${_datcom}-atm_trans_am1.0.dat::https://github.com/astropy/specreduce-data/raw/${_datcom}/specreduce_data/reference_data/extinction/atm_trans_am1.0.dat"
#        "${_datcom}-kpnoextinct.dat::https://github.com/astropy/specreduce-data/raw/${_datcom}/specreduce_data/reference_data/extinction/kpnoextinct.dat"
#        "${_datcom}-ctioextinct.dat::https://github.com/astropy/specreduce-data/raw/${_datcom}/specreduce_data/reference_data/extinction/ctioextinct.dat"
#        "${_datcom}-apoextinct.dat::https://github.com/astropy/specreduce-data/raw/${_datcom}/specreduce_data/reference_data/extinction/apoextinct.dat"
#        "${_datcom}-lapalmaextinct.dat::https://github.com/astropy/specreduce-data/raw/${_datcom}/specreduce_data/reference_data/extinction/lapalmaextinct.dat"
#        "${_datcom}-mkoextinct.dat::https://github.com/astropy/specreduce-data/raw/${_datcom}/specreduce_data/reference_data/extinction/mkoextinct.dat"
#        "${_datcom}-mthamextinct.dat::https://github.com/astropy/specreduce-data/raw/${_datcom}/specreduce_data/reference_data/extinction/mthamextinct.dat"
#        "${_datcom}-paranalextinct.dat::https://github.com/astropy/specreduce-data/raw/${_datcom}/specreduce_data/reference_data/extinction/paranalextinct.dat"
#        "${_datcom}-LTT9491.dat::https://github.com/astropy/specreduce-data/raw/${_datcom}/specreduce_data/reference_data/onedstds/snfactory/LTT9491.dat"
#        "${_datcom}-ltt9491.dat::https://github.com/astropy/specreduce-data/raw/${_datcom}/specreduce_data/reference_data/onedstds/eso/ctiostan/ltt9491.dat"
#        'doc-use-local-data.patch'
#        )
md5sums=('8ef2b518ec20bb39c2cf65b27816da27')

get_pyinfo() {
    [[ $1 == "site" ]] && python -c "import site; print(site.getsitepackages()[0])" || \
        python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    for ext in ${srcdir}/${_datcom}-*; do
#        cp ${ext} docs/${ext##*-}
#    done
#    cp ${srcdir}/*.fits docs
#    patch -Np1 -i ${srcdir}/doc-use-local-data.patch
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest --ignore=docs/_build || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 --remote-data #
}

package_python-specreduce() {
    depends=('python>=3.10'
             'python-specutils>=1.9.1')
    optdepends=('python-matplotlib'
                'python-photutils'
                'python-synphot'
                'python-specreduce-doc: Documentation for Specreduce')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 licenses/* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    rm -r ${pkgdir}/$(get_pyinfo site)/{docs,licenses}
}

package_python-specreduce-doc() {
    pkgdesc="Documentation for Python Specreduce"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 ../../licenses/* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
