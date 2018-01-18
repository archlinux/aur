# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
# Contributor: Matthew Ellison <matt+aur@arroyonetworks.com>

pkgname=pybind11
pkgver=2.2.1
pkgrel=3
pkgdesc='A lightweight header-only library to create Python bindings of existing C++ code'
arch=('any')
url='http://pybind11.readthedocs.org/'
license=('BSD')
optdepends=('python: to target bindings supporting python 3'
            'python2: to target bindings supporting python 2')
makedepends=(
    # official repositories:
        'python' 'python-setuptools' 'python-sphinx' 'doxygen'
    # AUR:
        'python-breathe'
)
checkdepends=('cmake' 'python-pytest' 'python-numpy')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/pybind/pybind11/archive/v${pkgver}.tar.gz"
        'pybind11-numpy1.14-fix.patch')
sha256sums=('f8bd1509578b2a1e7407d52e6ee8afe64268909a1bbda620ca407318598927e7'
            '6b797fcb9c3f8a121bbfc7ff005e3573d80630fcc12f4231fb388f1c5ba1f736')

prepare() {
    cd "${pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/pybind11-numpy1.14-fix.patch"
}

build () {
    cd "${pkgname}-${pkgver}/docs"
    make man
}

check() {
    cd "${pkgname}-${pkgver}"
    python setup.py check
    mkdir build
    cd build
    cmake ..
    make check
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install_headers --install-dir "${pkgdir}/usr/include/${pkgname}"
    
    # cmake files
    mkdir -p "${pkgdir}/usr/share/cmake/${pkgname}"
    cd build/mock_install/share/cmake/pybind11
    install -m644 *.cmake "${pkgdir}/usr/share/cmake/${pkgname}"
    
    # manpage
    cd "${srcdir}/${pkgname}-${pkgver}/docs/.build/man"
    install -D -m644 "${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
    gzip -9 -n -f "${pkgdir}/usr/share/man/man1/${pkgname}.1"
    
    # license
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
