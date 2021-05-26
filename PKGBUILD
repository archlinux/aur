# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-astroscrappy-git
_gitname=astroscrappy
pkgname=("python-${_gitname}-git" "python-${_gitname}-doc-git")
pkgver=1.0.8.r74.g631ae4d
pkgrel=1
pkgdesc="Speedy Cosmic Ray Annihilation Package in Python"
arch=('i686' 'x86_64')
url="https://astroscrappy.readthedocs.io"
license=('MIT')
makedepends=('git' 'python-setuptools-scm' 'cython' 'python-extension-helpers' 'python-astropy' 'python-sphinx-astropy')
checkdepends=('python-pytest-doctestplus' 'python-scipy')
source=("git+https://github.com/astropy/astroscrappy")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"

    ( set -o pipefail
      git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    export _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
}

build() {
    cd ${srcdir}/${_gitname}
    python setup.py build

    msg "Building Docs"
    cd ${srcdir}/${_gitname}/docs
    PYTHONPATH="../build/lib.linux-${CARCH}-${_pyver}" make html
}

check() {
    cd ${srcdir}/${_gitname}

    ls "build/lib.linux-${CARCH}-${_pyver}"
    PYTHONPATH="build/lib.linux-${CARCH}-${_pyver}" pytest "build/lib.linux-${CARCH}-${_pyver}"
}

package_python-astroscrappy-git() {
    depends=('python>=3.6' 'python-astropy' 'cython>=0.21')
    optdepends=('python-astroscrappy-doc: Documentation for Astro-SCRAPPY')
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}")
    cd ${srcdir}/${_gitname}

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    install -Dm644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-astroscrappy-doc-git() {
    pkgdesc="Documentation for Astro-SCRAPPY"
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}")
    cd ${srcdir}/${_gitname}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../licenses/*
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
