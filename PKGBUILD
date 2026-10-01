pkgbase=skwd-suite-bin
pkgname=(skwd-wall-v2-bin skwd-deck-bin skwd-paper-bin skwd-lens-bin)
pkgver=1.0.0_beta.24
pkgrel=1
pkgdesc='Prebuilt native Skwd wallpaper suite packages'
arch=(x86_64)
url='https://github.com/liixini/skwd-wall'
license=(GPL-3.0-or-later)
options=(!debug !strip)
source_x86_64=(
  'skwd-wall-v2-1.0.0_beta.24-1-x86_64.pkg.tar.zst::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.24/skwd-wall-v2-1.0.0_beta.24-1-x86_64.pkg.tar.zst'
  'skwd-deck-1.0.0_beta.24-1-x86_64.pkg.tar.zst::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.24/skwd-deck-1.0.0_beta.24-1-x86_64.pkg.tar.zst'
  'skwd-paper-1.0.0_beta.24-1-x86_64.pkg.tar.zst::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.24/skwd-paper-1.0.0_beta.24-1-x86_64.pkg.tar.zst'
  'skwd-lens-1.0.0_beta.24-1-x86_64.pkg.tar.zst::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.24/skwd-lens-1.0.0_beta.24-1-x86_64.pkg.tar.zst'
)
noextract=(
  'skwd-wall-v2-1.0.0_beta.24-1-x86_64.pkg.tar.zst'
  'skwd-deck-1.0.0_beta.24-1-x86_64.pkg.tar.zst'
  'skwd-paper-1.0.0_beta.24-1-x86_64.pkg.tar.zst'
  'skwd-lens-1.0.0_beta.24-1-x86_64.pkg.tar.zst'
)
sha256sums_x86_64=(
  'a2dae047f2725a0758edc366dfe905bc4b3a7251197c8b40fc5d2e329ef9fd7c'
  '8758f13bc54652c1ad4492fc5ec710f123ee18c9b185e13eb156bc31a270641f'
  'fc5b6187ae46cd1e0ac9ce954b44f3b6ee1f9354270f7a343637bdd693f7a1cd'
  'e41031755f605c216d1c5de71af96d13bc5951421393e16eb57a7d9422e8346d'
)

prepare() {
  local component archive
  while read -r component archive; do
    mkdir -p "$srcdir/$component"
    bsdtar -xf "$srcdir/$archive" -C "$srcdir/$component" \
      --exclude .BUILDINFO --exclude .MTREE --exclude .PKGINFO
  done <<EOF
wall skwd-wall-v2-1.0.0_beta.24-1-x86_64.pkg.tar.zst
deck skwd-deck-1.0.0_beta.24-1-x86_64.pkg.tar.zst
paper skwd-paper-1.0.0_beta.24-1-x86_64.pkg.tar.zst
lens skwd-lens-1.0.0_beta.24-1-x86_64.pkg.tar.zst
EOF
}

_install_prebuilt() {
  local component=$1
  mkdir -p "$pkgdir/usr"
  cp -a --no-preserve=ownership "$srcdir/$component/usr/." "$pkgdir/usr/"
}

package_skwd-wall-v2-bin() {
  pkgdesc='Prebuilt GPU-rendered graphical client for the Skwd wallpaper suite v2'
  depends=(gcc-libs libxkbcommon skwd-deck-bin skwd-paper-bin vulkan-icd-loader wayland)
  optdepends=('skwd-lens-bin: semantic wallpaper search' 'skwd-paper-plasma: KDE Plasma wallpaper integration')
  provides=("skwd-wall-v2=$pkgver")
  conflicts=(skwd-wall-v2)
  _install_prebuilt wall
}

package_skwd-deck-bin() {
  pkgdesc='Prebuilt control daemon and tools for the Skwd wallpaper suite'
  install=skwd-deck.install
  depends=(gcc-libs skwd-paper-bin)
  optdepends=('skwd-deck-steamworks: Steam Client Workshop backend' 'skwd-lens-bin: semantic wallpaper search' 'steamcmd: alternative Steam Workshop backend')
  # Keep already-installed beta clients satisfiable during ordered updates.
  # Their version-1 IPC contracts remain supported by this provider.
  provides=(
    "skwd-deck=$pkgver"
    'skwd-deck-bin=1.0.0_beta.4'
    'skwd-deck-bin=1.0.0_beta.5'
    'skwd-deck-bin=1.0.0_beta.6'
    'skwd-deck-bin=1.0.0_beta.7'
    'skwd-deck-bin=1.0.0_beta.8'
  )
  conflicts=(skwd-deck)
  _install_prebuilt deck
}

package_skwd-paper-bin() {
  pkgdesc='Prebuilt still, video, and Wallpaper Engine renderers for Skwd'
  depends=(alsa-lib dav1d gcc-libs libdrm libglvnd libpulse libva libxkbcommon libyuv shaderc vulkan-icd-loader wayland zlib)
  
  # Keep already-installed beta clients satisfiable during ordered updates.
  # Their version-1 IPC contracts remain supported by this provider.
  provides=(
    "skwd-paper=$pkgver"
    'skwd-paper-bin=1.0.0_beta.4'
    'skwd-paper-bin=1.0.0_beta.5'
    'skwd-paper-bin=1.0.0_beta.6'
    'skwd-paper-bin=1.0.0_beta.7'
    'skwd-paper-bin=1.0.0_beta.8'
  )
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
