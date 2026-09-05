# Maintainer: Hong Shick Pak <hong@hspak.com>

pkgname=flamez
pkgver=0.2.0
pkgrel=1
pkgdesc="A live process-lifetime and CPU-activity flamegraph"
arch=("x86_64")
url="https://github.com/hspak/flamez"
license=("MIT")
depends=(
  "glibc"
  "libbpf"
  "libglvnd"
  "libxkbcommon"
  "wayland"
)
makedepends=(
  "clang"
  "git"
  "libcap"
  "zig"
)
optdepends=("libdecor: client-side window decorations on Wayland")
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/hspak/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("f9170c26cd690847a775ce625b5b244c5016d95121a79b34b8da9ec28d417b05")

build() {
  cd "${pkgname}-${pkgver}"
  zig build --release=safe -Dfps-counter=false -Dmsaa=false
}

check() {
  cd "${pkgname}-${pkgver}"
  zig build test -Dfps-counter=false -Dmsaa=false
}

package() {
  cd "${pkgname}-${pkgver}"
  install -D -m 0755 "zig-out/bin/flamez" "${pkgdir}/usr/bin/flamez"
  install -D -m 0644 \
    "zig-out/share/flamez/flamez.bpf.o" \
    "${pkgdir}/usr/share/flamez/flamez.bpf.o"
  install -D -m 0644 \
    "zig-out/share/flamez/flamez-analysis-v1.schema.json" \
    "${pkgdir}/usr/share/flamez/flamez-analysis-v1.schema.json"
  install -D -m 0644 \
    "zig-out/share/flamez/flamez-analysis-v1.md" \
    "${pkgdir}/usr/share/flamez/flamez-analysis-v1.md"
  install -D -m 0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  setcap "cap_bpf,cap_perfmon=ep" "${pkgdir}/usr/bin/flamez"
}

# vim: ft=sh syn=sh et
