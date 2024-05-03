# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-astroscrappy-git
_gitname=astroscrappy
pkgname=("python-${_gitname}-git" "python-${_gitname}-doc-git")
pkgver=1.2.0.r1.g0148254
pkgrel=1
pkgdesc="Speedy Cosmic Ray Annihilation Package in Python"
arch=('i686' 'x86_64')
url="https://astroscrappy.readthedocs.io"
license=('BSD-3-Clause')
makedepends=('git'
             'python-setuptools-scm>=6.2'
             'python-wheel'
             'python-build'
             'python-installer'
             'cython'
             'python-extension-helpers>=1'
             'python-numpy'
             'python-sphinx-astropy')
checkdepends=('python-pytest-doctestplus'
              'python-astropy'
              'python-scipy')
source=("git+https://github.com/astropy/astroscrappy"
        'setup.cfg')
md5sums=('SKIP'
         '60e14b6062e639028bf12059193ae884')

pkgver() {
    cd "${srcdir}/${_gitname}"

    ( set -o pipefail
      git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

prepare() {
    cd ${srcdir}/${_gitname}

    ln -rs ${srcdir}/setup.cfg .
}

build() {
    cd ${srcdir}/${_gitname}
    python -m build --wheel --no-isolation --skip-dependency-check

    msg "Building Docs"
    PYTHONPATH="../build/lib.linux-${CARCH}-cpython-$(get_pyver)" make -C docs html
}

check() {
    cd ${srcdir}/${_gitname}

    pytest "build/lib.linux-${CARCH}-cpython-$(get_pyver)" || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-astroscrappy-git() {
    depends=('python>=3.9' 'python-astropy')
    optdepends=('python-astroscrappy-doc: Documentation for Astro-SCRAPPY')
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}")
    cd ${srcdir}/${_gitname}

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
    install -Dm644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-astroscrappy-doc-git() {
    pkgdesc="Documentation for Astro-SCRAPPY"
    arch=('any')
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}")
    cd ${srcdir}/${_gitname}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../licenses/*
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
