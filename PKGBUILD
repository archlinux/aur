# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-h5json
_pname=${pkgbase#python-}
_pyname=hdf5-json
pkgname=("python-${_pname}" "python-${_pname}-doc")
pkgver=2.0.0
pkgrel=1
pkgdesc="Specification and tools for representing HDF5 in JSON"
arch=('any')
url="https://support.hdfgroup.org/documentation/hdf5-json/latest"
license=('LicenseRef-HDF5')
makedepends=('python-setuptools'
             'python-build'
             'python-installer'
             'python-sphinx-copybutton'
             'python-sphinx-book-theme'
             'python-myst-parser'
             'python-h5py')  # wheel required by new setuptools
checkdepends=('python-pytest'
              'python-pytz')   # numpy <- h5py
#source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
source=("https://github.com/HDFGroup/hdf5-json/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('ceb458150ade863a09acf843e474d2cd')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e 's:../../src:src:g' -e 's:"..", "..":".":' test/integ/*_test.py
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../src" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    mkdir -p test/unit/out test/integ/{h5,json}_out
    PYTHONPATH="src" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count # no xdist #
}

package_python-h5json() {
    depends=('python>=3.11' 'python-h5py>=3.10' 'python-numpy>=2.0' 'python-jsonschema>=4.4.0' 'python-pytz')
    optdepends=('python-h5json-doc: Documentation for HDF5-JSON')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-h5json-doc() {
    pkgdesc="Documentation for Python HDF5-JSON"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 ../../COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
