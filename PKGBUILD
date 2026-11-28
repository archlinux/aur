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

_tag="v${pkgver//~/}"
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
sha256sums=('SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  local _bin_path _root
  _bin_path="$(find "${srcdir}" -maxdepth 3 -type f -name 'twilight' -print -quit)"
  if [[ -z "${_bin_path}" ]]; then
    echo "ERROR: could not locate extracted 'twilight' binary in ${srcdir}" >&2
    return 1
  fi
  _root="$(dirname "${_bin_path}")"
  cd "${_root}"

  install -Dm755 twilight "${pkgdir}/usr/bin/twilight"
  install -Dm755 twilight-ui "${pkgdir}/usr/bin/twilight-ui"

  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/twilightmc.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=TwilightMC
Comment=Ultra-fast, zero-bloat Rust + Tauri v2 Minecraft launcher & client
Exec=twilight-ui %U
Icon=twilightmc
Terminal=false
Categories=Game;Utility;
DESKTOP

  install -Dm644 "${srcdir}/${pkgname}-${_tag}-icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/twilightmc.png"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 LICENSE.md LICENSE_AGPL LICENSE_APACHE CREDITS.md "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 README.md VERSION.md "${pkgdir}/usr/share/doc/${pkgname}/"
}
