# Maintainer: Hong Shick Pak <hong@hspak.com>

pkgname=flamez
pkgver=0.3.2
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

  "sdl3>=3.4.0"
  "freetype2"
  "libpng"
  "vulkan-icd-loader"
)
makedepends=(
  "clang"
  "git"
  "libcap"
  "zig"

  "pkgconf"
)
optdepends=("libdecor: client-side window decorations on Wayland")
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/hspak/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("6f77d5d60f0378173f8b32fcfd4b01b914fb4cac5c797846b29f6e5cbc577426")

build() {
  cd "${pkgname}-${pkgver}"
  zig build -Dversion="$pkgver" --release=safe -Dfps-counter=false
}

check() {
  cd "${pkgname}-${pkgver}"
  zig build -Dversion="$pkgver" test -Dfps-counter=false
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 "zig-out/share/applications/flamez.desktop" "${pkgdir}/usr/share/applications/flamez.desktop"
  install -d "${pkgdir}/usr/share/icons"
  cp -R "zig-out/share/icons/hicolor" "${pkgdir}/usr/share/icons/"
  install -d "${pkgdir}/usr/share/flamez"
  cp -R "zig-out/share/flamez/licenses" "${pkgdir}/usr/share/flamez/"
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
