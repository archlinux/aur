# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-casa-formats-io
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.2.2
pkgrel=1
pkgdesc="Code to handle I/O from/to data in CASA format Resources"
arch=('i686' 'x86_64')
url="https://casa-formats-io.readthedocs.io"
license=('custom:LGPL2')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-numpy'
             'python-numpydoc'
             'python-sphinx-automodapi'
             'python-dask'
             'python-astropy')
checkdepends=('python-pytest-openfiles')  # astropy and dask already in makedepends. glue-core for pdepend. doctestplus will die for no glue-core
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('21396ea840b70cbb25debd6a77af23f9')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i "/casa_io_formats.image_to_dask/s/_io_formats/_formats_io/" docs/index.rst
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../build/lib.linux-${CARCH}-cpython-$(get_pyver)" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest "build/lib.linux-${CARCH}-cpython-$(get_pyver)" || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-casa-formats-io() {
    depends=('python>=3.8' 'python-astropy>=4.0' 'python-dask>=2.0')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-casa-formats-io-doc() {
    pkgdesc="Documentation for CASA Formats I/O"
    arch=('any')
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 ../../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
