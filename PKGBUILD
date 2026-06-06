pkgname=aurora-gui-git
pkgver=0.0.0.r0.g0000000
pkgrel=38
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

# NOTE: do NOT depend on lld here; we force bfd to avoid ring+lld link failures.
makedepends=('git' 'rust' 'cargo' 'pkgconf' 'clang' 'perl')

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

  # Remove lld/gold if injected by makepkg.conf or user env
  export LDFLAGS="${LDFLAGS//-fuse-ld=lld/}"
  export LDFLAGS="${LDFLAGS//-fuse-ld=gold/}"

  # Also strip lld/gold from Rust flags
  export RUSTFLAGS="${RUSTFLAGS//-C link-arg=-fuse-ld=lld/}"
  export RUSTFLAGS="${RUSTFLAGS//-C link-arg=-fuse-ld=gold/}"
  export RUSTFLAGS="${RUSTFLAGS//-Clink-arg=-fuse-ld=lld/}"
  export RUSTFLAGS="${RUSTFLAGS//-Clink-arg=-fuse-ld=gold/}"

  # Force GNU bfd (ring + lld is broken on Arch)
  export RUSTFLAGS="${RUSTFLAGS:-} -C linker=gcc -C link-arg=-fuse-ld=bfd"

  # Build deps without linking binaries
  cargo check --release --locked

  # Find ring_core static lib produced by ring build script
  local ring_core_a
  ring_core_a=$(find "$CARGO_TARGET_DIR/release/build" -path '*/out/libring_core_0_17_14_.a' | head -n 1)
  if [[ -z "$ring_core_a" ]]; then
    echo "error: ring_core static library not found"
    return 1
  fi

  # Relink binaries, explicitly adding ring_core
  cargo rustc --release --locked --bin aurora -- \
    -C link-arg="$ring_core_a"

  cargo rustc --release --locked --bin aurora-helper -- \
    -C link-arg="$ring_core_a"
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
  install -Dm644 assets/icons/hicolor/scalable/apps/io.github.ahmoodio.aurora.png \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.ahmoodio.aurora.png"

  # Compatibility aliases for launchers/compositors that resolve shorter icon names.
  install -Dm644 assets/icons/hicolor/256x256/apps/io.github.ahmoodio.aurora.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/aurora.png"
  install -Dm644 assets/icons/hicolor/scalable/apps/io.github.ahmoodio.aurora.png \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/aurora.png"
  install -Dm644 assets/icons/hicolor/256x256/apps/io.github.ahmoodio.aurora.png \
    "$pkgdir/usr/share/pixmaps/io.github.ahmoodio.aurora.png"
  install -Dm644 assets/icons/hicolor/256x256/apps/io.github.ahmoodio.aurora.png \
    "$pkgdir/usr/share/pixmaps/aurora.png"
}
