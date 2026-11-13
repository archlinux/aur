# Maintainer: 
# Contributor: David Wu <xdavidwuph@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ben Reedy <thebenj88@gmail.com>
# Contributor: Clement Guerin <geecko.dev@free.fr>
# Contributor: Thiago Kenji Okada <thiago.mast3r@gmail.com>

pkgname=(
  ppsspp-git
  ppsspp-assets-git
)
pkgver=1.20.4.r4907.1aebad2c65
pkgrel=1
pkgdesc='A PSP emulator written in C++'
arch=(x86_64 aarch64)
url=https://www.ppsspp.org/
license=(GPL-2.0-or-later)
makedepends=(
  clang
  cmake
  git
  glew
  glu
  libglvnd
  libpng
  libzip
  ninja
  openxr
  python
  sdl3
  sdl3_ttf
  snappy
  zlib
)
options=(!lto)
source=(
  git+https://github.com/hrydgard/ppsspp.git
)
b2sums=('SKIP')

pkgver() {
  cd ppsspp
  git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./'
}

prepare() {
  cd ppsspp
  git remote set-url origin https://github.com/hrydgard/ppsspp.git
  git submodule update --init --filter=tree:0 --recursive
}

build() {
  export CC=clang
  export CXX=clang++
  cmake -S ppsspp -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DHEADLESS=ON \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DUSE_SYSTEM_FFMPEG=OFF \
    -DUSE_SYSTEM_LIBZIP=ON \
    -DUSE_SYSTEM_MINIUPNPC=OFF \
    -DUSE_SYSTEM_SNAPPY=ON \
    -DUSE_SYSTEM_ZSTD=ON \
    -Wno-dev
  cmake --build build
}

package_ppsspp-git() {
  depends=(
    glew
    glibc
    hicolor-icon-theme
    libgcc
    libgl
    libpng
    libstdc++
    libzip
    openxr
    ppsspp-assets-git
    sdl2
    sdl2_ttf
    snappy
    zlib
    zstd
  )
  provides=(ppsspp)
  conflicts=(ppsspp)
  install -Dm 755 build/PPSSPPSDL -t "${pkgdir}"/usr/bin/
  install -Dm 755 build/PPSSPPHeadless -t "${pkgdir}"/usr/bin/
  install -dm 755 "${pkgdir}"/usr/share/icons
  cp -dr --no-preserve=ownership ppsspp/icons/hicolor "${pkgdir}"/usr/share/icons/
  install -Dm 644 ppsspp/icons/icon-512.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/ppsspp.svg
  install -Dm 644 ppsspp/SDL/PPSSPPSDL.desktop -t "${pkgdir}"/usr/share/applications/
}

package_ppsspp-assets-git() {
  provides=(ppsspp-assets)
  conflicts=(ppsspp-assets)
  install -dm 755 "${pkgdir}"/usr/share/ppsspp
  cp -dr --no-preserve=ownership build/assets "${pkgdir}"/usr/share/ppsspp/
}
