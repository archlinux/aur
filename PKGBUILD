# Maintainer: GrayJack <gr41.j4ck@gmail.com>

_pkgname=janet
_pkgver=1.7.0
pkgname=janet-lang-git
pkgver=1.7.0.r1679.da93a73
pkgrel=1
pkgdesc="A dynamic Lisp dialect and bytecode vm"
arch=('armv6h' 'armv7h' 'i686' 'x86_64' 'aarch64')
url="https://janet-lang.org/"
license=('MIT')
depends=()
makedepends=('git' 'clang')
provides=('janet')
conflicts=('janet-lang')
source=("git+https://github.com/janet-lang/janet.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"

    # Get the version number.
    printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    # janet_build=$(printf "JANET_BUILD=\"%s\"" "$(git rev-parse --short HEAD)")
    make PREFIX="/usr" CC=clang -j7
    make PREFIX="/usr" build/janet.pc
    make PREFIX="/usr" docs
}

package() {
    cd "${srcdir}/${_pkgname}"

    install -Dm 755 "build/janet" "${pkgdir}/usr/bin/janet"
    install -Dm 755 "auxbin/jpm" "${pkgdir}/usr/bin/jpm"
    install -Dm 644 "src/include/janet.h" "${pkgdir}/usr/include/janet/janet.h"
    install -Dm 644 "src/conf/janetconf.h" "${pkgdir}/usr/include/janet/janetconf.h"
    install -Dm 644 "build/libjanet.so" "${pkgdir}/usr/lib/libjanet.so.${_pkgver}"
    install -Dm 644 "build/libjanet.a" "${pkgdir}/usr/lib/libjanet.a"
    install -Dm 644 "janet.1" "${pkgdir}/usr/share/man/janet.1"
    install -Dm 644 "jpm.1" "${pkgdir}/usr/share/man/jpm.1"
    install -Dm 644 "build/janet.pc" "${pkgdir}/usr/lib/pkgconfig/janet.pc"

    cp -a examples ${pkgdir}/usr/share/janet
    cp -a build/doc.html ${pkgdir}/usr/share/janet
}
