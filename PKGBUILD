# Maintainer: Marcel Röthke <marcel.roethke@haw-hamburg.de>

pkgname=rtrlib
pkgver=0.8.0
pkgrel=1
pkgdesc="RPKI-RTR client library"
arch=(x86_64 i686 aarch64)
url="https://github.com/rtrlib/rtrlib"
license=('MIT')
depends=(libssh)
makedepends=(cmake)
checkdepends=(cmocka)
options=(strip)
source=("rtrlib-$pkgver.tar.gz::https://github.com/rtrlib/rtrlib/archive/v$pkgver.tar.gz")
md5sums=('e6237318b51ea1162d9ae7b296f966c8')

prepare() {
    cd ${srcdir}/${pkgname}-${pkgver}
    cmake \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_SHARED_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR:STRING=lib \
        .
}

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make
}

check() {
    cd ${srcdir}/${pkgname}-${pkgver}
    cmake \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_SHARED_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR:STRING=lib \
        -DUNIT_TESTING=y \
        .

    make
    make test
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
