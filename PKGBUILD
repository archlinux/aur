# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=soundux-git
pkgver=r1391.a4fc381
pkgrel=2
epoch=1
pkgdesc="A cross-platform soundboard - unstable development version"
arch=('any')
url="https://soundux.rocks"
license=('GPL3')
depends=('pulseaudio' 'webkit2gtk' 'libappindicator-gtk3' 'lsb-release')
optdepends=('youtube-dl: unmaintained downloader integration' 'yt-dlp-drop-in: recommended downloader integration' 'ffmpeg: downloader integration' 'pipewire: pipewire backend' 'libwnck3: icon support on X11')
makedepends=('git' 'pkgconf' 'cmake' 'ninja' 'pipewire')
conflicts=('soundux')
provides=('soundux')
source=("git+https://github.com/Soundux/Soundux.git")
sha256sums=('SKIP')
install=soundux.install

pkgver() {
  cd "${srcdir}/Soundux"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/Soundux"
  git submodule update --init --recursive
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
