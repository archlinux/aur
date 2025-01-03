# Maintainer: taotieren <admin@taotieren.com>

pkgname=libpeci-git
pkgver=r55.e836d46
pkgrel=1
pkgdesc="libpeci is a library that provides various APIs to interface with the IOCTLs provided by the PECI driver in the OpenBMC kernel. "
url="https://github.com/openbmc/libpeci"
arch=($CARCH)
license=('Apache-2.0')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(
    glibc
)
makedepends=(
    cmake
    git
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
