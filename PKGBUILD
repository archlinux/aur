# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-astrodendro-git
_gitname=astrodendro
pkgname=("python-${_gitname}-git" "python-${_gitname}-doc-git")
pkgver=0.3.1.r1.gabeff7d
pkgrel=1
pkgdesc="Python package for computation of astronomical dendrograms"
arch=('any')
url="https://dendrograms.readthedocs.io"
license=('MIT')
makedepends=('python-setuptools-scm'
             'git'
             'python-build'
             'python-installer'
             'python-sphinx-automodapi'
             'python-numpydoc'
             'python-matplotlib'
             'python-aplpy')  # wheel required by new setuptools
checkdepends=('python-pytest'
              'python-h5py'
              'qt5-svg'
              'python-pyqt5') # 'python-astropy' 'python-matplotlib' by aplpy
source=("git+https://github.com/dendrograms/astrodendro")
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
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_gitname}

    pytest || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count -p xdist -n 4 #
}

package_python-astrodendro-git() {
    depends=('python' 'python-numpy>=1.24' 'python-astropy>=5' 'python-matplotlib>=3.3' 'python-h5py>=3')
    optdepends=('python-astrodendro-doc-git: Documentation for astrodendro')
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}")
    cd ${srcdir}/${_gitname}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-astrodendro-doc-git() {
    pkgdesc="Documentation for Python astrodendro module"
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}")
    cd ${srcdir}/${_gitname}/docs/_build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../LICENSE
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
