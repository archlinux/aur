# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-drizzle
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=2.0.0
pkgrel=1
pkgdesc="A package for combining dithered images into a single image"
arch=('i686' 'x86_64')
url="https://spacetelescope-drizzle.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('python-setuptools-scm>=3.4'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-numpy>=2.0.0'
             'python-sphinx-automodapi'
             'python-pytest-doctestplus'
             'graphviz')
checkdepends=('python-pytest'
              'python-astropy')
#source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
source=("https://github.com/spacetelescope/drizzle/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('be01291867ab1d174082f82f74c5582e')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation #--skip-dependency-check

    msg "Building Docs"
    PYTHONPATH="../build/lib.linux-${CARCH}-cpython-$(get_pyver)" make -C docs html
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    mv {,_}${_pyname}
    PYTHONPATH="build/lib.linux-${CARCH}-cpython-$(get_pyver)" pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-drizzle() {
    depends=('python>=3.10'
             'python-astropy')
    optdepends=('python-drizzle-doc: Documentation for Dizzle')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-drizzle-doc() {
    pkgdesc="Documentation for Python Drizzle"
    arch=('any')
    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" ../../LICENSE.rst
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
