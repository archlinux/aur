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
pkgver=1.4.0rc1.r901.g7b678f26e.4.gf3ddd7eee
pkgrel=1
pkgdesc='A modern music player and library organizer'
url='http://www.clementine-player.org/'
license=(GPL)
arch=(x86_64)
depends=(chromaprint gst-plugins-base-libs libcdio libgpod liblastfm-qt5 libmtp libmygpo-qt5
         taglib protobuf qt5-x11extras projectm alsa-lib libpulse crypto++ hicolor-icon-theme)
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
  #git describe --long --tags --exclude 1.4.0rc1-* | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export LDFLAGS="-Wl,--copy-dt-needed-entries"
  cmake -B build -S Clementine -Wno-dev \
    -DCMAKE_CXX_FLAGS="-fpermissive" \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_SYSTEM_PROJECTM=ON \
    -DUSE_SYSTEM_TAGLIB=ON

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
