# Maintainer: taotieren <admin@taotieren.com>

pkgname=libpldm-git
pkgver=0.7.0.r45.gdc7d3b5
pkgrel=1
epoch=
pkgdesc="This is a library which deals with the encoding and decoding of PLDM messages."
arch=(aarch64
    riscv64
    x86_64)
url="https://github.com/openbmc/libpldm"
license=('Apache-2.0')
groups=()
depends=(glibc)
makedepends=(
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
    ( set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
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
