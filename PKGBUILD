# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-asdf-astropy
_pname=${pkgbase#python-}
_pyname=${_pname/-/_}
pkgname=("python-${_pname}" "python-${_pname}-doc")
pkgver=0.2.0
pkgrel=1
pkgdesc="ASDF serialization support for astropy"
arch=('any')
url="https://github.com/astropy/asdf-astropy"
license=('BSD')
makedepends=('python-setuptools-scm' 'python-wheel' 'python-build' 'python-installer' 'python-numpy' 'python-sphinx-astropy' 'python-astropy')
checkdepends=('python-pytest-remotedata' 'python-pytest-astropy-header' 'python-scipy' 'python-asdf' 'python-asdf_coordinates_schemas')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('525b4ff0003395f36bd221372e565785')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i "/oldest-supported-numpy/d" pyproject.toml
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

    PYTHONPATH="build/lib:${PYTHONPATH}" pytest || warning "Tests failed"
}

package_python-asdf-astropy() {
    depends=('python>=3.6' 'python-asdf>=2.8.0' 'python-importlib_resources>=3' 'python-asdf_coordinates_schemas' 'python-asdf_transform_schemas>=0.2.2' 'python-packaging>=16.0')
    optdepends=('python-asdf-astropy-doc: Documentation for Python ASDF-AstroPy')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" licenses/*
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.rst
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-asdf-astropy-doc() {
    pkgdesc="Documentation for Python ASDF-AstroPy"
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../licenses/*
    install -dm755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
