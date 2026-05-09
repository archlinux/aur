# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: slbtty <shenlebantongying@gmail.com>

pkgname=goldendict-ng
pkgver=26.5.4
tagged_ver_suffix=ea1a9803
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
sha256sums=('4220f7b18df79adbeb1893f2cfb2b85fda1be37d68f68437c87a053ddb16efd2')

prepare() {
  # This flag leads to crashes around Oct 2022; remove this in future.
  export CXXFLAGS+=" -Wp,-U_GLIBCXX_ASSERTIONS"
}

build(){
  cd "$srcdir/$pkgname-${tagged_ver}"
  cmake -B build_dir -S . -G Ninja \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DWITH_FFMPEG_PLAYER=OFF \
    -Wno-dev
  cmake --build build_dir
}

package() {
  cd "$srcdir/$pkgname-${tagged_ver}"
  DESTDIR="$pkgdir" cmake --install ./build_dir/
}
