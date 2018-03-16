# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
# Contributor: Matthew Ellison <matt+aur@arroyonetworks.com>

pkgname=pybind11
pkgver=2.2.2
pkgrel=2
pkgdesc='A lightweight header-only library to create Python bindings of existing C++ code'
arch=('any')
url='http://pybind11.readthedocs.org/'
license=('BSD')
optdepends=('python: to target bindings supporting python 3'
            'python2: to target bindings supporting python 2')
makedepends=(
    # official repositories:
        'cmake' 'python' 'python-setuptools' 'python-pytest' 'python-sphinx' 'doxygen'
    # AUR:
        'python-breathe'
)
checkdepends=('cmake' 'python-pytest' 'python-numpy')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/pybind/pybind11/archive/v${pkgver}.tar.gz")
sha256sums=('b639a2b2cbf1c467849660801c4665ffc1a4d0a9e153ae1996ed6f21c492064e')

build () {
    msg2 'Building cmake files...'
    cd "${pkgname}-${pkgver}"
    mkdir -p build
    cd build
    cmake ..
    make mock_install
    
    msg2 'Building manpage...'
    cd "${srcdir}/${pkgname}-${pkgver}/docs"
    make man
}

# uncomment this block to run the tests
#check() {
#    cd "${pkgname}-${pkgver}"
#    python setup.py check
#    
#    mkdir -p build
#    cd build
#    make check
#}

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
