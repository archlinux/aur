# Maintainer: Jonas Ohland <jonas.ohland@gmail.com>
pkgname=mxl
pkgver=1.1.0
pkgrel=2
pkgdesc="Dynamic Media Facility: Media Exchange Layer"
arch=("x86_64" "aarch64")
depends=("util-linux-libs" "spdlog" "fmt" "gstreamer" "gst-plugins-base" "libfabric")
makedepends=("picojson-git" "stduuid" "pcapplusplus" "cli11")
checkdepends=("catch2")
license=("Apache-2.0")
url="https://github.com/dmf-mxl/mxl"
provides=("mxl=1.1")

_extraver=""
_pkgsrc="${pkgname}-${pkgver}${_extraver}"

source=(
  "https://github.com/dmf-mxl/mxl/archive/refs/tags/v${pkgver}${_extraver}.tar.gz"
  "picojson-include-path.patch"
  "use-std-span.patch"
  "remove-linker-test.patch"
  "catch2-include.patch"
)

sha256sums=(
  "f0d54d103450af318433a0f8baced98a4be8b7bbf32a4fc68c6029f741688912"
  "2c1c2066049dd0d640f381fdc47ba6dd5e8116e1b0763f96cd7ca53d52476ed8"
  "3a9dc2d15ce92457a2b2204ebc211e7725b9810222a5a871bc452815d4861ab4"
  "68740300500eeb0a9fd6f505c32964aad2c1ed4c8d77fb817f95bfb3001ac755"
  "6ea87dfd27a47cd60ddcc7b7584f08f5cdfdae804312930163a91e37ea3082ac"
)

prepare() {
  patch -p1 -d "$_pkgsrc" <"remove-linker-test.patch"
  patch -p1 -d "$_pkgsrc" <"picojson-include-path.patch"
  patch -p1 -d "$_pkgsrc" <"use-std-span.patch"
  patch -p1 -d "$_pkgsrc" <"catch2-include.patch"
  echo "Patching picojson include paths"
  find . -regex '.*\.[ch]p*' -not -path './build/*' \
    -exec sed -i 's%^#include <picojson/picojson.h>$%#include <picojson.h>%g' '{}' \;
}

build() {
  cmake -S "$_pkgsrc" -B "$_pkgsrc/build" \
    -DMXL_ENABLE_FABRICS_OFI=ON \
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
