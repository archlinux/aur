# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: BlackEagle <ike.devolder@gmail.com>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=clementine
pkgver=1.4.1+27+g658f34ec4
pkgrel=1
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
source=("git+https://github.com/clementine-player/Clementine.git#commit=658f34ec40dde09b473bdda3d90050455e724fad")
sha256sums=('17076cfb4bc6ed771904ee99a57bcffaca55ee9983ebf9f41ef3e4fd0faf111d')

pkgver() {
  cd Clementine
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  export LDFLAGS="-Wl,--copy-dt-needed-entries"

  local _flags=(
    -DCMAKE_CXX_FLAGS="-fpermissive"
    -DCMAKE_CXX_STANDARD=17
    -DUSE_SYSTEM_PROJECTM=ON
    -DUSE_SYSTEM_TAGLIB=ON
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
