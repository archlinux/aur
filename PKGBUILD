# Maintainer: GrayJack <gr41.j4ck@gmail.com>

_pkgname=janet
pkgname=janet-lang-git
pkgver=1.17.1.r3124.8b10a5fb
pkgrel=1
pkgdesc="A dynamic Lisp dialect and bytecode vm"
arch=('arm' 'armv6h' 'armv7h' 'i686' 'x86_64' 'aarch64')
url="https://janet-lang.org/"
license=('MIT')
depends=()
makedepends=('git')
provides=('janet' 'jpm')
conflicts=('janet-lang')
source=("git+https://github.com/janet-lang/janet.git" "git+https://github.com/janet-lang/jpm" "default_config.janet")
sha256sums=('SKIP'
            'SKIP'
            '7fb56585e6027ea800920a364acd73b49205298dcf887a4ee71fb65125c4539f')
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
    make PREFIX="/usr" $janet_build -j7
    make PREFIX="/usr" build/janet.pc
    make PREFIX="/usr" docs
}

package() {
    cd "${srcdir}/${_pkgname}"

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
    install -Dm644 -t "${pkgdir}"/usr/lib/janet/jpm jpm/*
    install -Dm644 -t "${pkgdir}"/usr/share/man jpm.1
    install -Dm644 -t "${pkgdir}"/usr/share/janet/jpm/configs configs/*
    install -m644 -T "${srcdir}"/default_config.janet "${pkgdir}"/usr/lib/janet/jpm/default-config.janet
}
