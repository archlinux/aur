# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-stdatamodels
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=2.1.1
pkgrel=1
pkgdesc="Core support for DataModel classes used in calibration pipelines"
arch=('any')
url="https://stdatamodels.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-sphinx-asdf'
             'python-astropy'
             'python-asdf'
             'graphviz')
checkdepends=('python-pytest-doctestplus'
#             'python-pytest-xdist'
              'python-asdf-astropy'
#             'python-jwst'
              'python-psutil'
              'python-crds')   # asdf, astropy, already in makedepends
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('18e314004b16da947f41d40bbc06b4fd')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    # Lots of tests need jwst
#   CRDS_PATH=".crds" \
    PYTHONPATH="build/lib" pytest \
        --ignore=src/stdatamodels/jwst/datamodels \
        --ignore=src/stdatamodels/jwst/_tests/test_schemas.py \
        --ignore=src/stdatamodels/jwst/transforms/converters/tests/test_models.py \
        --ignore=src/stdatamodels/jwst/transforms/extensions.py || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4
}

package_python-stdatamodels() {
    depends=('python>=3.10'
             'python-asdf>=3.1.0'
             'python-asdf_transform_schemas>=0.5.0'
             'python-asdf-astropy>=0.3.0'
             'python-astropy>=5.0.4')
    optdepends=('python-stdatamodels-doc: Documentation for STDataModel')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-stdatamodels-doc() {
    pkgdesc="Documentation for Python STDataModel"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/build

    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
