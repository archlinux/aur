# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-asdf
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=2.10.1
pkgrel=1
pkgdesc="A Python tool for reading and writing Advanced Scientific Data Format (ASDF) files"
arch=('any')
url="https://asdf.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-numpy>=1.10'
             'python-jsonschema<4'
             'python-yaml>=3.10'
             'python-semantic-version>=2.8'
             'python-astropy'
             'python-sphinx-astropy'
             'graphviz'
             'python-jmespath>=0.6.2'
             'python-asdf-standard>=1.0.1'
             'python-asdf_transform_schemas>=0.2.2')
checkdepends=('python-pytest-doctestplus' 'python-pytest-remotedata' 'python-pytest-openfiles' 'python-lz4')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('59f8397780fbab6e0b9b8d786bf3dc18')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
    ln -rs ${srcdir}/${_pyname}-${pkgver}/${_pyname/-/_}*egg-info \
        build/lib/${_pyname/-/_}-${pkgver}-py${_pyver}.egg-info
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    PYTHONPATH="../build/lib" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    PYTHONPATH="build/lib:${PYTHONPATH}" pytest "build/lib" || warning "Tests failed"
}

package_python-asdf() {
    depends=('python>=3.7' 'python-numpy>=1.10' 'python-jsonschema<4' 'python-yaml>=3.10' 'python-semantic-version>=2.8' 'python-jmespath>=0.6.2' 'python-packaging>=16.0' 'python-asdf-standard>=1.0.1' 'python-asdf_transform_schemas>=0.2.2')
    optdepends=('python-astropy>=3.0: Support for units, time, transform, wcs, or running the tests'
                'python-lz4>=0.10: Support for lz4 compression'
                'python-asdf-doc: Documentation for Python-ASDF'
                'python-pytest-astropy: For testing')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.rst
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-asdf-doc() {
    pkgdesc="Documentation for Python ASDF module"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
