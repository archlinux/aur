# Maintainer: MCbabel <https://github.com/MCbabel>
pkgname=steam-manifest-downloader
pkgver=1.3.0
pkgrel=1
pkgdesc="Download Steam game depots and manifests via a modern Tauri GUI"
arch=('x86_64')
url="https://github.com/MCbabel/Steam-Manifest-Downloader"
license=('GPL-2.0-or-later')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libappindicator-gtk3'
  'openssl'
)
makedepends=(
  'rust'
  'cargo'
  'pkgconf'
  'patchelf'
  'librsvg'
  'file'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5e2ad3ea9bb89b25904125ba90b10ee3bd1ecfe94b36f034e28585e3acdfc13d')

prepare() {
  cd "Steam-Manifest-Downloader-${pkgver}/src-tauri"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "Steam-Manifest-Downloader-${pkgver}/src-tauri"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Force GNU linker — rust-lld cannot link ring/zstd-sys native assembly objects
  export RUSTFLAGS="-C link-arg=-fuse-ld=bfd"
  cargo build --frozen --release
}

package() {
  cd "Steam-Manifest-Downloader-${pkgver}"

  # Install main binary (DepotDownloaderMod is embedded via include_bytes!)
  install -Dm755 "src-tauri/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Install desktop entry
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Categories=Utility;Game;
Exec=${pkgname}
Icon=${pkgname}
Name=Steam Manifest Downloader
Type=Application
Terminal=false
Comment=Download Steam game depots and manifests
EOF

  # Install icon
  install -Dm644 "assets/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"

  # Install license
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}