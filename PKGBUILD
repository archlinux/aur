# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-asdf-astropy
_pname=${pkgbase#python-}
_pyname=${_pname/-/_}
pkgname=("python-${_pname}" "python-${_pname}-doc")
pkgver=0.1.2
pkgrel=1
pkgdesc="ASDF serialization support for astropy"
arch=('any')
url="https://github.com/astropy/asdf-astropy"
license=('BSD')
makedepends=('python-setuptools-scm' 'python-sphinx-astropy' 'python-astropy')
checkdepends=('python-pytest' 'python-asdf')
#checkdepends=('python-pytest-doctestplus' 'python-pytest-remotedata' 'python-pytest-openfiles' 'python-lz4')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('4ca6d9865a96819c74f6a7b5a44fdab9')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
    cd ${srcdir}/${_pyname}-${pkgver}/docs
    PYTHONPATH="../build/lib" make html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed"
#   PYTHONPATH="build/lib:${PYTHONPATH}" pytest "build/lib" || warning "Tests failed"
}

package_python-asdf-astropy() {
    depends=('python>=3.6' 'python-asdf>=2.8.0' 'python-importlib_resources>=3' 'python-asdf_coordinates_schemas' 'python-asdf_transform_schemas' 'python-packaging>=16.0')
    optdepends=('python-asdf-astropy-doc: Documentation for Python ASDF-AstroPy')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" licenses/*
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.rst
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-asdf-astropy-doc() {
    pkgdesc="Documentation for Python ASDF-AstroPy"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../licenses/*
    install -dm755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
