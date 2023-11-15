pkgname=pybind11-git
pkgver=v2.11.0.r55.ge250155
pkgrel=1
pkgdesc='A lightweight header-only library that exposes C++ types in Python and vice versa-git'
arch=('any')
url='https://pybind11.readthedocs.org/'
license=('BSD')
conflicts=(pybind11)
provides=(pybind11)
optdepends=('python-setuptools: for python bindings')
makedepends=('cmake' 'boost' 'catch2' 'eigen' 'python-build' 'python-installer'
             'python-setuptools' 'python-pytest' 'python-wheel')
             #'python-sphinx' 'python-sphinx_rtd_theme' 'python-breathe')
checkdepends=('python-numpy' 'python-scipy')

source=('git+https://github.com/pybind/pybind11.git'
'nopip.patch')

sha256sums=('SKIP'
            '8913d3902ee451dc9c2dd256aa8970e56c9b8854cfdf9807235226c2860c7e96')

prepare() {
  cd pybind11
   patch -p1 -i ../nopip.patch
}

pkgver() {
  cd pybind11
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
    cd pybind11
    python -m build --wheel --no-isolation
    
    # tests
    cmake \
        -G 'Unix Makefiles' \
        -B "${srcdir}/build-tests" \
        -S "${srcdir}/pybind11" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    cmake --build "${srcdir}/build-tests"
    
    # manpage (needs python-sphinxcontrib-{moderncmakedomain,svg2pdfconverter})
    # make -C "${srcdir}/${pkgname}-${pkgver}/docs" man
}

check() {
    make -C build-tests check
}

package() {
    python -m installer --destdir="$pkgdir" "pybind11/dist"/*.whl
    
    # symlinks
    local _pyver
    _pyver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    install -d -m755 "${pkgdir}/usr"/{include,lib/{cmake,pkgconfig}}
    ln -s "../lib/python${_pyver}/site-packages/pybind11/include/pybind11" "${pkgdir}/usr/include/pybind11"
    ln -s "../../lib/python${_pyver}/site-packages/pybind11/share/cmake/pybind11" "${pkgdir}/usr/lib/cmake/pybind11"
    ln -s "../../lib/python${_pyver}/site-packages/pybind11/share/pkgconfig/pybind11.pc" "${pkgdir}/usr/lib/pkgconfig/pybind11.pc"
    
    # man page
    # install -D -m644 "docs/.build/man/${pkgname}.1" "${pkgdir}/usr/share/man/man7/${pkgname}.7"
    # sed -i '/^\.TH/s/"1"/"7"/' "${pkgdir}/usr/share/man/man7/${pkgname}.7"
    
    # license
    install -D -m644 "pybind11/LICENSE" -t "${pkgdir}/usr/share/licenses/pybind11"
}

