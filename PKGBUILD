# Maintainer: taotieren <admin@taotieren.com>

pkgname=peci-pcie-git
pkgver=r48.264ae8e
pkgrel=1
pkgdesc="The peci-pcie application uses the CPU PECI interface to get PCIe Device information for the system and shares it on D-Bus."
url="https://github.com/openbmc/peci-pcie"
arch=($CARCH)
license=('Apache-2.0')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(
    gcc-libs
    glibc
    systemd-libs
    #AUR
    libpeci-git
    sdbusplus-git
)
makedepends=(
    boost
    cmake
    git
    function2
    nlohmann-json
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
