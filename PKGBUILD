# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-stsci.skypac
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=1.0.7
pkgrel=1
pkgdesc="Sky matching for image mosaic"
arch=('i686' 'x86_64')
url="https://stsci-skypac.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm' 'python-pytest-runner' 'python-stwcs' 'python-stsci.imagestats' 'python-spherical_geometry>=1.2.2' 'python-stsci_rtd_theme' 'python-sphinx_rtd_theme' 'python-numpydoc' 'texlive-latexextra')
checkdepends=('python-pytest-doctestplus')
source=("https://github.com/spacetelescope/stsci.skypac/archive/${pkgver}.tar.gz")
md5sums=('ef0fa3f76ad6e647409b83033024bf60')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}/docs/source

    sed -i "/^release/c release = '${pkgver}'" conf.py
    export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
    PYTHONPATH="./build/lib" python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed"
}

package_python-stsci.skypac() {
    depends=('python>=3.5' 'python-astropy>=3.1' 'python-spherical_geometry>=1.2.2' 'python-stwcs' 'python-stsci.imagestats')
    optdepends=('python-stsci.skypac-doc: Documentation for STScI skypac')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    rm "${pkgdir}/usr/lib/python${_pyver}/site-packages/stsci/__init__.py"
    rm "${pkgdir}/usr/lib/python${_pyver}/site-packages/stsci/__pycache__"/*
}

package_python-stsci.skypac-doc() {
    pkgdesc="Documentation for STScI skypac"
    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.txt
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
