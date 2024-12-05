# Maintainer: taotieren <admin@taotieren.com>

pkgname=openixcard-git
pkgver=1.1.8.r6.gdc7efda
pkgrel=5
pkgdesc="Open Source Version of Allwinner PhoenixCard to Dump, Unpack, Flash Allwinner IMG Files on Linux"
arch=($CARCH)
url="https://github.com/YuzukiTsuru/OpenixCard"
license=('GPL-2.0-or-later')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(
    confuse
    gcc-libs
    glibc)
makedepends=(
    clang
    llvm
    cmake
    git
    pkgconf)
optdepends=()
source=("${pkgname}::git+${url}.git"
    "git+https://github.com/YuzukiTsuru/ColorCout.git"
    "git+https://github.com/p-ranav/argparse.git"
    "git+https://github.com/arun11299/cpp-subprocess.git"
    "git+https://github.com/ArthurSonzogni/FTXUI.git"
    "git+https://github.com/SemaiCZE/inicpp.git")
sha256sums=('SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    pushd "${srcdir}/${pkgname}"
    git submodule init
    git config submodule.lib/ColorCout.url "$srcdir/ColorCout"
    git config submodule.lib/argparse.url "$srcdir/argparse"
    git config submodule.lib/cpp-subprocess.url "$srcdir/cpp-subprocess"
    git config submodule.lib/ftxui.url "$srcdir/FTXUI"
    git config submodule.lib/inicpp.url "$srcdir/inicpp"
    git -c protocol.file.allow=always submodule update
    #         pushd lib/argparse
    #             #git checkout 95d4850 include/argparse/argparse.hpp
    #         popd
    #         pushd lib/inicpp
    #             git fetch
    #             git checkout 0f7bd53
    #         popd
    #         pushd lib/ColorCout
    #             git fetch
    #             git checkout 3bed851
    #         popd

    popd
}

build() {
    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    cmake -S "${srcdir}/${pkgname}" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev \
        -B build

    cmake --build "${srcdir}/build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"
    mv "${pkgdir}/usr/bin/OpenixCard" "${pkgdir}/usr/bin/${pkgname%-git}"
}
