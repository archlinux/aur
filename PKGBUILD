# Maintainer: GrayJack <gr41.j4ck@gmail.com>

_pkgname=janet
pkgname=janet-lang
pkgver=1.17.1
pkgrel=1
pkgdesc="A dynamic Lisp dialect and bytecode vm"
arch=('arm' 'armv6h' 'armv7h' 'i686' 'x86_64' 'aarch64')
url="https://janet-lang.org/"
license=('MIT')
makedepends=('git')
provides=('janet' 'jpm')
conflicts=('janet-lang-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/janet-lang/janet/archive/v${pkgver}.tar.gz" "git+https://github.com/janet-lang/jpm#commit=cf6086a")
sha256sums=('c9357192c4d0d24f08a02aecd14df9dc52174696334e4a2576c0252c27866cb7'
            'SKIP')
options=('staticlibs')

build() {
    cd $_pkgname-$pkgver
    CFLAGS+=" -fPIC"
    LDFLAGS+=" -rdynamic"
    make PREFIX="/usr" $janet_build
    make PREFIX="/usr" build/janet.pc
    make PREFIX="/usr" docs
}

package() {
    cd $_pkgname-$pkgver

    install -Dt       "${pkgdir}"/usr/bin build/janet
    install -Dm644 -t "${pkgdir}"/usr/include/janet build/janet.h

    install -Dm644 -t "${pkgdir}"/usr/lib build/libjanet.a build/libjanet.so
    ln -s libjanet.so "${pkgdir}"/usr/lib/libjanet.so.$pkgver

    install -Dm644 "build/janet.pc" "${pkgdir}"/usr/lib/pkgconfig/janet.pc

    install -Dm644 -t "${pkgdir}"/usr/share/man janet.1

    install -dm755 "${pkgdir}"/usr/share/janet
    cp -a examples "${pkgdir}"/usr/share/janet

    install -Dm644 build/doc.html "${pkgdir}"/usr/share/doc/janet/doc.html
    install -Dm644 -t "${pkgdir}"/usr/lib/janet tools/.keep

    cd "${srcdir}/jpm"

    install -Dt       "${pkgdir}"/usr/bin jpm/jpm
    install -Dm644 -t "${pkgdir}"/usr/lib/janet/jpm jpm/*.janet
    install -Dm644 -t "${pkgdir}"/usr/share/man jpm.1
    install -Dm644 -t "${pkgdir}"/usr/share/janet/jpm/configs configs/*
    install -m644 -T configs/linux_config.janet "${pkgdir}"/usr/lib/janet/jpm/default-config.janet
}
