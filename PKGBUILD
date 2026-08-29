# Maintainer: twxt <aur@twxt.cc>
# Maintainer: Marcel Röthke <marcel.roethke@haw-hamburg.de>

pkgname=rtrlib-git
pkgver=r811.25f143e
pkgrel=1
pkgdesc="RPKI-RTR client library"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/rtrlib/rtrlib"
license=('MIT')
depends=('libssh')
makedepends=('cmake' 'git')
conflicts=('rtrlib')
provides=('rtrlib')
checkdepends=('cmocka')
options=()
source=("git+https://github.com/rtrlib/rtrlib.git")
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgname%-git}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${srcdir}/${pkgname%-git}
    cmake \
        -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
        -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_SHARED_LINKER_FLAGS:STRING="${LDFLAGS}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR:STRING=lib \
        -DCMAKE_BUILD_TYPE="RelWithDebInfo" \
        .
}

build() {
    cd ${srcdir}/${pkgname%-git}
    make
}

check() {
    cd ${srcdir}/${pkgname%-git}
    make test
}

package() {
    cd ${srcdir}/${pkgname%-git}
    make DESTDIR="${pkgdir}" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
