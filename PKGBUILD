# Maintainer: Jonas Ohland <jonas.ohland@gmail.com>
pkgname=mxl-git
pkgver=0.7.4_d4eab41
pkgrel=1
pkgdesc="Dynamic Media Facility: Media Exchange Layer"
arch=("x86_64" "aarch64")
depends=("util-linux-libs")
makedepends=("picojson-git" "stduuid" "pcapplusplus")
license=("Apache-2.0")
url="https://github.com/dmf-mxl/mxl"

_pkgsrc="$pkgname"

source=(
    "$_pkgsrc::git+$url.git"
    "picojson-include-path.patch"
    "picojson-include-path-source.patch"
    "use-std-span.patch"
)

sha256sums=(
    "SKIP"
    "d6913e1459ad785123c1dbfe6f8029c9d247cd0f76037ce52ae4a0d5172a3136"
    "7f89bf3e2f72b401de9796ac512c0803913df21d1532f80e97107cbe88ab4044"
    "7c8ccb49c9b3fd5518626574a14998acabb7241956cb3176d027ed156d6877f6"
)

pkgver() {
    printf "%s_%s" \
        "$(sed -En 's/^set\(mxl_VERSION ([0-9.]*)\)$/\1/p' "$_pkgsrc/CMakeLists.txt")" \
        "$(git -C $_pkgsrc rev-parse --short HEAD)"
}

prepare() {
    patch -p1 -d "$_pkgsrc" <"picojson-include-path.patch"
    patch -p1 -d "$_pkgsrc" <"picojson-include-path-source.patch"
    patch -p1 -d "$_pkgsrc" <"use-std-span.patch"
}

build() {
    cmake -S "$_pkgsrc" -B "$_pkgsrc/build" \
        -DCMAKE_BUILD_TYPE=Debug \
        -DCMAKE_INSTALL_PREFIX=/usr

    make -C "$_pkgsrc/build"
    make -C "$_pkgsrc/build" doc
}

check() {
    make -C "$_pkgsrc/build" test
}

package() {
    make DESTDIR="$pkgdir" -C "$_pkgsrc/build" install
}
