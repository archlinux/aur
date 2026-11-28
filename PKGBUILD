# Maintainer: BlackCatOfficialytb <quanvm0501alt1@tutamail.com>
pkgname=twilightmc-bin
pkgver=0.8.0~b1
pkgrel=1
pkgdesc="TwilightMC launcher - Rust/Tauri Minecraft launcher (CLI + GUI), binary release"
arch=('x86_64' 'aarch64')
url="https://github.com/BlackCatOfficialytb/TwilightMC-OSS"
license=('AGPL-3.0-or-later' 'Apache-2.0')
depends=(
  'cairo'
  'desktop-file-utils'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'openssl'
  'webkit2gtk-4.1'
)
optdepends=(
  'java-runtime: required to launch Minecraft instances'
  'jre21-openjdk: recommended Java runtime for modern Minecraft versions'
)
provides=('twilightmc')
conflicts=('twilightmc' 'twilightmc-git' 'twilightmc-star-bin' 'twilightmc-bolide-bin' 'twilightmc-snapshot-bin')
options=('!strip' '!emptydirs')

# Xóa dấu '~' khỏi pkgver để ghép đúng tag v0.8.0b1 trên GitHub
_tag="v${pkgver//\~/}"
_release_base="${url}/releases/download/${_tag}"
_raw_base="https://raw.githubusercontent.com/BlackCatOfficialytb/TwilightMC-OSS/${_tag}"

source=(
  "${pkgname}-${_tag}-icon.png::${_raw_base}/crates/twilight-ui/ui/public/logo.png"
)
source_x86_64=(
  "twilight-${_tag}-linux-gcc-x86_64.tar.zst::${_release_base}/twilight-${_tag}-linux-gcc-x86_64.tar.zst"
)
source_aarch64=(
  "twilight-${_tag}-linux-aarch64.tar.zst::${_release_base}/twilight-${_tag}-linux-aarch64.tar.zst"
)
sha256sums=('4be2d2796ba5d85713db617bd22a9330ad76b0ee40a66bb06395c4615a3fdc5a')
sha256sums_x86_64=('8036117fef4a416dc7c88e5bcf7ed48cd0d052b9a986ec951fb811a3424c9379')
sha256sums_aarch64=('ef6e1903f72bf2ce36aef12df8feba2483c984682037d80ab6bee3f55d6f2245')

package() {
  cd "${srcdir}"

  # Cài đặt CLI và GUI
  install -Dm755 twilight "${pkgdir}/usr/bin/twilight"
  install -Dm755 twilight-ui "${pkgdir}/usr/bin/twilight-ui"

  # Desktop entry & Icon
  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/twilightmc.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=TwilightMC
Comment=Ultra-fast, zero-bloat Rust + Tauri v2 Minecraft launcher & client
Exec=twilight-ui %U
Icon=twilightmc
Terminal=false
Categories=Game;Utility;
EOF

  install -Dm644 "${pkgname}-${_tag}-icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/twilightmc.png"

  # Licenses & Docs
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 LICENSE.md LICENSE_AGPL LICENSE_APACHE "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 CREDITS.md "${pkgdir}/usr/share/licenses/${pkgname}/CREDITS.md"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 README.md VERSION.md "${pkgdir}/usr/share/doc/${pkgname}/"
}
