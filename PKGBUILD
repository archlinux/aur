# Upstream: https://github.com/nkallen/plasticity (official .deb binary)
#
# Fork of plasticity-bin (M0N7Y5) with a build-time loader fix: upstream's kernel
# plugin dlopens libA3DLIBS.so by bare name with no RPATH, so the verbatim .deb
# payload cannot load the Parasolid kernel on stock Arch. This package applies
# patchelf --set-rpath '$ORIGIN' to the colocated kernel modules at build time;
# no user-side configuration required. Original maintainer declined the change
# upstream (see plasticity-diagnosis / MAINTAINER-REPORT in the project record).
# shellcheck shell=bash disable=SC2034,SC2154

pkgname="plasticity-4arch"  # D1 (closed 2026-08-26): AUR name confirmed available (web fallback: 404 + no search hit)
pkgver=26.1.4
pkgrel=1
pkgdesc="3D modeling software for concept artists (official .deb + working loader fix)"
arch=(x86_64)
url='https://github.com/nkallen/plasticity'
license=(LicenseRef-custom)

depends=(alsa-lib at-spi2-atk at-spi2-core atk cairo dbus desktop-file-utils expat
  gdk-pixbuf2 glib2 gtk3 gvfs hicolor-icon-theme libcups libdrm
  libnotify libx11 libxcb libxcomposite libxdamage libxext libxfixes
  libxkbcommon libxrandr mesa nspr nss openssl pango)
optdepends=(
  'discord: For communication with the devs'
  'apparmor: Extra protection'
  'pulseaudio: For sound'
)
makedepends=(patchelf)

source=(
  "https://github.com/nkallen/plasticity/releases/download/v${pkgver}/plasticity_${pkgver}_amd64.deb"
  "https://raw.githubusercontent.com/nkallen/plasticity/refs/tags/v${pkgver}/LICENSE"
)
sha512sums=(
  'fa27fb296caaee755ef3ecce42f158533d7e7c28d1cceeff49240e7c2b9c4b8d143e178d01767caa415423bffa8ce584af99e12bbfc64329182a507ba950c8d0'
  '1fbd6b24b4022331307ee3b8266fc6eee956238b5854633071848c145a044127f6d6eadc8c07c288c4dcd16c0de10e933ff21c5d8c715c273902cdeffded4bcd'
)

options=(!strip)

prepare() {
  # A .deb is an ar archive; extract its data payload for packaging.
  ar x "plasticity_${pkgver}_amd64.deb"
}

package() {
  # 1) Install the official payload verbatim.
  #    tar -xf (no compression flag): GNU tar auto-detects the zstd magic of
  #    the named file; -J is avoided because some tar builds have broken
  #    -J/zstd wiring (verified on the dev box).
  tar -xf data.tar.zst -C "$pkgdir"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  echo "https://www.plasticity.xyz/eula" > "${pkgdir}/usr/share/licenses/${pkgname}/EULA"

  # 2) Apply the loader fix — the entire reason this package exists.
  #    apply-loader-fix.sh lives next to this PKGBUILD.
  # shellcheck disable=SC1091
  source "$(dirname "${BASH_SOURCE[0]}")/apply-loader-fix.sh"
  apply_loader_fix "$pkgdir"
}
