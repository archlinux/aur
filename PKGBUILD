# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgbase=python-einsteinpy-git
_gitname=einsteinpy
pkgname=("python-${_gitname}-git" "python-${_gitname}-doc-git")
pkgver=0.3.1.r72.g48a1a4a
pkgrel=1
pkgdesc="Python package for General Relativity"
arch=('any')
url="https://einsteinpy.org"
license=('MIT')
makedepends=('git'
             'python-setuptools'
             'python-wheel'
             'python-build'
             'python-installer'
             'python-numpy'
             'python-nbsphinx'
             'python-astropy'
             'python-numba'
             'python-plotly'
             'python-scipy'
             'python-sympy'
             'pandoc'
             'python-ipywidgets'
             'graphviz')
checkdepends=('python-pytest-doctestplus')
# 'python-astropy' 'python-plotly' 'python-scipy' 'python-sympy' 'python-numba' satisfied
##             'python-einsteinpy_geodesics'
source=("git+https://github.com/einsteinpy/einsteinpy")
md5sums=('SKIP')

get_pyver() {
    python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

pkgver() {
    cd "${srcdir}/${_gitname}"

    ( set -o pipefail
      git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

#prepare() {
#    cd ${srcdir}/${_gitname}
#
#    sed '/julia/s/False/True/g' -i tests/test_plotting/test_geodesic/test_interactive.py \
#        -i tests/test_plotting/test_geodesic/test_static.py -i tests/test_geodesic/test_geodesic.py
#}

build() {
    cd ${srcdir}/${_gitname}
    python -m build --wheel --no-isolation

    msg "Building Docs"
    PYTHONPATH="../build/lib" make -C docs html
}

check() {
    cd ${srcdir}/${_gitname}

    PYTHONPATH="build/lib" pytest tests || warning "Tests failed" # -vv -l -ra --color=yes -o console_output_style=count
}

package_python-einsteinpy-git() {
    depends=('python>=3.8' 'python-astropy>=5.1.1' 'python-matplotlib>=3.6.2' 'python-plotly>=5.11.0' 'python-scipy>=1.9.3' 'python-sympy>=1.11.1' 'python-numba>=0.56.3')
    optdepends=('python-einsteinpy-doc: Documentation for EinsteinPy')
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}")
    cd ${srcdir}/${_gitname}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

package_python-einsteinpy-doc-git() {
    pkgdesc="Documentation for EinsteinPy"
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}")
    cd ${srcdir}/${_gitname}/docs/build

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../../COPYING
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
}
