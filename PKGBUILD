# Maintainer: Axel Valens (chomiam) <axel.valens@gmail.com>
pkgname=noos-flasher
pkgver=0.2.0
pkgrel=1
pkgdesc="Créateur de clés USB bootables Linux (DD) & Windows 10/11 UEFI avec studio de debloat (Rust + GTK4 / Libadwaita)"
arch=('x86_64')
url="https://github.com/Chomiam/noos-flasher"
license=('MIT')
provides=('noos-win-installer')
conflicts=('noos-win-installer')
replaces=('noos-win-installer')
depends=(
  'cairo'
  'dosfstools'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk4>=4.14'
  'hicolor-icon-theme'
  'libadwaita>=1.5'
  'ntfs-3g'
  'ntfsprogs'
  'pango'
  'parted'
  'polkit'
  'util-linux'
)
makedepends=(
  'cargo'
  'git'
  'pkgconf'
)
optdepends=(
  '7zip: détection rapide des métadonnées internes des ISO (7z)'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Chomiam/noos-flasher/archive/refs/tags/v${pkgver}.tar.gz")
# À recalculer avec `updpkgsums` après la publication du tag v0.2.0.
sha256sums=('96b84da4d82f0a8a55bc320f949239f6618e9f38c0bd6a66b867229e7d6c1119')

prepare() {
  cd "${srcdir}/noos-flasher-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/noos-flasher-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${srcdir}/noos-flasher-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen

  # Vérifie que les outils runtime déclarés en dépendances sont bien présents.
  for bin in pkexec parted mkfs.vfat mkfs.ntfs ntfsfix ntfs-3g; do
    command -v "$bin" >/dev/null || {
      echo "Dépendance runtime manquante : $bin" >&2
      return 1
    }
  done
}

package() {
  cd "${srcdir}/noos-flasher-${pkgver}"
  install -Dm755 "target/release/noos-flasher" "${pkgdir}/usr/bin/noos-flasher"
  install -Dm644 "packaging/io.github.chomiam.NoosFlasher.desktop" \
    "${pkgdir}/usr/share/applications/io.github.chomiam.NoosFlasher.desktop"
  install -Dm644 "assets/icons/noos-flasher-32.png" \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/io.github.chomiam.NoosFlasher.png"
  install -Dm644 "assets/icons/noos-flasher-64.png" \
    "${pkgdir}/usr/share/icons/hicolor/64x64/apps/io.github.chomiam.NoosFlasher.png"
  install -Dm644 "assets/icons/noos-flasher-128.png" \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/io.github.chomiam.NoosFlasher.png"
  install -Dm644 "assets/icons/noos-flasher-256.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/io.github.chomiam.NoosFlasher.png"
  install -Dm644 "assets/icons/noos-flasher-512.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/io.github.chomiam.NoosFlasher.png"
  install -Dm644 "assets/icons/noos-flasher.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.chomiam.NoosFlasher.svg"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
