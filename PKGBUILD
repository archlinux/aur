# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-tweakwcs
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.8.12
pkgrel=1
pkgdesc="A package for correcting alignment errors in WCS objects"
arch=('any')
url="https://tweakwcs.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm'
             'python-build'
             'python-installer')  # wheel required by new setuptools
checkdepends=('python-pytest-doctestplus'
#             'python-pytest-xdist'
              'python-gwcs'
              'python-spherical_geometry'
              'python-stsci.stimage'
#             'python-jwst'
              'python-sphinx')
# 'python-codecov'-cov 'python-stsci.imagestats'
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('f41bed9b27a1c43854076f66f265e258')

get_pyinfo() {
    [[ $1 == "site" ]] && python -c "import site; print(site.getsitepackages()[0])" || \
        python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
##   sed -e "/from jwst/a\    from stdatamodels.jwst.datamodels import JwstDataModel as DataModel" \
##       -e "s/jwst.datamodels.DataModel/stdatamodels.jwst.datamodels.JwstDataModel/" \
##       -e "/models = {/a \    import stdatamodels" \
##       -e "s/import DataModel,/import/" -i tweakwcs/tests/test_jwst_utils.py
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python -m build --wheel --no-isolation
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-tweakwcs() {
    depends=('python>=3.10' 'python-astropy>=5.0.4' 'python-gwcs>=0.14.0' 'python-spherical_geometry>=1.2.20' 'python-stsci.imagestats' 'python-stsci.stimage' 'python-packaging>=21.1')
    optdepends=('python-tweakwcs-doc: Documentation for tweakwcs')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    rm -r ${pkgdir}/$(get_pyinfo site)/{docs,notebooks}
}
