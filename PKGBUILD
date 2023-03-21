# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-astroscrappy
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.1.0
pkgrel=1
pkgdesc="Speedy Cosmic Ray Annihilation Package in Python"
arch=('i686' 'x86_64')
url="https://astroscrappy.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm'
             'cython'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-extension-helpers'
             'python-numpy'
             'python-sphinx-astropy'
             'python-astropy')
checkdepends=('python-pytest-doctestplus'
              'python-scipy') # astropy already in makedepends
source=("https://files.pythonhosted.org/packages/source/a/astroscrappy/astroscrappy-${pkgver}.tar.gz")
md5sums=('43e189d666fab2ecf476f2a569f37760')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i "/oldest-supported-numpy/d" pyproject.toml
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../build/lib.linux-${CARCH}-cpython-$(get_pyver)" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest "build/lib.linux-${CARCH}-cpython-$(get_pyver)" || warning "Tests failed" # -vv --color=yes
}

package_python-astroscrappy() {
    depends=('python' 'python-astropy')
    optdepends=('python-astroscrappy-doc: Documentation for Astro-SCRAPPY')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    install -Dm644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-astroscrappy-doc() {
    pkgdesc="Documentation for Astro-SCRAPPY"
    arch=('any')
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../licenses/*
    install -dm755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
