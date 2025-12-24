# Maintainer: Jonas Ohland <jonas.ohland@gmail.com>
pkgname=mxl-git
pkgver=1.1.0_52aea5a
pkgrel=1
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
    "remove-linker-test.patch"
)

sha256sums=(
    "SKIP"
    "d6913e1459ad785123c1dbfe6f8029c9d247cd0f76037ce52ae4a0d5172a3136"
    "12521275179c90d67a9bd6863dd34ead8aea354c2938d14f15a0c71c59c8a702"
    "083aff62ba622392e54daeb67f01eaa48cc94fa44196cbc94f4f8943be66df5d"
)

pkgver() {
    printf "%s_%s" \
        "$(sed -En 's/^set\(mxl_VERSION ([0-9.]*)\)$/\1/p' "$_pkgsrc/CMakeLists.txt")" \
        "$(git -C $_pkgsrc rev-parse --short HEAD)"
}

prepare() {
    patch -p1 -d "$_pkgsrc" <"picojson-include-path.patch"
    patch -p1 -d "$_pkgsrc" <"use-std-span.patch"
    patch -p1 -d "$_pkgsrc" <"remove-linker-test.patch"
    echo "Patching picojson include paths"
    find . -regex '.*\.[ch]p*' -not -path './build/*' \
        -exec sed -i 's%^#include <picojson/picojson.h>$%#include <picojson.h>%g' '{}' \;
}

build() {
    cmake -S "$_pkgsrc" -B "$_pkgsrc/build" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_BUILD_SHARED_LIBS=ON \
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
