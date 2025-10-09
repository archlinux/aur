# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: BlackEagle <ike.devolder@gmail.com>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=clementine
pkgver=1.4.1+58+gbae968a2f
pkgrel=1
pkgdesc='A modern music player and library organizer'
arch=(x86_64)
url="https://github.com/clementine-player/Clementine"
license=(GPL-3.0-or-later)
depends=(chromaprint gst-plugins-base-libs libcdio libgpod liblastfm-qt5 libmtp
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
source=("git+https://github.com/clementine-player/Clementine.git#commit=bae968a2ff324fdcc1cbdb46305a6fd1b0460ef9")
sha256sums=('7e762377bfad8e9b06a3fa94ee8edd92ef2132defa8af6ecd9a65c9d900d5624')

pkgver() {
  cd Clementine
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  sed -i 's/cmake_policy(SET CMP0053 OLD)/cmake_policy(SET CMP0026 NEW)/' Clementine/CMakeLists.txt
}

build() {
  #export LDFLAGS="-Wl,--copy-dt-needed-entries"
  export CXXFLAGS+=" -Wno-error=cpp"

  local _flags=(
    #-DCMAKE_CXX_FLAGS="-fpermissive"
    #-DCMAKE_CXX_STANDARD=17
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
