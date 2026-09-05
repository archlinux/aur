# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
pkgname=balun
pkgver=0.1.0
pkgrel=1
pkgdesc="A lightweight cross-platform HDHomeRun live TV viewer"
arch=('x86_64')
url="https://github.com/jm2/balun"
license=('GPL-3.0-or-later')
# The release profile already applies thin LTO and strips the binary, so
# makepkg's own LTO and debug-package handling are disabled.
options=('!lto' '!debug')
depends=(
  'glibc'
  'libgcc'
  'gtk4>=4.16'
  'libadwaita>=1.6'
  'gstreamer>=1.20'
  'gst-plugins-base-libs'
  'gst-plugins-good'
  'gst-plugins-bad-libs'
  'gst-plugin-gtk4'
  'gst-libav'
)
makedepends=(
  'cargo'
  'pkgconf'
)
# The upstream package compliance validator run in check() needs perl.
checkdepends=('perl')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cabfd7f97d5ba0ebdbad2d703a7c49d814e5bf71d1972f9ea5553cebdf91d303')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # The desktop feature is required: the default feature set builds only the
  # GTK-free core library and the balun-discover diagnostic.
  cargo build --frozen --release --features desktop --bin balun
}

check() {
  cd "${pkgname}-${pkgver}"
  build-aux/linux/validate-package-compliance.sh --elf target/release/balun
}

package() {
  cd "${pkgname}-${pkgver}"

  # Binary
  install -Dm755 "target/release/balun" "$pkgdir/usr/bin/balun"

  # Desktop entry
  install -Dm644 "data/io.github.jm2.Balun.desktop" \
    "$pkgdir/usr/share/applications/io.github.jm2.Balun.desktop"

  # AppStream metainfo
  install -Dm644 "data/io.github.jm2.Balun.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/io.github.jm2.Balun.metainfo.xml"

  # Icons
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 \
      "data/icons/hicolor/${size}x${size}/apps/io.github.jm2.Balun.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/io.github.jm2.Balun.png"
  done
  install -Dm644 "data/icons/hicolor/scalable/apps/io.github.jm2.Balun.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.jm2.Balun.svg"
  install -Dm644 "data/icons/hicolor/symbolic/apps/io.github.jm2.Balun-symbolic.svg" \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/io.github.jm2.Balun-symbolic.svg"

  # License
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Upstream's bundled-component policy gate over the installed tree
  build-aux/linux/validate-package-compliance.sh --tree "$pkgdir"
}
