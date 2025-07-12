# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: zan <zan@420blaze.it>
# Contributor: Jacob Henner <code@ventricle.us>
# Contributor: Eduardo Sánchez Muñoz
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: BlackEagle <ike.devolder@gmail.com>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

# Based on community/clementine PKGBUILD

pkgname=clementine-git
pkgver=1.4.1.r47.g488b6416e.0.g488b6416e
pkgrel=2
pkgdesc='A modern music player and library organizer'
arch=(x86_64)
url="https://github.com/clementine-player/Clementine"
license=(GPL-3.0-or-later)
depends=(chromaprint gst-plugins-base-libs libcdio libgpod liblastfm-qt5 libmtp
         protobuf qt5-x11extras projectm alsa-lib libpulse hicolor-icon-theme taglib

         # namcap implicit depends
         zlib glib2 sqlite libx11 gstreamer glibc gcc-libs abseil-cpp qt5-base fftw

         libprotobuf.so)
makedepends=(boost cmake git qt5-tools sparsehash)
optdepends=(
  'gst-plugins-base: "Base" plugin libraries'
  'gst-plugins-good: "Good" plugin libraries'
  'gst-plugins-bad: "Bad" plugin libraries'
  'gst-plugins-ugly: "Ugly" plugin libraries'
  'gst-libav: Libav plugin'
  'gvfs: Various devices support')
conflicts=(clementine)
provides=(clementine)
source=("git+https://github.com/clementine-player/Clementine.git")
sha256sums=('SKIP')

pkgver() {
  cd Clementine
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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

  cmake -B build -S Clementine -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
