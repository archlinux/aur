pkgname=aurora-pacman-gui-git
pkgver=0.0.0.r0.g0000000
pkgrel=1
pkgdesc="Wayland-first GTK4 GUI for Arch Linux package management (pacman + AUR via yay/paru)"
arch=("x86_64")
url="https://github.com/ahmoodio/aurora"
license=("MIT")

depends=("gtk4" "libadwaita" "polkit" "appstream" "hicolor-icon-theme" "pacman")
optdepends=(
  "yay: AUR helper"
  "paru: AUR helper"
  "flatpak: optional Flatpak management"
)

makedepends=("git" "rust" "cargo" "pkgconf")

# This package replaces your old local name
provides=("aurora-pacman-gui")
conflicts=("aurora-pacman-gui" "aurora-git")

install="aurora.install"
source=("aurora::git+https://github.com/ahmoodio/aurora.git"
        "aurora.install")
sha256sums=("SKIP"
            "SKIP")

pkgver() {
  cd "$srcdir/aurora"
  git describe --long --tags --always | sed "s/^v//;s/-/.r/;s/-/./"
}

build() {
  cd "$srcdir/aurora"
  export CARGO_TARGET_DIR="$srcdir/target"

  # Strip lld/gold injected by makepkg or user env; ring fails to link with lld.
  export LDFLAGS="${LDFLAGS//-fuse-ld=lld/}"
  export LDFLAGS="${LDFLAGS//-fuse-ld=gold/}"

  # RUSTFLAGS may also inject lld/gold; strip those too.
  export RUSTFLAGS="${RUSTFLAGS//-C link-arg=-fuse-ld=lld/}"
  export RUSTFLAGS="${RUSTFLAGS//-C link-arg=-fuse-ld=gold/}"
  export RUSTFLAGS="${RUSTFLAGS//-Clink-arg=-fuse-ld=lld/}"
  export RUSTFLAGS="${RUSTFLAGS//-Clink-arg=-fuse-ld=gold/}"

  # Force GNU bfd (ring + lld is broken on Arch)
  export RUSTFLAGS="${RUSTFLAGS:-} -C linker=gcc -C link-arg=-fuse-ld=bfd"

  cargo build --release --locked
}

package() {
  cd "$srcdir/aurora"

  install -Dm755 "$srcdir/target/release/aurora" "$pkgdir/usr/bin/aurora"
  install -Dm755 "$srcdir/target/release/aurora-helper" "$pkgdir/usr/bin/aurora-helper"

  install -Dm644 resources/io.github.ahmoodio.aurora.desktop \
    "$pkgdir/usr/share/applications/io.github.ahmoodio.aurora.desktop"
  install -Dm644 resources/io.github.ahmoodio.aurora.metainfo.xml \
    "$pkgdir/usr/share/metainfo/io.github.ahmoodio.aurora.metainfo.xml"
  install -Dm644 resources/io.github.ahmoodio.aurora.policy \
    "$pkgdir/usr/share/polkit-1/actions/io.github.ahmoodio.aurora.policy"

  install -Dm644 assets/icons/hicolor/256x256/apps/io.github.ahmoodio.aurora.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/io.github.ahmoodio.aurora.png"

  # Optional asset (keep only if your app loads it from this path)
  install -Dm644 assets/logo.png \
    "$pkgdir/usr/share/aurora/assets/logo.png"
}
