# Maintainer: taotieren <admin@taotieren.com>

pkgname=stdplus-git
pkgver=r272.c6262a4
pkgrel=2
pkgdesc="stdplus is a c++ project containing commonly used classes and functions for the Linux platform."
url="https://github.com/openbmc/stdplus"
arch=($CARCH)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
license=('Apache-2.0')
depends=(
    sh
    gcc-libs
    glibc
    gtest
    fmt
    liburing
)
makedepends=(
    cmake
    git
    function2
    ninja
    meson
    pkgconf
)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

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
    #     meson subprojects download --sourcedir="${srcdir}/${pkgname}"
}

build() {
    arch-meson ${pkgname} build
    ninja -C build
}

# check(){
#     meson test -C ${srcdir}/build
# }

package() {
    DESTDIR="${pkgdir}" ninja -C ${srcdir}/build install
}
