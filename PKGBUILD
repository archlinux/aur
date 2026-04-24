# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=soundux-git
pkgver=0.2.7.r141.ge028452
pkgrel=1
epoch=1
pkgdesc="A cross-platform soundboard - unstable development version"
arch=('any')
url="https://soundux.rocks"
license=('GPL3')
depends=('pulse-native-provider' 'webkit2gtk-4.1' 'libappindicator-gtk3' 'lsb-release')
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
  git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/Soundux"
  git submodule update --init --recursive
  sed -i 's/webkit2gtk-4\.0/webkit2gtk-4.1/g' \
      src/ui/impl/webview/lib/webviewpp/CMakeLists.txt
}

build() {
  cd "${srcdir}/Soundux"
  mkdir -p build
  cd build
  cmake -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 ..
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
