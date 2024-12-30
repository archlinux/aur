# Maintainer: taotieren <admin@taotieren.com>

pkgname=entity-manager-git
pkgver=r3029.deae6a7
pkgrel=1
epoch=
pkgdesc="Run-time JSON driven system configuration manager"
arch=($CARCH)
url="https://github.com/openbmc/entity-manager"
license=('Apache-2.0')
groups=()
depends=(
    boost-libs
    gcc-libs
    glibc
    i2c-tools
    nlohmann-json
    openssl
    tinyxml2
    #     pam
    systemd-libs
    zlib
    #AUR
    phosphor-dbus-interfaces-git
    sdbusplus-git
    valijson-git
)
makedepends=(
    cmake
    git
    gtest
    ninja
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
    meson subprojects download --sourcedir="${srcdir}/${pkgname}"
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
