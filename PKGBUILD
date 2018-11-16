# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Matthew Ellison <matt+aur@arroyonetworks.com>

pkgname=pybind11
pkgver=2.2.4
pkgrel=3
pkgdesc='A lightweight header-only library that exposes C++ types in Python and vice versa'
arch=('any')
url='https://pybind11.readthedocs.org/'
license=('BSD')
optdepends=('python: to target bindings supporting python 3'
            'python2: to target bindings supporting python 2')
makedepends=(
    # official repositories:
        'cmake' 'python' 'python-setuptools' 'python-pytest' 'python-sphinx' 'doxygen'
        'python2' 'python2-setuptools'
    # AUR:
        'python-breathe'
)
checkdepends=('boost' 'eigen' 'python-pytest' 'python-numpy' 'python-scipy')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/pybind/pybind11/archive/v${pkgver}.tar.gz")
sha256sums=('b69e83658513215b8d1443544d0549b7d231b9f201f6fc787a2b2218b408181e')

prepare() {
    cp -a "${pkgname}-${pkgver}" "${pkgname}-${pkgver}-py2"
}

build () {
    printf '%s\n' '  -> Building Python3 modules...'
    cd "${pkgname}-${pkgver}"
    python setup.py build
    
    printf '%s\n' '  -> Building Python2 modules...'
    cd "${srcdir}/${pkgname}-${pkgver}-py2"
    python2 setup.py build
    
    printf '%s\n' '  -> Building cmake files...'
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    cmake ..
    make mock_install
    
    printf '%s\n' '  -> Building manpage...'
    cd "${srcdir}/${pkgname}-${pkgver}/docs"
    make man
}

check() {
    cd "${pkgname}-${pkgver}"
    python setup.py check
    
    mkdir -p build
    cd build
    make check
}

package() {
    local _pythonver
    _pythonver="$(python -c 'import sys; print("%s.%s" %sys.version_info[0:2])')"
    
    # python modules
    cd "${pkgname}-${pkgver}"
    python setup.py install_lib --install-dir="${pkgdir}/usr/lib/python${_pythonver}/site-packages" --optimize='1'
    
    # python2 modules
    cd "${srcdir}/${pkgname}-${pkgver}-py2"
    python2 setup.py install_lib --install-dir="${pkgdir}/usr/lib/python2.7/site-packages" --optimize='1'
    
    # C++ headers
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install_headers --install-dir="${pkgdir}/usr/include/${pkgname}"
    
    # cmake files
    mkdir -p "${pkgdir}/usr/share/cmake/${pkgname}"
    cd build/mock_install/share/cmake/pybind11
    install -m644 *.cmake "${pkgdir}/usr/share/cmake/${pkgname}"
    
    # manpage
    cd "${srcdir}/${pkgname}-${pkgver}/docs/.build/man"
    install -D -m644 "${pkgname}.1" -t "${pkgdir}/usr/share/man/man1"
    
    # license
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
