# Maintainer: japm48 <japm48gh@gmail.com>
# Adapted from official PKGBUILD in Community repo

_pkgname=pybind11
pkgname=${_pkgname}-git

provides=($_pkgname)
conflicts=($_pkgname)

pkgver=v2.7.0.r22.gdcbda8d7
pkgrel=1

_repo=pybind/$_pkgname

pkgdesc='pybind11 (git version)'
arch=('any')
url='https://pybind11.readthedocs.org/'
license=('BSD')

optdepends=('python: for python bindings')
makedepends=('git' 'cmake' 'boost' 'eigen' 'python' 'python-setuptools' 'python-pytest')

checkdepends=('python-numpy' 'python-scipy')

source=("git+https://github.com/${_repo}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
    cd "${_pkgname}"
    python setup.py build

    # tests
    cmake \
        -B "${srcdir}/build-cmake" \
        -S "${srcdir}/${_pkgname}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    make -C "${srcdir}/build-cmake" all mock_install

}

check() {
    make -C build-cmake check
}

package() {
    cd "${_pkgname}"
    python setup.py install --root="$pkgdir" --skip-build --optimize='1'

    # symlinks
    local _pyver
    _pyver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    install -d -m755 "${pkgdir}/usr"/{include,lib/cmake}
    ln -s "../lib/python${_pyver}/site-packages/pybind11/include/pybind11" "${pkgdir}/usr/include/pybind11"
    ln -s "../../lib/python${_pyver}/site-packages/pybind11/share/cmake/pybind11" "${pkgdir}/usr/lib/cmake/pybind11"

    # man page
    # install -D -m644 "docs/.build/man/${_pkgname}.1" "${pkgdir}/usr/share/man/man7/${_pkgname}.7"
    # sed -i '/^\.TH/s/"1"/"7"/' "${pkgdir}/usr/share/man/man7/${_pkgname}.7"

    # license
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

