# Maintainer: taotieren <admin@taotieren.com>

pkgname=phosphor-logging-git
pkgver=r1068.b6d3e2f
pkgrel=1
epoch=
pkgdesc="Libraries for common event and logging creation."
arch=($CARCH)
url="https://github.com/openbmc/phosphor-logging"
license=('Apache-2.0')
groups=()
depends=(
    gcc-libs
    glibc
    systemd-libs
    #AUR
    sdbusplus-git
    sdeventplus-git
    phosphor-dbus-interfaces-git
)
makedepends=(
    cereal
    cmake
    cli11
    function2
    git
    ninja
    nlohmann-json
    python-jsonschema
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
    arch-meson ${pkgname} build
    ninja -C build
}

# check(){
#     meson test -C ${srcdir}/build
# }

package() {
    DESTDIR="${pkgdir}" ninja -C ${srcdir}/build install
}
