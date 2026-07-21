# Maintainer:

pkgname=quickjs-c-bridge-git
pkgver=r5.7204d9b
pkgrel=1
pkgdesc="Desktop bridges for quickjs"
arch=('x86_64')
url="https://github.com/abner/quickjs-c-bridge"
license=('unknown')
depends=('glibc' 'libgcc' 'libstdc++')
makedepends=('cmake' 'git')
provides=("${pkgname%-git}" 'libquickjs_c_bridge_plugin.so')
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    local cmake_options=(
        -B build
        -D CMAKE_BUILD_TYPE=Release
        -D CMAKE_INSTALL_PREFIX=/usr
        -S "${pkgname%-git}/linux"
    )
    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    install -Dm644 build/libquickjs_c_bridge_plugin.so -t "${pkgdir}/usr/lib"
}
