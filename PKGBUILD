# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: slbtty <shenlebantongying@gmail.com>

pkgname=goldendict-ng
pkgver=25.5.0
true_ver=25.05.0-Release.2a2b0e16
pkgrel=1
pkgdesc='The Next Generation GoldenDict (supports Qt WebEngine & Qt6)'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/xiaoyifang/goldendict-ng'
license=('GPL-3.0-or-later')
depends=(hunspell
         libvorbis
         libxtst
         lzo
         zlib
         xz
         libeb
         tomlplusplus
         fmt
         opencc
         xapian-core
         libzim
         qt6-base
         qt6-svg
         qt6-multimedia
         qt6-webengine
         qt6-speech
         qt6-5compat)
makedepends=(git
             cmake
             ninja
             qt6-tools)
conflicts=('goldendict' 'goldendict-git' 'goldendict-ng-git' 'goldendict-svn' 'goldendict-git-opt')
provides=('goldendict')
replaces=('goldendict-svn' 'goldendict-git-opt' 'goldendict-webengine-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xiaoyifang/goldendict-ng/archive/refs/tags/v${true_ver}.tar.gz")
sha256sums=('5b3ecb662c44564b70f611f8e7e239c6642d5c66711134a1e210c310384251b5')

prepare() {
  # This flag leads to crashes around Oct 2022; remove this in future.
  export CXXFLAGS+=" -Wp,-U_GLIBCXX_ASSERTIONS"
}

build(){
  cd "$srcdir/$pkgname-${true_ver}"
  cmake -B build_dir -S . -G Ninja \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DUSE_SYSTEM_FMT=ON \
    -DUSE_SYSTEM_TOML=ON \
    -DWITH_FFMPEG_PLAYER=OFF \
    -Wno-dev
  cmake --build build_dir
}

package() {
  cd "$srcdir/$pkgname-${true_ver}"
  DESTDIR="$pkgdir" cmake --install ./build_dir/
}
