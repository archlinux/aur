pkgbase=skwd-suite-bin
pkgname=(skwd-wall-v2-bin skwd-deck-bin skwd-paper-bin skwd-lens-bin)
pkgver=1.0.0_beta.5
pkgrel=1
pkgdesc='Prebuilt native Skwd wallpaper suite packages'
arch=(x86_64)
url='https://github.com/liixini/skwd-wall'
license=(GPL-3.0-or-later)
options=(!debug !strip)
source_x86_64=(
  'skwd-wall-v2-1.0.0_beta.5-1-x86_64.pkg.tar.zst::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.5/skwd-wall-v2-1.0.0_beta.5-1-x86_64.pkg.tar.zst'
  'skwd-deck-1.0.0_beta.5-1-x86_64.pkg.tar.zst::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.5/skwd-deck-1.0.0_beta.5-1-x86_64.pkg.tar.zst'
  'skwd-paper-1.0.0_beta.5-1-x86_64.pkg.tar.zst::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.5/skwd-paper-1.0.0_beta.5-1-x86_64.pkg.tar.zst'
  'skwd-lens-1.0.0_beta.5-1-x86_64.pkg.tar.zst::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.5/skwd-lens-1.0.0_beta.5-1-x86_64.pkg.tar.zst'
)
noextract=(
  'skwd-wall-v2-1.0.0_beta.5-1-x86_64.pkg.tar.zst'
  'skwd-deck-1.0.0_beta.5-1-x86_64.pkg.tar.zst'
  'skwd-paper-1.0.0_beta.5-1-x86_64.pkg.tar.zst'
  'skwd-lens-1.0.0_beta.5-1-x86_64.pkg.tar.zst'
)
sha256sums_x86_64=(
  'd2611e2c4b603b5ce9fc8a673aaa69a29edc0da691678cf2dc489688ca809c2f'
  '6d6828255d5c2c61eaab288259a0a2a68c526b3da97a36110dc11f6f7b485a05'
  '2b537e96b0c1ed8fb38e46af400512fea7468af378e46c79bc2046264a2f5f16'
  '93d9ce8fc503e13d9e951875ed0335c440c155d70bff775850267b1c7a79f363'
)

prepare() {
  local component archive
  while read -r component archive; do
    mkdir -p "$srcdir/$component"
    bsdtar -xf "$srcdir/$archive" -C "$srcdir/$component" \
      --exclude .BUILDINFO --exclude .MTREE --exclude .PKGINFO
  done <<EOF
wall skwd-wall-v2-1.0.0_beta.5-1-x86_64.pkg.tar.zst
deck skwd-deck-1.0.0_beta.5-1-x86_64.pkg.tar.zst
paper skwd-paper-1.0.0_beta.5-1-x86_64.pkg.tar.zst
lens skwd-lens-1.0.0_beta.5-1-x86_64.pkg.tar.zst
EOF
}

_install_prebuilt() {
  local component=$1
  mkdir -p "$pkgdir/usr"
  cp -a --no-preserve=ownership "$srcdir/$component/usr/." "$pkgdir/usr/"
}

package_skwd-wall-v2-bin() {
  pkgdesc='Prebuilt GPU-rendered graphical client for the Skwd wallpaper suite v2'
  depends=(gcc-libs libxkbcommon skwd-deck-bin=1.0.0_beta.5 skwd-paper-bin=1.0.0_beta.5 vulkan-icd-loader wayland)
  optdepends=('skwd-lens-bin: semantic wallpaper search' 'skwd-paper-plasma: KDE Plasma wallpaper integration')
  provides=("skwd-wall-v2=$pkgver")
  conflicts=(skwd-wall-v2)
  _install_prebuilt wall
}

package_skwd-deck-bin() {
  pkgdesc='Prebuilt control daemon and tools for the Skwd wallpaper suite'
  install=skwd-deck.install
  depends=(gcc-libs skwd-paper-bin=1.0.0_beta.5)
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
