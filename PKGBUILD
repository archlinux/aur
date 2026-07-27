# Maintainer: Anders Batsman <anders@andvision.se>
#
# moosic-bin — prebuilt binary release of moosic.
# Sources are closed; this PKGBUILD downloads the official tagged binary
# from dl.moosic.now and installs it system-wide.

pkgname=moosic-bin
_pkgname=moosic
pkgver=0.1.8
pkgrel=1
pkgdesc="Lightweight cross-platform retro-style audio player with Subsonic support"
arch=('x86_64' 'aarch64')
url="https://moosic.now"
license=('custom:proprietary')
depends=(
  'alsa-lib'
  'libgl'
  'libx11'
  'libxcursor'
  'libxrandr'
  'libxi'
  'fontconfig'
)
provides=('moosic')
conflicts=('moosic')
options=('!strip' '!debug')

# Remote binaries, named per CARCH so the same PKGBUILD covers both arches.
# The icon is also fetched from the release bucket — keeps the AUR repo
# under its 488 KiB per-blob limit and means we only ship the icon once.
source_x86_64=("${_pkgname}-${pkgver}-x86_64::https://dl.moosic.now/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64")
source_aarch64=("${_pkgname}-${pkgver}-aarch64::https://dl.moosic.now/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64")

# moosic.desktop is tiny (~300 bytes) — keep it in the AUR repo so the
# package builds even if R2 is briefly unreachable. The icon lives at the
# bucket root (version-independent), refreshed manually when branding
# changes.
source=(
  "moosic.desktop"
  "${_pkgname}.png::https://dl.moosic.now/icon.png"
)

# Replace SKIP values when bumping pkgver — see README.md in this directory.
sha256sums_x86_64=('fbee1f60d421d8d638ec9a22ca162867a26cd0133a4c9915d5a45b59ba9d68d4')
sha256sums_aarch64=('24173e310e2919aad2e8a133b0684eff6b8b25aef736a60e77d58a9b516a0dfd')
sha256sums=(
  'fe0f7721359cbf6c022a7be3350620df6ac9d8b85b7db2464b4260558d701ef8' # moosic.desktop
  '2397b6ad52802060ad69280ceb44ce4ebb190f53a64d87403c98ab9645b68d8d' # icon.png
)

package() {
  # Install the binary.
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-${CARCH}" \
    "${pkgdir}/usr/bin/${_pkgname}"

  # Desktop entry + icon for application menus.
  install -Dm644 "${srcdir}/moosic.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/moosic.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
}
