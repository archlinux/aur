# Maintainer: Jonas Ohland <jonas.ohland@gmail.com>
pkgname=mxl-git
pkgver=1.2.0_26d86272
pkgrel=1
pkgdesc="Dynamic Media Facility: Media Exchange Layer"
arch=("x86_64" "aarch64")
depends=("util-linux-libs" "spdlog" "fmt" "gstreamer" "gst-plugins-base")
makedepends=("picojson-git" "stduuid" "pcapplusplus" "cli11")
checkdepends=("catch2")
license=("Apache-2.0")
url="https://github.com/dmf-mxl/mxl"
provides=("mxl")

_pkgsrc="$pkgname"

source=(
  "$_pkgsrc::git+$url.git"
  "picojson-include-path.patch"
  "use-std-span.patch"
  "remove-linker-test.patch"
)

sha256sums=('SKIP'
            '361ccfec49df6e5fc6ad2de313c01e6e86dfd2e12e7e674d5180e7e9b295a2d0'
            'a3d72e58fe3f421a89a0ffc3ff59352b625d8e7a62628c1a79bdd835f2f546d5'
            'efe58b060f99b2af6d2aa0c54abf5837423c625e60b1de59d771759cde5de6ac')

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
    -DBUILD_SHARED_LIBS=ON \
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
