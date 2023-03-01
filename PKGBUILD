# Maintainer: Jesus Alvarez <jeezusjr at gmail dot com>
#
# WARNING: packaging does not work with aurutils, see https://aur.archlinux.org/packages/jakt-git#comment-883725
#
pkgname=jakt-git
pkgver=r2296.7a35484f
pkgrel=1
pkgdesc="The Jakt Programming Language from SerenityOS"
arch=("x86_64")
url="https://github.com/SerenityOS/jakt"
license=("BSD")
depends=("clang")
makedepends=("ninja" "cmake" "git")
provides=("jakt")
conflicts=("jakt")
source=("${pkgname}::git+https://github.com/SerenityOS/jakt.git")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${pkgname}"

    # stage1
    cmake -GNinja -B build \
        -DCMAKE_INSTALL_PREFIX:PATH="/usr" \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_BUILD_TYPE=Release \
        -DFINAL_STAGE=1
    cmake --build build

    # test stage1
    ./build/bin/jakttest

    # stage2
    cmake -B build -DFINAL_STAGE=2
    cmake --build build
}

check() {
    # test stage2
    cd "${pkgname}"
    ./build/bin/jakttest
}

package() {
    cd "${pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

    DESTDIR="$pkgdir" cmake --install build

    # WORKAROUND for https://github.com/SerenityOS/jakt/issues/1214
    ln -sv ./jakt_stage1 ${pkgdir}/usr/bin/jakt
}
