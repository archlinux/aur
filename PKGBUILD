# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: slbtty <shenlebantongying@gmail.com>

pkgname=goldendict-ng
pkgver=26.1.1
tagged_ver_suffix=5491ffca
tagged_ver=${pkgver}-Release.${tagged_ver_suffix}
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xiaoyifang/goldendict-ng/archive/refs/tags/v${tagged_ver}.tar.gz")
sha256sums=('e59b343b4ecd2b34c110797119e700a25628d0ef6c7f589511e411bcf85adf7d')

prepare() {
  # This flag leads to crashes around Oct 2022; remove this in future.
  export CXXFLAGS+=" -Wp,-U_GLIBCXX_ASSERTIONS"
}

build(){
  cd "$srcdir/$pkgname-${tagged_ver}"
  cmake -B build_dir -S . -G Ninja \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DUSE_SYSTEM_FMT=ON \
    -DUSE_SYSTEM_TOML=ON \
    -DWITH_FFMPEG_PLAYER=OFF \
    -Wno-dev
  cmake --build build_dir
}

package() {
  cd "$srcdir/$pkgname-${tagged_ver}"
  DESTDIR="$pkgdir" cmake --install ./build_dir/
}
