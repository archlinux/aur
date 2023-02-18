# Maintainer: rafaelff <rafaelff@gnome.org>, WeirdBeard <obarrtimothy@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Themaister <maister@archlinux.us>

pkgname=pcsx2-git
pkgver=v1.7.4110.r0.gef31c733e
pkgrel=1
pkgdesc='A Sony PlayStation 2 emulator'
arch=(x86_64)
url=https://www.pcsx2.net
license=(
  GPL2
  GPL3
  LGPL2.1
  LGPL3
)

install=post.install

depends=(
  libaio
  libjpeg-turbo
  libpcap
  libzip
  libgl # For Steam Deck
  xorg-xrandr # For Steam Deck
  libxrender # For Steam Deck
  linux-api-headers # For Steam Deck
  libpulse
  ffmpeg
  portaudio
  libsamplerate
  sdl2
  rapidyaml
  qt6-base
  qt6-wayland
  qt6-tools
  qt6-svg
  soundtouch
  wayland
  zstd
)
makedepends=(
  cmake
  clang
  lld
  llvm
  git
  xorgproto
  ninja
  swig
  python
  vulkan-headers
)

provides=(pcsx2-qt)

conflicts=(pcsx2)

source=(
git+https://github.com/PCSX2/pcsx2.git
0001-Fix-resources-Fix-CMake.patch
)

prepare()
{
  cd pcsx2
  git submodule update --init --recursive
  git apply -3 "${srcdir}/0001-Fix-resources-Fix-CMake.patch"
}

pkgver()
{
  cd pcsx2
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
  mkdir -p build
  cd build

  cmake ../pcsx2 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_MODULE_LINKER_FLAGS_INIT="-fuse-ld=lld" \
    -DCMAKE_SHARED_LINKER_FLAGS_INIT="-fuse-ld=lld" \
    -DWAYLAND_API=ON \
    -DQT_BUILD=ON \
    -DUSE_VULKAN=ON \
    -DDISABLE_ADVANCE_SIMD=ON \
    -GNinja \
    -DPACKAGE_MODE=ON
  ninja -j$(nproc)

  cd ..
  cp -r pcsx2/.github/workflows/scripts/linux/pcsx2-qt.desktop build/bin/PCSX2.desktop
}

package()
{
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 pcsx2/pcsx2/Resources/AppIcon64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/PCSX2.png"
}

# vim: ts=2 sw=2 et:

sha256sums=('SKIP'
            'b69b3369e62bee6b6063b49621144343bb9ba81fd51f38e5e9bee4efbc731230'
)
