# Maintainer: taotieren <admin@taotieren.com>

pkgname=bmcweb-git
pkgver=r3119.1940677
pkgrel=2
epoch=
pkgdesc="This is a library which deals with the encoding and decoding of PLDM messages."
arch=($CARCH)
url="https://github.com/openbmc/bmcweb"
license=('Apache-2.0')
groups=()
depends=(
    boost-libs
    gcc-libs
    glibc
    libnghttp2
    openssl
    tinyxml2
    pam
    sdbusplus-git
    systemd-libs
    zlib
)
makedepends=(
    cmake
    cli11
    boost
    git
    gtest
    ninja
    nlohmann-json
    meson
)
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
    #     meson subprojects download --sourcedir="${srcdir}/${pkgname}"
}

build() {
    arch-meson "${srcdir}/${pkgname}" build
    ninja -C build
}

# check(){
#     meson test -C ${srcdir}/build
# }

package() {
    DESTDIR="${pkgdir}" ninja -C ${srcdir}/build install
}
