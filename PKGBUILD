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
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'libsoup3'
  'openssl'
  'webkit2gtk-4.1'
)
optdepends=(
  'java-runtime: required to launch Minecraft instances'
  'jre21-openjdk: recommended Java runtime for modern Minecraft versions'
)
provides=('twilightmc' 'twilight' 'twilight-ui')
conflicts=('twilightmc' 'twilightmc-git' 'twilightmc-star-bin' 'twilightmc-bolide-bin' 'twilightmc-snapshot-bin')
options=('!strip' '!emptydirs')

_tag="v${pkgver//[~]/}"
_release_base="${url}/releases/download/${_tag}"

source=(
  "${pkgname}-icon.png::https://github.com/BlackCatOfficialytb/TwilightMC-OSS/blob/main/crates/twilight-ui/ui/public/logo.png?raw=true"
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
  local _bin_path _root _doc
  _bin_path="$(find "${srcdir}" -maxdepth 3 -type f -name 'twilight' -print -quit)"
  if [[ -z "${_bin_path}" ]]; then
    echo "ERROR: could not locate 'twilight' binary in ${srcdir}" >&2
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
Categories=Game;
DESKTOP

  install -Dm644 "${srcdir}/${pkgname}-icon.png" "${pkgdir}/usr/share/pixmaps/twilightmc.png"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  for _doc in LICENSE.md LICENSE_AGPL LICENSE_APACHE CREDITS.md; do
    if [[ -f "${_doc}" ]]; then
      install -Dm644 "${_doc}" "${pkgdir}/usr/share/licenses/${pkgname}/${_doc}"
    fi
  done

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  for _doc in README.md VERSION.md; do
    if [[ -f "${_doc}" ]]; then
      install -Dm644 "${_doc}" "${pkgdir}/usr/share/doc/${pkgname}/${_doc}"
    fi
  done
}
