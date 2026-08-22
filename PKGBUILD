# Maintainer: Cyrille Pontvieux <cyrille@enialis.net>
pkgbase=solarus
pkgname=(
  solarus
  solarus-launcher
  solarus-editor
)
pkgver=2.1.3
pkgrel=1
pkgdesc="A lightweight, free and open-source 2D game engine for Action-RPGs"
arch=("i686" "x86_64")
url="https://www.solarus-games.org/"
# changelogs
# - https://gitlab.com/solarus-games/solarus/-/blob/release-2.1.3/changelog.md
# - https://gitlab.com/solarus-games/solarus/-/blob/release-2.1.3/editor/changelog.md
# - https://gitlab.com/solarus-games/solarus/-/blob/release-2.1.3/launcher/changelog.md
license=("GPL-3.0-only AND CC-BY-SA-3.0 AND CC-BY-SA-4.0")
makedepends=(
  "cmake"
  "zip"
)
source=("https://gitlab.com/solarus-games/$pkgbase/-/archive/v$pkgver/$pkgbase-v$pkgver.tar.gz")
sha256sums=('be0c3d8de6b761ebce82ce913d407cd3ce68c6b2dda72ee489acdb6322ed768d')
_rootdir=$pkgname-v$pkgver

prepare() {
  set -x
  cd "$_rootdir"
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
    "luajit>=2.1"
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
    "qt6-base>6.8"
    "qt6-svg"
    "qt6-tools"
  )
  make -C "$_rootdir/launcher" DESTDIR="${pkgdir}/" install
}

package_solarus-editor() {
  depends=(
    "solarus"
    "qt6-base>6.8"
    "qt6-svg"
    "qt6-tools"
  )
  conflicts=("solarus-quest-editor")
  make -C "$_rootdir/editor" DESTDIR="${pkgdir}/" install
}
