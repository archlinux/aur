# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-einsteinpy-git
_gitname=einsteinpy
pkgname=("python-${_gitname}-git" "python-${_gitname}-doc-git")
pkgver=0.1.0.r515.g0f78cb7
pkgrel=1
pkgdesc="Python package for General Relativity"
arch=('i686' 'x86_64')
url="https://einsteinpy.org/"
license=('MIT')
makedepends=('git' 'python-setuptools' 'python-nbsphinx' 'pandoc' 'graphviz')
checkdepends=('python-pytest' 'python-matplotlib' 'python-sympy' 'python-plotly' 'python-astropy' 'python-numba')
source=("git+https://github.com/einsteinpy/einsteinpy")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"

    ( set -o pipefail
      git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd ${srcdir}/${_gitname}
    python setup.py build

    msg "Building Docs"
    PYTHONPATH="build/lib" python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_gitname}

    PYTHONPATH="build/lib" pytest
}

package_python-einsteinpy-git() {
    depends=('python>=3.5' 'python-astropy' 'python-matplotlib' 'python-plotly' 'python-sympy')
    optdepends=('python-einsteinpy-doc: Documentation for EinsteinPy')
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}")
    cd ${srcdir}/${_gitname}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-einsteinpy-doc-git() {
    pkgdesc="Documentation for EinsteinPy"
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}")
    cd ${srcdir}/${_gitname}/build/sphinx

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../COPYING
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
