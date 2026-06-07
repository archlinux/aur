# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=elio-git
_pkgname=elio
pkgver=1.8.0.r1.g2301146
pkgrel=1
pkgdesc='Snappy, batteries-included terminal file manager with rich previews, inline images, bulk actions, and trash support'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/elio-fm/elio'
license=('MIT')
depends=(
    'gcc-libs'
    'hicolor-icon-theme'
)
makedepends=(
    'cargo'
    'git'
)
options=(
    !lto
    !debug
)
optdepends=(
  'poppler: PDF metadata and rendered page previews'
  'ffmpeg: audio/video metadata, artwork, thumbnails, and ffprobe support'
  'resvg: SVG rasterization'
  '7zip: archive and comic archive preview fallback'
  'libarchive: archive and ISO listing fallback through bsdtar'
)
provides=('elio')
conflicts=('elio-bin' 'elio')
source=("$_pkgname-main::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}-main"
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}-main"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${_pkgname}-main"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${_pkgname}-main"
    install -Dm0755 target/release/elio "$pkgdir/usr/bin/elio"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
    if [[ -f "packaging/linux/elio.desktop" ]]; then
    install -Dm644 "packaging/linux/elio.desktop" "${pkgdir}/usr/share/applications/elio.desktop"
    for size in 48 128 256 512; do
      install -Dm644 "packaging/linux/icons/hicolor/${size}x${size}/apps/elio.png" \
        "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/elio.png"
    done
  fi
}

# vim: ts=4 sw=4 et:
