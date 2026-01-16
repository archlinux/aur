# Maintainer: Ziyang-Bai <baiziyang2022@yeah.net>

_pkgname=lamina
pkgname=${_pkgname}-git
pkgver=1.1.1.Beta.r73.g336b74b7
pkgrel=2
pkgdesc="A procedural programming language focusing on precise mathematical computation"
arch=('x86_64' 'aarch64')
url="https://github.com/Lamina-dev/Lamina"
license=('LGPL-2.1')
depends=('glibc')
makedepends=('cmake' 'git')
conflicts=("${_pkgname}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd Lamina
    git describe --long --tags --abbrev=8 |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g;s/rc.\.//'
}

prepare() {
    cd Lamina
    git submodule update --init --recursive
}

build() {
    mkdir -p build
    cmake -B build \
        -S Lamina \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    cmake --build build -j "$(nproc)"
}

package() {
    cmake --install build --prefix "${pkgdir}/usr"

    # remove libuv files from package
    rm -f "${pkgdir}/usr/lib/libuv.so*" "${pkgdir}/usr/lib/libuv.a"
    rm -rf "${pkgdir}/usr/include/uv.h" "${pkgdir}/usr/include/uv"

    # remove unnecessary docs and cmake/pkgconfig files
    rm -rf "${pkgdir}/usr/share/doc"
    rm -rf "${pkgdir}/usr/lib/cmake"
    rm -rf "${pkgdir}/usr/lib/pkgconfig"

    # install license
    install -Dm644 Lamina/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
