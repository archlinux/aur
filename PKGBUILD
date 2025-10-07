# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-stsynphot
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.5.0
pkgrel=1
pkgdesc="Synthetic photometry using Astropy for HST and JWST"
arch=('any')
url="https://stsynphot.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools-scm'
             'python-build'
             'python-installer'
             'python-sphinx-astropy'
             'python-matplotlib'
             'python-synphot'
             'graphviz')  # wheel required by new setuptools
checkdepends=('python-pytest-astropy-header'
#             'python-pytest-xdist'
              'python-pytest-doctestplus'
              'python-pytest-remotedata')   # astropy <- synphot already in makedepends
#             'python-beautifulsoup4'
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://ssb.stsci.edu/cdbs/calspec/alpha_lyr_stis_011.fits")
#       "https://ssb.stsci.edu/trds/tarfiles/synphot1.tar.gz") # test data too large
md5sums=('acaac5f35f342c5f4e791d925a89cc04'
         '20d7fa5941ae02f9948b671ee75709d1')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    install -Dm644 ${srcdir}/{,grp/redcat/trds/calspec/}alpha_lyr_stis_011.fits
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    ln -rs ${srcdir}/${_pyname}-${pkgver}/src/${_pyname/-/_}*egg-info \
        build/lib/${_pyname/-/_}-${pkgver}-py$(get_pyver .).egg-info
    PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYSYN_CDBS="${srcdir}/grp/redcat/trds" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 ##--remote-data #
}

package_python-stsynphot() {
    depends=('python>=3.10'
             'python-astropy>=6'
             'python-scipy>=1.9'
             'python-synphot>=1.1'
             'python-beautifulsoup4')
    optdepends=('python-matplotlib: For plotting'
                'python-stsynphot-doc: Documentation for stsynphot')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-stsynphot-doc() {
    pkgdesc="Documentation for Python stsynphot"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
