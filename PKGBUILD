# Maintainer: taotieren <admin@taotieren.com>

pkgname=phosphor-dbus-interfaces-git
pkgver=r934.a12cc29
pkgrel=2
pkgdesc="YAML descriptors of standard dbus interfaces (in OpenBMC)"
url="https://github.com/openbmc/phosphor-dbus-interfaces"
arch=($CARCH)
license=('Apache-2.0')
depends=(
    glibc
    libgcc
    libstdc++
    systemd-libs
# AUR
    sdbusplus-git
)
makedepends=(
    boost-libs
    cmake
    git
    meson
    nlohmann-json
    pkgconf
    python-jsonschema
)
source=("${pkgname}::git+${url}")
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
}

build() {
    arch-meson ${pkgname} build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}
