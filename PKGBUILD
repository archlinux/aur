# Maintainer: Betül Ünlü < betulunlu0018 ~at~ gmail ~dot~ com >

pkgname="emojicode"
pkgver=1.0.beta.1
pkgrel=4
pkgdesc="An open-source, full-blown programming language consisting of emojis"
arch=('i686' 'x86_64')
url="https://emojicode.org"
license=("Artistic2.0")
depends=(
    "ncurses"
    "zlib"
)
makedepends=(
    "gcc>=7.2"
    "llvm"
    "cmake>=3.5.1"
    "ninja"
)
checkdepends=(
    "python>=3.5.2"
    "ninja"
)
optdepends=(
    "yarn: for package support and allegro"
    "allegro: for graphics support"
)

# FIXME: versioning after stable
source=("${pkgname}::git+https://github.com/emojicode/emojicode#tag=v1.0-beta.1")
md5sums=("SKIP")

build() {
    cd "${srcdir}/${pkgname}"

    # ugh
    sed -i 's/8.0/9.0/' Compiler/CMakeLists.txt

    mkdir -p build
    cd build
    cmake -DdefaultPackagesDirectory=/usr/lib/emojicode .. -GNinja

    ninja
}

check() {
    read -n 1 -t 30 -p "Do you want to run checks? [y/N] " runchecks

    echo

    if [[ "$runchecks" == y* ]] || [[ "$runchecks" == Y* ]]; then
        cd "${srcdir}/${pkgname}/build"
        ninja tests
    fi
}

package() {
    cd "${srcdir}/${pkgname}"

    cd "${srcdir}/${pkgname}/build"
    ninja dist

    # FIXME: versioning ugh
    cd "Emojicode-1.0-beta.1-Linux-${CARCH}"

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
