# Maintainer: taotieren <admin@taotieren.com>

pkgname=libpldm-git
pkgver=0.17.0.r12.g84ef0f4
pkgrel=1
epoch=
pkgdesc="This is a library which deals with the encoding and decoding of PLDM messages."
arch=($CARCH)
url="https://github.com/openbmc/libpldm"
license=('Apache-2.0')
groups=()
depends=(
    libgcc
    libstdc++
)
makedepends=(
    doxygen
    git
    gtest
    meson
    ninja
    abi-dumper
    abi-compliance-checker)
checkdepends=()
optdepends=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+${url}.git")
noextract=()
sha256sums=('SKIP')
#validpgpkeys=()
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
    sed -i '/^#include "environ\/time.h"$/a #include <climits>' "${srcdir}/${pkgname}/tests/unit/transport/send_recv_one.cpp"
}

build() {
    arch-meson ${pkgname} build -Dabi=deprecated,stable,testing
    ninja -C build
}

# check(){
#     meson test -C ${srcdir}/build
# }

package() {
    DESTDIR="${pkgdir}" ninja -C ${srcdir}/build install
}
