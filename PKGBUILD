# Maintainer:Bipin Kumar <kbipinkumar@pm.me>

pkgname=aevol
pkgver=9.3.0
_tag=${pkgver}
pkgrel=1
pkgdesc="an open-source digital genetics platform that captures the evolutionary process"
arch=('x86_64')
url="https://www.aevol.fr/"
license=('GPL-3.0-only')
depends=('boost-libs' 'glibc' 'gcc-libs' 'zlib' 'openmp' 'libx11')
makedepends=('boost' 'cmake' 'git' 'python' 'clang')

source=("$pkgname-$pkgver::git+https://gitlab.inria.fr/aevol/aevol.git#tag=${_tag}"
        'https://github.com/nlohmann/json/releases/download/v3.11.2/json.tar.xz'
        'googletest::git+https://github.com/google/googletest.git#tag=v1.14.0'
        )

sha256sums=('c90cb57c5d051d5c53dddb22f1653afe9421776ad2e1c806755fde9918c5db37'
            '8c4b26bf4b422252e13f332bc5e388ec0ab5c3443d24399acb675e68278d341f'
            'e5f89b43d9cc0916723695c8503430fdd5cc25e8bd50881dbd242cef468a0533')

prepare(){
  sed -i 's/cmake_minimum_required(VERSION 3.1)/cmake_minimum_required(VERSION 3.5)/' ${srcdir}/json/CMakeLists.txt
}

build() {
  cd "$pkgname-$pkgver"
  cmake -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_INSTALL_RPATH=YES \
    -DCMAKE_SKIP_RPATH=YES \
    -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
    -DFETCHCONTENT_SOURCE_DIR_JSON="$srcdir/json" \
    -DFETCHCONTENT_SOURCE_DIR_GOOGLETEST="$srcdir/googletest" \
    -Wno-dev \
    -DCMAKE_CXX_COMPILER=/usr/bin/clang++ \
    -DCMAKE_C_COMPILER=/usr/bin/clang

  cmake --build build
  
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" cmake --install build

}
