# Maintainer:Bipin Kumar <kbipinkumar@pm.me>

pkgname=aevol
pkgver=9.1
_tag=v${pkgver}
pkgrel=1
pkgdesc="an open-source digital genetics platform that captures the evolutionary process"
arch=('x86_64')
url="https://www.aevol.fr/"
license=('GPL-3.0-only')
depends=('boost-libs' 'glibc' 'gcc-libs' 'zlib' 'libx11')
makedepends=('boost' 'cmake' 'git' 'python')

source=("$pkgname-v$pkgver::git+https://gitlab.inria.fr/aevol/aevol.git#tag=${_tag}"
        'https://github.com/nlohmann/json/releases/download/v3.11.2/json.tar.xz'
        'googletest::git+https://github.com/google/googletest.git#tag=v1.14.0'
        'cmake_min_version.patch')

sha256sums=('18d4c057f354d6eac891be0d89970daa8e4c4ccb891a6854a28c52193877e0b9'
            '8c4b26bf4b422252e13f332bc5e388ec0ab5c3443d24399acb675e68278d341f'
            'e5f89b43d9cc0916723695c8503430fdd5cc25e8bd50881dbd242cef468a0533'
            'ec3d1f64d5340d179787d71b551572c745b4923c2766283c7527073143bc4fa1')

prepare(){
  sed -i 's/cmake_minimum_required(VERSION 3.1)/cmake_minimum_required(VERSION 3.5)/' ${srcdir}/json/CMakeLists.txt
  cp cmake_min_version.patch "$pkgname-v$pkgver"/
  cd "$pkgname-v$pkgver"
  patch -p1 < cmake_min_version.patch
}

build() {
  cd "$pkgname-v$pkgver"
  cmake -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_INSTALL_RPATH=YES \
    -DCMAKE_SKIP_RPATH=YES \
    -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
    -DFETCHCONTENT_SOURCE_DIR_JSON="$srcdir/json" \
    -DFETCHCONTENT_SOURCE_DIR_GOOGLETEST="$srcdir/googletest" \
    -Wno-dev

  cmake --build build
  
}

package() {
  cd "$pkgname-v$pkgver"
  DESTDIR="$pkgdir" cmake --install build

}
