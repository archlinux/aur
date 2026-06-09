# Maintainer: Nathan <nate0001@gmail.com>

pkgname=ghastty-git
pkgver=1.3.2.r16698.g9ea732b61
pkgrel=1
pkgdesc="A Qt6 frontend for Ghostty that embeds libghostty (Wayland-only)"
arch=('x86_64')
url="https://github.com/fuddlesworth/ghastty"
license=('MIT')
depends=(
  'qt6-base'
  'qt6-multimedia'
  'qt6-svg'
  'qt6-wayland'
  'layer-shell-qt'
  'wayland'
  'libxkbcommon'
  'libglvnd'           # libEGL / libGL (OpenGL render path)
  'vulkan-icd-loader'  # libvulkan (runtime renderer selection)
)
makedepends=(
  'git'
  'cmake'
  'pkgconf'
  'vulkan-headers'
)
provides=('ghastty')
conflicts=('ghastty')
# !lto: the C++ frontend links a Zig-built libghostty.so; skip LTO to
# avoid mixing makepkg's LTO flags across the two toolchains.
# !debug: the Zig artifact isn't part of cmake's debug-split, so no -debug
# package is produced.
options=('!lto' '!debug')

_zigver=0.15.2
_zig="zig-x86_64-linux-${_zigver}"
source=(
  "$pkgname::git+https://github.com/fuddlesworth/ghastty.git#branch=main"
  "https://ziglang.org/download/${_zigver}/${_zig}.tar.xz"
)
sha256sums=(
  'SKIP'
  '02aa270f183da276e5b5920b1dac44a63f1a49e55050ebde3aecc9eb82f93239'
)

pkgver() {
  cd "$srcdir/$pkgname"
  local _ver
  _ver="$(sed -n 's/.*\.version = "\([^"-]*\).*/\1/p' build.zig.zon | head -1)"
  printf '%s.r%s.g%s' "${_ver:-0}" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

  # Pinned toolchain: this tree requires Zig 0.15.2 (build.zig.zon
  # minimum_zig_version), but Arch's `zig` tracks 0.16+, which does not
  # compile it. Use the bundled 0.15.2 from the source array and keep
  # Zig's package cache inside the build dir.
  export PATH="$srcdir/$_zig:$PATH"
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/.zig-cache"

  # 1. libghostty — ReleaseFast, both renderers (Linux app-runtime=none).
  #    Produces zig-out/lib/ghostty-internal.so, which the Qt CMake links.
  #    Fetches Zig dependencies from deps.files.ghostty.org (needs network).
  zig build -Dapp-runtime=none -Doptimize=ReleaseFast

  # 2. Qt6 frontend. CMAKE_INSTALL_LIBDIR=lib/ghastty keeps the private
  #    libghostty.so out of the top-level /usr/lib; the CMakeLists derives
  #    INSTALL_RPATH from the same variable, so the binary still resolves
  #    it at $ORIGIN/../lib/ghastty.
  cmake -S qt -B qt/build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib/ghastty \
    -Wno-dev
  cmake --build qt/build
}

package() {
  cd "$srcdir/$pkgname"
  DESTDIR="$pkgdir" cmake --install qt/build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
