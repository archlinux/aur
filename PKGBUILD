pkgname=vleer
pkgver=0.1.1
pkgrel=1
pkgdesc='Music, but without the subscription'
arch=('x86_64' 'aarch64')
url='https://vleer.app'
license=('AGPL-3.0-only')
depends=('alsa-lib' 'fontconfig' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'vulkan-icd-loader')
makedepends=('cargo' 'git')
optdepends=('wayland: Wayland support')
conflicts=('vleer-bin' 'vleer-nightly-bin' 'vleer-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vleerapp/vleer/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d3777ca27c29758a36613f696e7c6972e01bc5caf618ba926164ddfc63796b9c')

prepare() {
  cd "vleer-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
  sed -i "0,/^version = \".*\"$/s//version = \"${pkgver}\"/" Cargo.toml
}

build() {
  cd "vleer-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --profile dist --offline
}

package() {
  cd "vleer-${pkgver}"

  install -Dm755 target/dist/vleer "${pkgdir}/usr/bin/vleer"
  for size in 128 256 512; do
    install -Dm644 "assets/images/icon-${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/vleer.png"
  done
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/vleer.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Name=Vleer
Comment=Music, but without the subscription.
Exec=vleer %U
Icon=vleer
Terminal=false
Categories=AudioVideo;Audio;Player;
StartupWMClass=vleer
DESKTOP
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
