# Maintainer: Betül Ünlü < betulunlu0018 ~at~ gmail ~dot~ com >

pkgname=emojicode
pkgver=0.8
pkgrel=1
pkgdesc="An open-source, full-blown programming language consisting of emojis"
arch=('i686' 'x86_64')
url="https://emojicode.org"
license=("custom")
depends=(
    "ncurses"
    "zlib"
)
makedepends=(
    "llvm6"
    "cmake>=3.5.1"
    "ninja"
    "gcc>=7.2"
    "python>=3.5.2"
)
checkdepends=("python>=3.5.2")
source=("${pkgname}::git+https://github.com/emojicode/emojicode#tag=v${pkgver}")
md5sums=("SKIP")

build() {
    cd "${srcdir}/${pkgname}"

    mkdir -p build
    cd build
    cmake -DdefaultPackagesDirectory=/usr/lib/emojicode .. -GNinja

    ninja
}

check() {
    read -p "Do you want to run checks? [y/N] " runchecks

    if [[ "$runchecks" == y* ]] || [[ "$runchecks" == Y* ]]; then
        cd "${srcdir}/${pkgname}/build"
        ninja tests
    fi
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd "${srcdir}/${pkgname}/build"
    ninja dist

    cd "Emojicode-${pkgver}-Linux-${CARCH}"

    install -Dm755 "emojicodec" "${pkgdir}/usr/bin/emojicodec"

    install -Dm644 "include/runtime/Runtime.h" "${pkgdir}/usr/include/emojicode/runtime/Runtime.h"
    install -Dm644 "include/s/Data.h" "${pkgdir}/usr/include/emojicode/s/Data.h"
    install -Dm644 "include/s/String.h" "${pkgdir}/usr/include/emojicode/s/String.h"

    install -Dm755 "packages/files/interface.emojii" "${pkgdir}/usr/lib/emojicode/files/interface.emojii"
    install -Dm644 "packages/files/libfiles.a" "${pkgdir}/usr/lib/emojicode/files/libfiles.a"
    install -Dm644 "packages/runtime/libruntime.a" "${pkgdir}/usr/lib/emojicode/runtime/libruntime.a"
    install -Dm755 "packages/s/interface.emojii" "${pkgdir}/usr/lib/emojicode/s/interface.emojii"
    install -Dm644 "packages/s/libs.a" "${pkgdir}/usr/lib/emojicode/s/libs.a"
    install -Dm755 "packages/sockets/interface.emojii" "${pkgdir}/usr/lib/emojicode/sockets/interface.emojii"
    install -Dm644 "packages/sockets/libsockets.a" "${pkgdir}/usr/lib/emojicode/sockets/libsockets.a"
}
