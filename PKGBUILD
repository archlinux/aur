# Maintainer: 
# Contributor: David Wu <xdavidwuph@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Ben Reedy <thebenj88@gmail.com>
# Contributor: Clement Guerin <geecko.dev@free.fr>
# Contributor: Thiago Kenji Okada <thiago.mast3r@gmail.com>
# Contributor: uberushaximus <uberushaximus@gmail.com>

pkgname=(
  ppsspp-git
  ppsspp-assets-git
)
pkgver=1.19.2.r189.1f2b4de6c1
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
  python
  sdl2
  sdl2_ttf
  snappy
  zlib
)
options=(!lto)
source=(
  git+https://github.com/hrydgard/ppsspp.git
  ppsspp-sdl.desktop
)
b2sums=('SKIP'
        'c6bcdfedee866dfdcc82a8c333c31ff73ed0beec65b63acec8bc8186383c0bc9f0912f21bb9715b665e8dc1793b1a85599761f9037856fa54ad8aa3bfdbfd468')

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

  # Rebuild ffmpeg locally
  pushd ppsspp/ffmpeg
  case "$CARCH" in
    x86_64)
      ./linux_x86-64.sh
      ;;
    aarch64)
      ./linux_arm64_native.sh
      ;;
  esac
  popd

  cmake -S ppsspp -B build-sdl -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_SKIP_RPATH=ON \
    -DHEADLESS=ON \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DUSE_SYSTEM_FFMPEG=OFF \
    -DUSE_SYSTEM_MINIUPNPC=OFF \
    -DUSE_SYSTEM_LIBZIP=ON \
    -DUSE_SYSTEM_SNAPPY=ON \
    -DUSE_SYSTEM_ZSTD=ON \
    -DUSING_QT_UI=OFF \
    -Wno-dev
  cmake --build build-sdl
}

package_ppsspp-git() {
  depends=(
    fontconfig
    gcc-libs
    glew
    glibc
    hicolor-icon-theme
    libgl
    libpng
    libzip
    ppsspp-assets-git
    sdl2
    sdl2_ttf
    snappy
    zlib
    zstd
  )
  provides=(ppsspp)
  conflicts=(ppsspp)
  install -Dm 755 build-sdl/PPSSPPSDL -t "${pkgdir}"/usr/bin/
  install -Dm 755 build-sdl/PPSSPPHeadless -t "${pkgdir}"/usr/bin/
  install -dm 755 "${pkgdir}"/usr/share/icons
  cp -dr --no-preserve=ownership ppsspp/icons/hicolor "${pkgdir}"/usr/share/icons/
  install -Dm 644 ppsspp/icons/icon-512.svg "${pkgdir}"/usr/share/pixmaps/ppsspp.svg
  install -Dm 644 ppsspp-sdl.desktop -t "${pkgdir}"/usr/share/applications/
}

package_ppsspp-assets-git() {
  provides=(ppsspp-assets)
  conflicts=(ppsspp-assets)
  install -dm 755 "${pkgdir}"/usr/share/ppsspp
  cp -dr --no-preserve=ownership build-sdl/assets "${pkgdir}"/usr/share/ppsspp/
}

# vim: ts=2 sw=2 et:
