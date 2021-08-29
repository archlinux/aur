# Maintainer: clerickx <clerickx@gmail.com>

pkgname=mcpelauncher-thesonicmaster
pkgver=20210813
pkgrel=1
pkgdesc="Minecraft Bedrock Linux launcher with license error fixed"
arch=("i686" "x86_64")
url="https://mcpelauncher.thesonicmaster.net/"
license=("GPL3")
depends=("curl" "libegl" "libevdev" "libpng" "libx11" "libxi" "libzip" "openssl" "protobuf" "qt5-base" "qt5-declarative" "qt5-quickcontrols" "qt5-quickcontrols2" "qt5-svg" "qt5-tools" "qt5-webengine" "zlib")
makedepends=("clang" "cmake" "ninja")
conflicts=("mcpelauncher-msa-git" "mcpelauncher-msa-ui-qt-git" "mcpelauncher-linux-git" "mcpelauncher-ui-git")
source=(""https://downloads.sourceforge.net/mcpelauncher-thesonicmaster/sources/${pkgname}-${pkgver}.tar.xz"")
sha256sums=("755d0743312446f6ea4e4da188c683c1d0d963c8ee813cb923628b1a1e353960")

build() {
  cd $pkgname-$pkgver/msa
  mkdir -p build && cd build
  CC=clang CXX=clang++ CFLAGS='-O3' CXXFLAGS='-O3' cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DENABLE_MSA_QT_UI=ON -Wno-dev -G Ninja ..
  ninja
  cd ../../mcpelauncher
  sed -i '22i#include <mutex>' mcpelauncher-linker/core/liblog/logger_write.cpp
  sed -i '26i#include <limits>' mcpelauncher-linker/core/libziparchive/zip_archive_stream_entry.cc
  mkdir -p build && cd build
  CC=clang CXX=clang++ CFLAGS='-O3' CXXFLAGS='-O3' cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DENABLE_QT_ERROR_UI=OFF -DJNI_USE_JNIVM=ON -Wno-dev -G Ninja ..
  ninja
  cd ../../mcpelauncher-ui
  mkdir -p build && cd build
  CC=clang CXX=clang++ CFLAGS='-O3' CXXFLAGS='-O3' cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DLAUNCHER_VERSION_CODE="ALPM" -Wno-dev -G Ninja ..
  ninja
}

package() {
  cd $pkgname-$pkgver/msa/build
  DESTDIR=$pkgdir ninja install
  cd ../../mcpelauncher/build
  DESTDIR=$pkgdir ninja install
  cd ../../mcpelauncher-ui/build
  DESTDIR=$pkgdir ninja install
}
