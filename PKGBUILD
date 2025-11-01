# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-astroscrappy
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.3.0
pkgrel=1
pkgdesc="Speedy Cosmic Ray Annihilation Package in Python"
arch=('i686' 'x86_64')
url="https://astroscrappy.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm>=6.2'
             'cython'
             'python-build'
             'python-installer'
             'python-extension-helpers>=1'
             'python-numpy>=2.0.0'
             'python-sphinx-astropy')  # wheel required by new setuptools
checkdepends=('python-pytest-doctestplus'
#             'python-pytest-xdist'
              'python-astropy'
              'python-scipy')
source=("https://files.pythonhosted.org/packages/source/a/astroscrappy/astroscrappy-${pkgver}.tar.gz"
        'setup.cfg')
md5sums=('bd0c78bc649d54a01548d437031ead5e'
         '60e14b6062e639028bf12059193ae884')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    cat ${srcdir}/setup.cfg >> setup.cfg
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
#   CFLAGS="${CFLAGS} -std=gnu17" python -m build --wheel --no-isolation --skip-dependency-check
    python -m build --wheel --no-isolation --skip-dependency-check

    msg "Building Docs"
    PYTHONPATH="../build/lib.linux-${CARCH}-cpython-$(get_pyver)" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest "build/lib.linux-${CARCH}-cpython-$(get_pyver)" || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-astroscrappy() {
    depends=('python>=3.10' 'python-astropy')
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
