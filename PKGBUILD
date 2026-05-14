# Maintainer: MCbabel <https://github.com/MCbabel>
pkgname=steam-manifest-downloader
pkgver=1.4.2
pkgrel=1
pkgdesc="Download Steam game depots and manifests via a modern Tauri GUI"
arch=('x86_64')
url="https://github.com/MCbabel/Steam-Manifest-Downloader"
license=('GPL-2.0-or-later')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libayatana-appindicator'
  'openssl'
)
options=(!lto)
makedepends=(
  'rust'
  'cargo'
  'pkgconf'
  'patchelf'
  'librsvg'
  'file'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3fc7862896a2928d321dda439c43b297feefce9357adc37017638b954076d843')

prepare() {
  cd "Steam-Manifest-Downloader-${pkgver}/src-tauri"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "Steam-Manifest-Downloader-${pkgver}/src-tauri"
  export RUSTUP_TOOLCHAIN=stable
  export NO_STRIP=true
  export SMD_BUILD_CHANNEL=stable
  export SMD_BUILD_DATE="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
  cargo build --release --frozen
}

package() {
  cd "Steam-Manifest-Downloader-${pkgver}"

  install -Dm755 "src-tauri/target/release/steam-manifest-downloader" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "assets/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Categories=Utility;Game;
Exec=${pkgname}
Icon=${pkgname}
Name=Steam Manifest Downloader
Type=Application
Terminal=false
Comment=Download Steam game depots and manifests
EOF
}