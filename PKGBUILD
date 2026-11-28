# Maintainer: BlackCatOfficialytb <quanvm0501alt1@tutamail.com>
pkgname=twilightmc-snapshot-bin
pkgver=0.8.0.20261128.gb9e22ad
pkgrel=1
pkgdesc="TwilightMC Snapshot - Rust/Tauri Minecraft launcher (CLI + GUI), rolling main build"
arch=('x86_64' 'aarch64')
url="https://github.com/BlackCatOfficialytb/TwilightMC-OSS"
license=('AGPL-3.0-or-later' 'Apache-2.0')
depends=(
  'cairo'
  'dbus'
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
conflicts=('twilightmc' 'twilightmc-bin' 'twilightmc-git' 'twilightmc-star-bin' 'twilightmc-bolide-bin')
options=('!strip' '!debug' '!emptydirs')

_tag="snapshot"
_release_base="${url}/releases/download/${_tag}"

source=(
  "${pkgname}-icon.png::https://github.com/BlackCatOfficialytb/TwilightMC-OSS/blob/main/crates/twilight-ui/ui/public/logo.png?raw=true"
)
source_x86_64=(
  "twilight-snapshot-v0.8.0-28112026-b9e22ad-linux-gcc-x86_64.tar.zst::${_release_base}/twilight-snapshot-v0.8.0-28112026-b9e22ad-linux-gcc-x86_64.tar.zst"
)
source_aarch64=(
  "twilight-snapshot-v0.8.0-28112026-b9e22ad-linux-aarch64.tar.zst::${_release_base}/twilight-snapshot-v0.8.0-28112026-b9e22ad-linux-aarch64.tar.zst"
)
sha256sums=('4be2d2796ba5d85713db617bd22a9330ad76b0ee40a66bb06395c4615a3fdc5a')
sha256sums_x86_64=('329a2aefe79092c693575754aa79b717ca287de46bb7f0cf78dfde58ea492f73')
sha256sums_aarch64=('0c81bc506dc3b0e60d008d752277b6fbc228c6c19526140677d188b0ee96b716')

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
