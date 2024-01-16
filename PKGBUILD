# Maintainer: taotieren <admin@taotieren.com>

pkgname=bmcweb-git
pkgver=r2563.f347756
pkgrel=2
epoch=
pkgdesc="This is a library which deals with the encoding and decoding of PLDM messages."
arch=(aarch64
    riscv64
    x86_64)
url="https://github.com/openbmc/bmcweb"
license=('Apache')
groups=()
depends=(
    boost
    glibc
    libnghttp2
    nlohmann-json
    openssl
    tinyxml2
    sdbusplus-git
    systemd
    zlib
    ninja)
makedepends=(
    cmake
    git
    gtest
    meson)
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
    arch-meson ${pkgname} build
    ninja -C build
}

# check(){
#     meson test -C ${srcdir}/build
# }

package() {
    DESTDIR="${pkgdir}" ninja -C ${srcdir}/build install
}
