# Maintainer: Cyrille Pontvieux <cyrille@enialis.net>
pkgbase=solarus
pkgname=(
  solarus
  solarus-launcher
  solarus-editor
)
pkgver=2.0.r20251111.434dc1c
# branch v2.0
_date=20251111
_commit=434dc1cfcac0e89d0ec46dc34c19e25f2dcc9482
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
  # "https://gitlab.com/solarus-games/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz"
  "https://gitlab.com/solarus-games/${pkgname}/-/archive/${_commit}/${pkgname}-${_commit}.tar.gz"
  "custom_editor.patch"
  "qt_desktop_filename.patch"
)
# _rootdir=$pkgname-v$pkgver
_rootdir=$pkgname-$_commit
sha256sums=(
  'SKIP'
  'a0f7fb7eb4d181fa794de762c532dca248151dc9363745803caee6e7d48f3ba0'
  '8732c20ef6b59e4e7860884e2a8414aa648f0dc82535bd1b2575e15fab6d558e'
)

pkgver() {
  cd "$_rootdir"
  printf "2.0.r%s.%s" "${_date}" "${_commit::7}"
}

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
  patch -p1 -i "$srcdir"/custom_editor.patch
  patch -p1 -i "$srcdir"/qt_desktop_filename.patch
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
