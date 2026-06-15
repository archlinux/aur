# Maintainer: Cyrille Pontvieux <cyrille@enialis.net>
pkgbase=solarus
pkgname=(
  solarus
  solarus-launcher
  solarus-editor
)
pkgver=2.0.4
pkgrel=1
pkgdesc="A lightweight, free and open-source 2D game engine for Action-RPGs"
arch=("i686" "x86_64")
url="https://www.solarus-games.org/"
license=("GPL-3.0-only AND CC-BY-SA-3.0 AND CC-BY-SA-4.0")
makedepends=(
  "cmake"
  "zip"
)
source=("https://gitlab.com/solarus-games/$pkgbase/-/archive/v$pkgver/$pkgbase-v$pkgver.tar.gz")
sha256sums=('714f1d9db56f62059ec4ac58ba803985492ea62fdf6b005e8a5136a34b9b0107')
_rootdir=$pkgname-v$pkgver

prepare() {
  set -x
  cd "$_rootdir"
  (cd include/solarus && [ -e third_party ] || cp -a ../../third_party/glad/include third_party)
  cmake \
    -Wno-dev \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_BUILD_TYPE=Release \
    -DSOLARUS_TESTS=OFF \
    -B .
  (
    cd launcher
    cmake \
      -Wno-dev \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DCMAKE_BUILD_TYPE=Release \
      -DSOLARUS_DIR=.. \
      -DSOLARUS_LIBRARY=../libsolarus.so \
      -B .
  )
  (
    cd editor
    cmake \
      -Wno-dev \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DCMAKE_BUILD_TYPE=Release \
      -DSOLARUS_DIR=.. \
      -DSOLARUS_LIBRARY=../libsolarus.so \
      -B .
  )
}

build() {
  cd "$_rootdir"
  cmake --build .
  (cd launcher && cmake --build .)
  (cd editor && cmake --build .)
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
    "solarus-launcher: GUI to choose and run Solarus games"
    "solarus-editor: GUI to create Solarus games"
  )
  conflicts=("solarus-git" "solarus-run")
  provides=("solarus")
  make -C "$_rootdir" DESTDIR="${pkgdir}/" install
}

package_solarus-launcher() {
  depends=(
    "solarus"
    "qt6-base>6.7"
    "qt6-svg"
    "qt6-tools"
  )
  make -C "$_rootdir/launcher" DESTDIR="${pkgdir}/" install
}

package_solarus-editor() {
  depends=(
    "solarus"
    "qt6-base>6.7"
    "qt6-svg"
    "qt6-tools"
  )
  conflicts=("solarus-quest-editor")
  make -C "$_rootdir/editor" DESTDIR="${pkgdir}/" install
}
