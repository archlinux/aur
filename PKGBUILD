pkgbase=skwd-wall-v2
pkgname=(skwd-wall-v2 skwd-deck skwd-paper skwd-lens)
pkgver=1.0.0_beta.1
pkgrel=1
pkgdesc='Native Skwd wallpaper suite v2 packages'
arch=(x86_64)
url='https://github.com/liixini/skwd-wall/tree/v2'
license=(GPL-3.0-or-later)
makedepends=(
  cargo clang cmake gcc pkgconf curl nasm patchelf
  alsa-lib dav1d libdrm libglvnd libpulse libva libxkbcommon libyuv zlib
  qt6-base qt6-declarative shaderc vulkan-headers vulkan-icd-loader wayland wayland-protocols
)
options=(!debug !lto)
source=("skwd-suite-1.0.0~beta.1-4.fc44.src.rpm::https://download.copr.fedorainfracloud.org/results/piixini/skwd-wall-v2/srpm-builds/10933309/skwd-suite-1.0.0beta.1-4.fc44.src.rpm")
sha256sums=('0328cd4c438542ae5068007a7b288bccaa71004fad3c7d2959f991bb575437f6')

prepare() {
  bsdtar -xf "$srcdir/skwd-suite-1.0.0~beta.1-4.fc44.src.rpm" -C "$srcdir"
  bsdtar -xf "$srcdir/skwd-suite-1.0.0-beta.1.tar.xz" -C "$srcdir"
}

build() {
  cd "skwd-suite-1.0.0-beta.1"
  export CARGO_PROFILE_RELEASE_STRIP=symbols
  ./distribution/build.sh all
}

package_skwd-wall-v2() {
  pkgdesc='GPU-rendered graphical client for the Skwd wallpaper suite v2'
  depends=(gcc-libs libxkbcommon skwd-deck="$pkgver" skwd-paper="$pkgver" vulkan-icd-loader wayland)
  optdepends=('skwd-lens: semantic wallpaper search')
  cd "skwd-suite-1.0.0-beta.1"
  ./distribution/install.sh wall "$pkgdir"
}

package_skwd-deck() {
  pkgdesc='Control daemon and tools for the Skwd wallpaper suite v2'
  install=skwd-deck.install
  depends=(gcc-libs skwd-paper="$pkgver")
  optdepends=(
    'skwd-deck-steamworks: Steam Client Workshop backend'
    'skwd-lens: semantic wallpaper search'
    'steamcmd: alternative Steam Workshop backend'
  )
  cd "skwd-suite-1.0.0-beta.1"
  ./distribution/install.sh deck "$pkgdir"
}

package_skwd-paper() {
  pkgdesc='Still, video, and Wallpaper Engine renderers for Skwd v2'
  depends=(alsa-lib dav1d gcc-libs libdrm libglvnd libpulse libva libxkbcommon libyuv qt6-declarative shaderc vulkan-icd-loader wayland zlib)
  cd "skwd-suite-1.0.0-beta.1"
  ./distribution/install.sh paper "$pkgdir"
}

package_skwd-lens() {
  pkgdesc='Optional semantic wallpaper search engine for Skwd v2'
  depends=(gcc-libs skwd-lens-model)
  cd "skwd-suite-1.0.0-beta.1"
  ./distribution/install.sh lens "$pkgdir"
}
