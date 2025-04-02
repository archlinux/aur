# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: BlackEagle <ike.devolder@gmail.com>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=clementine
pkgver=1.4.1+38+g1fc7fe0e1
pkgrel=2
pkgdesc='A modern music player and library organizer'
arch=(x86_64)
url="https://github.com/clementine-player/Clementine"
license=(GPL-3.0-or-later)
depends=(chromaprint gst-plugins-base-libs libcdio libgpod liblastfm-qt5 libmtp libmygpo-qt5
         protobuf qt5-x11extras projectm alsa-lib libpulse hicolor-icon-theme taglib

         # namcap implicit depends
         zlib glib2 sqlite libx11 gstreamer glibc gcc-libs abseil-cpp qt5-base fftw

         libprotobuf.so)
makedepends=(git boost cmake qt5-tools sparsehash)
optdepends=(
  'gst-plugins-base: "Base" plugin libraries'
  'gst-plugins-good: "Good" plugin libraries'
  'gst-plugins-bad: "Bad" plugin libraries'
  'gst-plugins-ugly: "Ugly" plugin libraries'
  'gst-libav: Libav plugin'
  'gvfs: Various devices support')
# NB commits are chosen corresponding a git tag https://github.com/clementine-player/Clementine/tags
source=("git+https://github.com/clementine-player/Clementine.git#commit=1fc7fe0e1e828a58f6a961aa4f75a7fbd7eb5786")
sha256sums=('7d956efe2e0be5fdf51ade47a44123f0debf5b289b29b8c790126e221e250920')

pkgver() {
  cd Clementine
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  sed -i 's/cmake_policy(SET CMP0053 OLD)/cmake_policy(SET CMP0026 NEW)/' Clementine/CMakeLists.txt
}

build() {
  export LDFLAGS="-Wl,--copy-dt-needed-entries"

  local _flags=(
    -DCMAKE_CXX_FLAGS="-fpermissive"
    -DCMAKE_CXX_STANDARD=17
    -DUSE_SYSTEM_PROJECTM=ON
    -DUSE_SYSTEM_TAGLIB=ON
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  )

  cmake -B build -S "Clementine" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
