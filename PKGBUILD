# Maintainer: GrayJack <gr41.j4ck@gmail.com>

_pkgname=janet
pkgname=janet-lang-git
pkgver=1.13.1.r2604.392d5d51
pkgrel=1
pkgdesc="A dynamic Lisp dialect and bytecode vm"
arch=('arm' 'armv6h' 'armv7h' 'i686' 'x86_64' 'aarch64')
url="https://janet-lang.org/"
license=('MIT')
depends=()
makedepends=('git')
provides=('janet')
conflicts=('janet-lang')
source=("git+https://github.com/janet-lang/janet.git")
sha256sums=('SKIP')
options=('staticlibs')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    # Get the version number.
    printf "$(grep 'JANET_VERSION '  src/conf/janetconf.h|head -n1|cut -d\" -f2|cut -d\- -f1).r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    CFLAGS+=" -fPIC"
    LDFLAGS+=" -rdynamic"
    make PREFIX="/usr" $janet_build
    make PREFIX="/usr" build/janet.pc
    make PREFIX="/usr" docs
}

package() {
    cd "${srcdir}/${_pkgname}"

    install -Dt       "${pkgdir}"/usr/bin build/janet jpm
    install -Dm644 -t "${pkgdir}"/usr/include/janet src/include/janet.h src/conf/janetconf.h

    install -Dm644 -t "${pkgdir}"/usr/lib build/libjanet.a build/libjanet.so
    ln -s libjanet.so "${pkgdir}"/usr/lib/libjanet.so.$pkgver

    install -Dm644 "build/janet.pc" "${pkgdir}"/usr/lib/pkgconfig/janet.pc

    install -Dm644 -t "${pkgdir}"/usr/share/man janet.1 jpm.1

    install -dm755 "${pkgdir}"/usr/share/janet
    cp -a examples "${pkgdir}"/usr/share/janet

    install -Dm644 build/doc.html "${pkgdir}"/usr/share/doc/janet/doc.html
    install -Dm644 -t "${pkgdir}"/usr/lib/janet tools/.keep
}
