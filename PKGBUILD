# Maintainer: Betül Ünlü < betulunlu0018 ~at~ gmail ~dot~ com >

pkgname="emojicode"
pkgver=1.0.beta.2
pkgrel=2
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
source=("${pkgname}-${pkgver}::https://github.com/emojicode/emojicode/archive/v1.0-beta.2.tar.gz")
sha256sums=('835b1b62a52fb2b7fdcba31e00ec1f6ef19ee3be65f03b97e0dc2944c9288143')

build() {
    # e
    cd "${srcdir}/${pkgname}-1.0-beta.2"

    # ugh
    sed -i 's/8.0//' Compiler/CMakeLists.txt

    mkdir -p build
    cd build
    cmake -DdefaultPackagesDirectory=/usr/lib/emojicode .. -GNinja

    ninja
}

check() {
    read -n 1 -t 30 -p "Do you want to run checks? [y/N] " runchecks

    echo

    if [[ "$runchecks" == y* ]] || [[ "$runchecks" == Y* ]]; then
        # e
        cd "${srcdir}/${pkgname}-1.0-beta.2/build"
        ninja tests
    fi
}

package() {
    # e
    cd "${srcdir}/${pkgname}-1.0-beta.2/build"
    python ../dist.py .. archive

    # FIXME: versioning ugh
    cd "${srcdir}/${pkgname}-1.0-beta.2/build/Emojicode-1.0-beta.2-Linux-$CARCH"

    install -Dm755 "emojicodec" "${pkgdir}/usr/bin/emojicodec"

    install -Dm644 "include/runtime/Runtime.h" "${pkgdir}/usr/include/emojicode/runtime/Runtime.h"
    install -Dm644 "include/s/Data.h" "${pkgdir}/usr/include/emojicode/s/Data.h"
    install -Dm644 "include/s/String.h" "${pkgdir}/usr/include/emojicode/s/String.h"

    cd packages

    for pkg in *; do
        if [ -f "${pkg}/🏛" ]; then
            install -Dm755 "${pkg}/🏛" "${pkgdir}/usr/lib/emojicode/${pkg}/🏛"
        fi
        install -Dm644 "${pkg}/lib${pkg}.a" "${pkgdir}/usr/lib/emojicode/${pkg}/lib${pkg}.a"
    done
}
