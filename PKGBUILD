# Maintainer : Chris Elston chris.elston@blueyonder.co.uk
# Contributor : Artem Klevtsov a.a.klevtsov@gmail.com

_pkgname=py3exiv2
pkgname=python-exiv2
pkgver=0.6.1
pkgrel=1
pkgdesc="py3exiv2 is a Python3 binding to exiv2, the C++ library for manipulation of EXIF, IPTC and XMP image metadata."
url="https://launchpad.net/py3exiv2"
arch=('i686' 'x86_64')
depends=('python>=3.7' 'boost-libs' 'exiv2')
makedepends=('boost')
license=('GPL3')
source=("http://www.py3exiv2.tuxfamily.org/releases/python3-exiv2-${pkgver}.tar.gz"
        'undefined-symbol.patch')
sha512sums=('605200f4676797c588ccb1af1514a91e76452277a71d34c3d91c6429b094fc23cf51b0d891c7bdcfa46f7e4c9f8abee639beed594c3122c5c3cea495b370a978'
            '74a36f445b1c904e07fa294ee425b8015c58b5e424ba9883345b4808b5d1903892ca7169be07f5b208019622bbc5a017e3bae7dfb3448516c04d85a22377026a')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch -p1 < ../undefined-symbol.patch
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    mkdir -p build
    g++ -O2 -o build/exiv2wrapper.os -c -fPIC -I/usr/include/python3.7m src/exiv2wrapper.cpp
    g++ -O2 -o build/exiv2wrapper_python.os -c -fPIC -I/usr/include/python3.7m src/exiv2wrapper_python.cpp
    g++ -O2 -o build/libexiv2python.so -shared build/exiv2wrapper.os build/exiv2wrapper_python.os -lboost_python3 -lexiv2
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    local site_packages="${pkgdir}/$(python -c 'from distutils.sysconfig import get_python_lib; print(get_python_lib())')"
    mkdir -p "${site_packages}/pyexiv2"
    install -D -m755 build/libexiv2python.so "${site_packages}/libexiv2python.so"
    install -D -m644 src/pyexiv2/__init__.py "${site_packages}/pyexiv2/__init__.py"
    install -D -m644 src/pyexiv2/exif.py "${site_packages}/pyexiv2/exif.py"
    install -D -m644 src/pyexiv2/iptc.py "${site_packages}/pyexiv2/iptc.py"
    install -D -m644 src/pyexiv2/metadata.py "${site_packages}/pyexiv2/metadata.py"
    install -D -m644 src/pyexiv2/preview.py "${site_packages}/pyexiv2/preview.py"
    install -D -m644 src/pyexiv2/utils.py "${site_packages}/pyexiv2/utils.py"
    install -D -m644 src/pyexiv2/xmp.py "${site_packages}/pyexiv2/xmp.py"
}
