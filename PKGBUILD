pkgname=aurora-gui-git
pkgver=0.0.0.r0.g0000000
pkgrel=1
pkgdesc="Wayland-first GTK4 GUI for Arch Linux package management (pacman + AUR via yay/paru)"
arch=("x86_64")
url="https://github.com/ahmoodio/aurora"
license=("MIT")

depends=('gtk4' 'libadwaita' 'vulkan-icd-loader' 'openssl' 'zlib' 'libssh2')

optdepends=(
  "yay: AUR helper"
  "paru: AUR helper"
  "flatpak: optional Flatpak management"
)

makedepends=('git' 'rust' 'cargo' 'pkgconf' 'clang' 'lld' 'perl')

provides=("aurora-gui")
conflicts=("aurora-gui" "aurora-pacman-gui-git")

install="aurora.install"

source=(
  "aurora::git+https://github.com/ahmoodio/aurora.git"
  "aurora.install"
)

sha256sums=(
  "SKIP"
  "SKIP"
)

pkgver() {
  cd "$srcdir/aurora"
  git describe --long --tags --always | sed "s/^v//;s/-/.r/;s/-/./"
}

build() {
  cd "$srcdir/aurora"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo build --release --locked
}

package() {
  cd "$srcdir/aurora"

  install -Dm755 "$srcdir/target/release/aurora" \
    "$pkgdir/usr/bin/aurora"

  install -Dm755 "$srcdir/target/release/aurora-helper" \
    "$pkgdir/usr/bin/aurora-helper"

  install -Dm644 resources/io.github.ahmoodio.aurora.desktop \
    "$pkgdir/usr/share/applications/io.github.ahmoodio.aurora.desktop"

  install -Dm644 resources/io.github.ahmoodio.aurora.metainfo.xml \
    "$pkgdir/usr/share/metainfo/io.github.ahmoodio.aurora.metainfo.xml"

  install -Dm644 resources/io.github.ahmoodio.aurora.policy \
    "$pkgdir/usr/share/polkit-1/actions/io.github.ahmoodio.aurora.policy"

  install -Dm644 assets/icons/hicolor/256x256/apps/io.github.ahmoodio.aurora.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.ahmoodio.aurora.png"
}
