# Maintainer: Jonas Ohland <jonas.ohland@gmail.com>
pkgname=mxl-git
pkgver=0.7.5_ea3a570
pkgrel=3
pkgdesc="Dynamic Media Facility: Media Exchange Layer"
arch=("x86_64" "aarch64")
depends=("util-linux-libs" "spdlog" "fmt" "gstreamer" "gst-plugins-base")
makedepends=("picojson-git" "stduuid" "pcapplusplus" "cli11")
checkdepends=("catch2")
license=("Apache-2.0")
url="https://github.com/dmf-mxl/mxl"

_pkgsrc="$pkgname"

source=(
    "$_pkgsrc::git+$url.git"
    "picojson-include-path.patch"
    "use-std-span.patch"
)

sha256sums=(
    "SKIP"
    "d6913e1459ad785123c1dbfe6f8029c9d247cd0f76037ce52ae4a0d5172a3136"
    "7c8ccb49c9b3fd5518626574a14998acabb7241956cb3176d027ed156d6877f6"
)

pkgver() {
    printf "%s_%s" \
        "$(sed -En 's/^set\(mxl_VERSION ([0-9.]*)\)$/\1/p' "$_pkgsrc/CMakeLists.txt")" \
        "$(git -C $_pkgsrc rev-parse --short HEAD)"
}

prepare() {
    patch -p1 -d "$_pkgsrc" <"picojson-include-path.patch"
    patch -p1 -d "$_pkgsrc" <"use-std-span.patch"
    echo "Patching picojson include paths"
    find . -regex '.*\.[ch]p*' -not -path './build/*' \
        -exec sed -i 's%^#include <picojson/picojson.h>$%#include <picojson.h>%g' '{}' \;
}

build() {
    cmake -S "$_pkgsrc" -B "$_pkgsrc/build" \
        -DCMAKE_BUILD_TYPE=Release \
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
