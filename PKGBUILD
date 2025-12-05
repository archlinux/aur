# Maintainer: Cyrille Pontvieux <cyrille@enialis.net>
pkgbase=solarus
pkgname=(
  solarus
  solarus-launcher
  solarus-editor
)
pkgver=2.0.2
pkgrel=2
pkgdesc="A lightweight, free and open-source 2D game engine for Action-RPGs"
arch=("i686" "x86_64")
url="https://www.solarus-games.org/"
license=("GPL-3.0-only AND CC-BY-SA-3.0 AND CC-BY-SA-4.0")
makedepends=(
  "cmake"
  "zip"
)
source=(
  "https://gitlab.com/solarus-games/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz"
)
sha256sums=(
  'c5e0341387eb0b3012dff6f292f06f90dc86af44b41dfa94dac9a841de5f86b7'
)
_rootdir=$pkgname-v$pkgver

prepare() {
  set -x
  cd "$_rootdir"
  cmake \
    -Wno-dev \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_BUILD_TYPE=Release \
    -DSOLARUS_TESTS=OFF \
    -B build
  cp build/include/solarus/core/config.h include/solarus/core/
  (cd include && ln -sf ../third_party/glad/include/* ./)
  cd launcher
  cmake \
    -Wno-dev \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_BUILD_TYPE=Release \
    -DSOLARUS_DIR=.. \
    -DSOLARUS_LIBRARY=../build/libsolarus.so \
    -B build
  cd ../editor
  cmake \
    -Wno-dev \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_BUILD_TYPE=Release \
    -DSOLARUS_DIR=.. \
    -DSOLARUS_LIBRARY=../build/libsolarus.so \
    -B build
}

build() {
  cd "$_rootdir"
  cmake --build build
  cd launcher
  cmake --build build
  cd ../editor
  cmake --build build
}

package_solarus() {
  depends=(
    "glm"
    "hicolor-icon-theme"
    "libmodplug>=0.8.8.4"
    "libvorbis"
    "luajit>=2.0"
    "openal"
    "physfs"
    "sdl2>=2.0.18"
    "sdl2_image"
    "sdl2_ttf"
  )
  optdepends=(
    "solarus-launcher: GUI to play Solarus games"
    "solarus-editor: GUI to create Solarus games"
  )
  conflicts=("solarus-git" "solarus-run")
  provides=("solarus")
  make -C "$_rootdir/build" DESTDIR="${pkgdir}/" install
}

package_solarus-launcher() {
  depends=(
    "solarus"
    "qt6-base>6.7"
    "qt6-svg"
    "qt6-tools"
  )
  make -C "$_rootdir/launcher/build" DESTDIR="${pkgdir}/" install
}

package_solarus-editor() {
  depends=(
    "solarus"
    "qt6-base>6.7"
    "qt6-svg"
    "qt6-tools"
  )
  conflicts=("solarus-quest-editor")
  make -C "$_rootdir/editor/build" DESTDIR="${pkgdir}/" install
}
