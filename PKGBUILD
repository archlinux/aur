pkgbase=skwd-suite-bin
pkgname=(skwd-wall-v2-bin skwd-deck-bin skwd-paper-bin skwd-lens-bin)
pkgver=1.0.0_beta.9
pkgrel=1
pkgdesc='Prebuilt native Skwd wallpaper suite packages'
arch=(x86_64)
url='https://github.com/liixini/skwd-wall'
license=(GPL-3.0-or-later)
options=(!debug !strip)
source_x86_64=(
  'skwd-wall-v2-1.0.0_beta.9-1-x86_64.pkg.tar.zst::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.9/skwd-wall-v2-1.0.0_beta.9-1-x86_64.pkg.tar.zst'
  'skwd-deck-1.0.0_beta.9-1-x86_64.pkg.tar.zst::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.9/skwd-deck-1.0.0_beta.9-1-x86_64.pkg.tar.zst'
  'skwd-paper-1.0.0_beta.9-1-x86_64.pkg.tar.zst::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.9/skwd-paper-1.0.0_beta.9-1-x86_64.pkg.tar.zst'
  'skwd-lens-1.0.0_beta.9-1-x86_64.pkg.tar.zst::https://github.com/liixini/skwd-wall/releases/download/v1.0.0-beta.9/skwd-lens-1.0.0_beta.9-1-x86_64.pkg.tar.zst'
)
noextract=(
  'skwd-wall-v2-1.0.0_beta.9-1-x86_64.pkg.tar.zst'
  'skwd-deck-1.0.0_beta.9-1-x86_64.pkg.tar.zst'
  'skwd-paper-1.0.0_beta.9-1-x86_64.pkg.tar.zst'
  'skwd-lens-1.0.0_beta.9-1-x86_64.pkg.tar.zst'
)
sha256sums_x86_64=(
  '228e782a15d92feb96e9cc23310819db0022e1af63eebec6644b571480d93253'
  'd6fca8392e4d4f3244180eddc4b7c8aaeab9bf1baaa62af8036a67a81a3767fb'
  'bb1a9b7a66a26a28a48282a582dfe10e2ff28365cd73b1571947e0bddf7fe976'
  '3e6a75fffce334093cd8ce65a3427b51b49a15442ce2a0e5b811d3d7c2f0ed3d'
)

prepare() {
  local component archive
  while read -r component archive; do
    mkdir -p "$srcdir/$component"
    bsdtar -xf "$srcdir/$archive" -C "$srcdir/$component" \
      --exclude .BUILDINFO --exclude .MTREE --exclude .PKGINFO
  done <<EOF
wall skwd-wall-v2-1.0.0_beta.9-1-x86_64.pkg.tar.zst
deck skwd-deck-1.0.0_beta.9-1-x86_64.pkg.tar.zst
paper skwd-paper-1.0.0_beta.9-1-x86_64.pkg.tar.zst
lens skwd-lens-1.0.0_beta.9-1-x86_64.pkg.tar.zst
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
