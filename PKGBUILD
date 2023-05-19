# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=soundux
pkgver=0.2.7
pkgrel=3
pkgdesc="A cross-platform soundboard - stable version"
arch=('any')
url="https://soundux.rocks"
license=('GPL3')
depends=('pulseaudio' 'webkit2gtk' 'libappindicator-gtk3' 'lsb-release')
optdepends=('youtube-dl: unmaintained downloader integration' 'yt-dlp-drop-in: recommended downloader integration' 'ffmpeg: downloader integration' 'pipewire: pipewire backend' 'libwnck3: icon support on X11')
makedepends=('pkgconf' 'cmake' 'ninja' 'pipewire')
source=("https://github.com/Soundux/Soundux/releases/download/$pkgver/soundux-$pkgver.tar.gz")
sha256sums=('017003fc96f49df30575975f3904c0d8a500e325a9d2bca8c3dc69fed0cab0a7')

prepare() {
  echo "add_definitions(-Wno-deprecated)" >> "$srcdir/Soundux/CMakeLists.txt"
  sed -i "/pthread.h/c\#include <pthread.h>\n#include <cstdint>" "$srcdir/Soundux/lib/guardpp/guard/include/core/linux/guard.hpp"
  sed -i "/target_compile_options/c\add_definitions(-w)" "$srcdir/Soundux/src/ui/impl/webview/lib/webviewpp/CMakeLists.txt"
}

build() {
  cd "${srcdir}/Soundux"
  mkdir -p build
  cd build
  
  cmake -GNinja -DCMAKE_BUILD_TYPE=Release ..
  ninja
}

package() {
  cd "${srcdir}/Soundux/build"
  DESTDIR="$pkgdir/" ninja install
  # install binary symlink
  mkdir -p "${pkgdir}/usr/bin/"
  ln -sf /opt/soundux/soundux "${pkgdir}/usr/bin/soundux"

  # install doc
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}/Soundux/README.md"
  # install license
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/Soundux/LICENSE"
}
