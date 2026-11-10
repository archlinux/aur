pkgbase=skwd-suite-bin
pkgname=(skwd-wall-v2-bin skwd-deck-bin skwd-paper-bin skwd-lens-bin)
pkgver=1.0.0_beta.29
pkgrel=1
pkgdesc='Prebuilt native Skwd wallpaper suite packages'
arch=(x86_64)
url='https://github.com/liixini/skwd-wall'
license=(MIT)
options=(!debug !strip)
source_x86_64=(
  'skwd-wall-v2-1.0.0_beta.29-1-x86_64.pkg.tar.zst::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.29/skwd-wall-v2-1.0.0_beta.29-1-x86_64.pkg.tar.zst'
  'skwd-deck-1.0.0_beta.29-1-x86_64.pkg.tar.zst::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.29/skwd-deck-1.0.0_beta.29-1-x86_64.pkg.tar.zst'
  'skwd-paper-1.0.0_beta.29-1-x86_64.pkg.tar.zst::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.29/skwd-paper-1.0.0_beta.29-1-x86_64.pkg.tar.zst'
  'skwd-lens-1.0.0_beta.29-1-x86_64.pkg.tar.zst::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.29/skwd-lens-1.0.0_beta.29-1-x86_64.pkg.tar.zst'
)
noextract=(
  'skwd-wall-v2-1.0.0_beta.29-1-x86_64.pkg.tar.zst'
  'skwd-deck-1.0.0_beta.29-1-x86_64.pkg.tar.zst'
  'skwd-paper-1.0.0_beta.29-1-x86_64.pkg.tar.zst'
  'skwd-lens-1.0.0_beta.29-1-x86_64.pkg.tar.zst'
)
sha256sums_x86_64=(
  '538d20274401cf7847b639f35509dce859bd208f04bf78da5dc7eb05acf573a5'
  '373f44404b2f2187b82d68ecd531ba527fa1d07dc9bdf588718c2e8c164a8180'
  'cb867f8a8f812ad27a7fb9f6b563cd1f71640c075e93c2f3e072eb1c00cd5584'
  '0a7022f596d5029d353c36f82d04bc8b839e5f383598b5398eed3155ce598555'
)

prepare() {
  local component archive
  while read -r component archive; do
    mkdir -p "$srcdir/$component"
    bsdtar -xf "$srcdir/$archive" -C "$srcdir/$component" \
      --exclude .BUILDINFO --exclude .MTREE --exclude .PKGINFO
  done <<EOF
wall skwd-wall-v2-1.0.0_beta.29-1-x86_64.pkg.tar.zst
deck skwd-deck-1.0.0_beta.29-1-x86_64.pkg.tar.zst
paper skwd-paper-1.0.0_beta.29-1-x86_64.pkg.tar.zst
lens skwd-lens-1.0.0_beta.29-1-x86_64.pkg.tar.zst
EOF
}

_install_prebuilt() {
  local component=$1
  mkdir -p "$pkgdir/usr"
  cp -a --no-preserve=ownership "$srcdir/$component/usr/." "$pkgdir/usr/"
}

package_skwd-wall-v2-bin() {
  pkgdesc='Prebuilt GPU-rendered graphical client for the Skwd wallpaper suite v2'
  depends=(fontconfig gcc-libs libxkbcommon skwd-deck-bin skwd-paper-bin vulkan-icd-loader wayland)
  optdepends=('skwd-lens-bin: semantic wallpaper search' 'skwd-paper-plasma: KDE Plasma wallpaper integration')
  provides=("skwd-wall-v2=$pkgver")
  conflicts=(skwd-wall-v2)
  _install_prebuilt wall
}

package_skwd-deck-bin() {
  pkgdesc='Prebuilt control daemon and tools for the Skwd wallpaper suite'
  install=skwd-deck.install
  depends=(gcc-libs skwd-paper-bin)
  optdepends=('skwd-deck-steamworks: Steam Client Workshop backend' 'skwd-drawing-model: default models for Drawing' 'skwd-lens-bin: semantic wallpaper search' 'steamcmd: alternative Steam Workshop backend')
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
