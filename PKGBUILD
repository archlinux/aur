# Maintainer: Rasmus Karlsson <rasmus.karlsson@pajlada.com>

_pkgname=backward-cpp
pkgname=${_pkgname}-git
pkgver=1.6.r70.g0bfd0a0
pkgrel=1
pkgdesc="A beautiful stack trace pretty printer for C++"
url="https://github.com/bombela/backward-cpp"
arch=('x86_64')
license=('MIT')
depends=('libelf' 'glibc' 'gcc-libs')
makedepends=('git' 'cmake' 'binutils' 'libdwarf' 'libunwind')
source=('git+https://github.com/bombela/backward-cpp')
sha256sums=('SKIP')

pkgver() {
    git -C "backward-cpp" describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBACKWARD_TESTS=true \
        -DBACKWARD_SHARED=true \
        -B build \
        backward-cpp

    cmake --build build
}

check() {
    ctest --test-dir build
}

package() {
    cmake --install build --prefix "${pkgdir}/usr"

    install -Dm644 "backward-cpp/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

