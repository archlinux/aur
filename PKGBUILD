pkgbase=skwd-suite-bin
pkgname=(skwd-wall-v2-bin skwd-deck-bin skwd-paper-bin skwd-lens-bin)
pkgver=1.0.0_beta.8
pkgrel=1
pkgdesc='Prebuilt native Skwd wallpaper suite packages'
arch=(x86_64)
url='https://github.com/liixini/skwd-wall'
license=(GPL-3.0-or-later)
options=(!debug !strip)
source_x86_64=(
  'skwd-wall-v2-1.0.0_beta.8-1-x86_64.pkg.tar.zst::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.8/skwd-wall-v2-1.0.0_beta.8-1-x86_64.pkg.tar.zst'
  'skwd-deck-1.0.0_beta.8-1-x86_64.pkg.tar.zst::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.8/skwd-deck-1.0.0_beta.8-1-x86_64.pkg.tar.zst'
  'skwd-paper-1.0.0_beta.8-1-x86_64.pkg.tar.zst::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.8/skwd-paper-1.0.0_beta.8-1-x86_64.pkg.tar.zst'
  'skwd-lens-1.0.0_beta.8-1-x86_64.pkg.tar.zst::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.8/skwd-lens-1.0.0_beta.8-1-x86_64.pkg.tar.zst'
)
noextract=(
  'skwd-wall-v2-1.0.0_beta.8-1-x86_64.pkg.tar.zst'
  'skwd-deck-1.0.0_beta.8-1-x86_64.pkg.tar.zst'
  'skwd-paper-1.0.0_beta.8-1-x86_64.pkg.tar.zst'
  'skwd-lens-1.0.0_beta.8-1-x86_64.pkg.tar.zst'
)
sha256sums_x86_64=(
  'e2c4807d4e8694b8d04478196256f4f1610f4f4251e7fb4a449bebf91475d97f'
  '90ba793694b27042fda46d4d7c9bb8fed4c121940f4dff4f8c8013a6b7bef133'
  'bf15ea937f51ca2f04c6ac5f75af541f9e651f3129fdd36202e8944e6f56fdfa'
  '5bd6a0c9b2e0541e3e9be3481438c099f82cca9862ebb8a95aef2e009f238495'
)

prepare() {
  local component archive
  while read -r component archive; do
    mkdir -p "$srcdir/$component"
    bsdtar -xf "$srcdir/$archive" -C "$srcdir/$component" \
      --exclude .BUILDINFO --exclude .MTREE --exclude .PKGINFO
  done <<EOF
wall skwd-wall-v2-1.0.0_beta.8-1-x86_64.pkg.tar.zst
deck skwd-deck-1.0.0_beta.8-1-x86_64.pkg.tar.zst
paper skwd-paper-1.0.0_beta.8-1-x86_64.pkg.tar.zst
lens skwd-lens-1.0.0_beta.8-1-x86_64.pkg.tar.zst
EOF
}

_install_prebuilt() {
  local component=$1
  mkdir -p "$pkgdir/usr"
  cp -a --no-preserve=ownership "$srcdir/$component/usr/." "$pkgdir/usr/"
}

package_skwd-wall-v2-bin() {
  pkgdesc='Prebuilt GPU-rendered graphical client for the Skwd wallpaper suite v2'
  depends=(gcc-libs libxkbcommon skwd-deck-bin=1.0.0_beta.8 skwd-paper-bin=1.0.0_beta.8 vulkan-icd-loader wayland)
  optdepends=('skwd-lens-bin: semantic wallpaper search' 'skwd-paper-plasma: KDE Plasma wallpaper integration')
  provides=("skwd-wall-v2=$pkgver")
  conflicts=(skwd-wall-v2)
  _install_prebuilt wall
}

package_skwd-deck-bin() {
  pkgdesc='Prebuilt control daemon and tools for the Skwd wallpaper suite'
  install=skwd-deck.install
  depends=(gcc-libs skwd-paper-bin=1.0.0_beta.8)
  optdepends=('skwd-deck-steamworks: Steam Client Workshop backend' 'skwd-lens-bin: semantic wallpaper search' 'steamcmd: alternative Steam Workshop backend')
  provides=("skwd-deck=$pkgver")
  conflicts=(skwd-deck)
  _install_prebuilt deck
}

package_skwd-paper-bin() {
  pkgdesc='Prebuilt still, video, and Wallpaper Engine renderers for Skwd'
  depends=(alsa-lib dav1d gcc-libs libdrm libglvnd libpulse libva libxkbcommon libyuv shaderc vulkan-icd-loader wayland zlib)
  
  provides=("skwd-paper=$pkgver")
  conflicts=(skwd-paper)
  _install_prebuilt paper
}

package_skwd-lens-bin() {
  pkgdesc='Prebuilt optional semantic wallpaper search engine for Skwd'
  depends=(gcc-libs skwd-lens-model)
  
  depends+=(skwd-lens-model)
  provides=("skwd-lens=$pkgver")
  conflicts=(skwd-lens)
  _install_prebuilt lens
}
