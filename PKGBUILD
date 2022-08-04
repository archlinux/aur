# Maintainer: Jesus Alvarez <jeezusjr at gmail dot com>

pkgname=jakt-git
pkgver=r1645.f8649c0
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
    cmake -GNinja -B build -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_BUILD_TYPE=Release -DFINAL_STAGE=1
    cmake --build build

    # test stage1
    ninja -C jakttest
    ./jakttest/build/jakttest --assume-updated-selfhost --assume-updated

    # stage2
    cmake -B build -DFINAL_STAGE=2
    cmake --build build
}

check() {
    cd "${pkgname}"
    ninja -C jakttest
    ./jakttest/build/jakttest --assume-updated-selfhost --assume-updated
}

package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/lib/jakt"
    install -d "${pkgdir}/usr/share/doc/jakt"
    install -d "${pkgdir}/usr/share/licenses/jakt"

    cd "${pkgname}"

    install -Dm755 "build/jakt" "${pkgdir}/usr/bin/jakt"
    find runtime -maxdepth 1 -mindepth 1 -exec cp -r {} ${pkgdir}/usr/lib/jakt/ \;
    install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/jakt"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/jakt"
}
