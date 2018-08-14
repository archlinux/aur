# Maintainer: Marcel Röthke <marcel.roethke@haw-hamburg.de>

pkgname=rtrlib
pkgver=0.5.0
pkgrel=2
pkgdesc="RPKI-RTR client library"
arch=(x86_64 i686)
url="https://github.com/rtrlib/rtrlib"
license=('MIT')
depends=(libssh)
makedepends=(cmake chrpath)
checkdepends=(cmocka)
options=(strip)
source=("rtrlib-$pkgver.tar.gz::https://github.com/rtrlib/rtrlib/archive/v$pkgver.tar.gz")
md5sums=(3500630ad1f143c28b6f29167036893b)

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
    chrpath -d ${pkgdir}/usr/bin/{rtrclient,cli-validator}
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
