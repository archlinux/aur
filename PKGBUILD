# Maintainer: GrayJack <gr41.j4ck@gmail.com>

_pkgname=janet
pkgname=janet-lang
pkgver=1.7.0
pkgrel=3
pkgdesc="A dynamic Lisp dialect and bytecode vm"
arch=('armv6h' 'armv7h' 'i686' 'x86_64' 'aarch64')
url="https://janet-lang.org/"
license=('MIT')
depends=()
makedepends=('git' 'clang')
provides=('janet')
conflicts=('janet-lang-git')
source=("https://github.com/janet-lang/janet/archive/v${pkgver}.tar.gz")
sha256sums=('2a119f3a79b209a858864e73ca3efda57ac044df3c89762a31480bbea386d2a3')

janet_build='JANET_BUILD=\"f7ee8bd\"'

# janet_build() {
#     printf 'JANET_BUILD=\"%s\"' "$(git rev-parse --short HEAD)"
# }

#prepare() {
#    cd "${srcdir}/${_pkgname}-${pkgver}"
#}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make PREFIX="/usr" CC=clang $janet_build -j7
    make PREFIX="/usr" build/janet.pc
    make PREFIX="/usr" docs
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"


    install -dm 644 "${pkgdir}/usr/lib/janet"
    install -Dm 755 "build/janet" "${pkgdir}/usr/bin/janet"
    install -Dm 755 "auxbin/jpm" "${pkgdir}/usr/bin/jpm"
    install -Dm 644 "src/include/janet.h" "${pkgdir}/usr/include/janet/janet.h"
    install -Dm 644 "src/conf/janetconf.h" "${pkgdir}/usr/include/janet/janetconf.h"
    install -Dm 644 "build/libjanet.so" "${pkgdir}/usr/lib/libjanet.so.${_pkgver}"
    install -Dm 644 "build/libjanet.a" "${pkgdir}/usr/lib/libjanet.a"
    install -Dm 644 "janet.1" "${pkgdir}/usr/share/man/janet.1"
    install -Dm 644 "jpm.1" "${pkgdir}/usr/share/man/jpm.1"
    install -Dm 644 "build/janet.pc" "${pkgdir}/usr/lib/pkgconfig/janet.pc"

    install -dm 644 "${pkgdir}/usr/share/janet"
    cp -a examples "${pkgdir}/usr/share/janet"
    cp -a build/doc.html "${pkgdir}/usr/share/janet"
}
