# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-ci_watson
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python-${_pyname}-doc")
pkgver=0.5
pkgrel=1
pkgdesc="CI helper for STScI Jenkins"
arch=('i686' 'x86_64')
url="https://ci_watson.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm' 'python-pytest' 'python-sphinx_rtd_theme' 'python-numpydoc' 'python-sphinx-automodapi')
#checkdepends=('python-pytest-astropy-header')
source=("https://github.com/spacetelescope/${_pyname}/archive/${pkgver}.tar.gz")
md5sums=('b229fcdf7d74e8f7217945a8d83efc08')

prepare() {
    export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

    msg "Building Docs"
    python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test
#   pytest
}

package_python-ci_watson() {
    depends=('python>=3.5' 'python-pytest>=3')
    optdepends=('python-ci_watson-doc: Documentation for CI Watson')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.md
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-ci_watson-doc() {
    pkgdesc="Documentation for CI Watson"
    cd ${srcdir}/${_pyname}-${pkgver}/build/sphinx

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE.md
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
