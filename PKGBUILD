# Maintainer: Nathan <nate0001@gmail.com>

pkgname=ghastty-git
pkgver=1.3.2.r18156.gaea7dac7c
pkgrel=1
pkgdesc="A Qt6 frontend for Ghostty that embeds libghostty (Wayland-only)"
arch=('x86_64')
url="https://github.com/fuddlesworth/ghastty"
license=('MIT')
depends=(
  'ghostty-terminfo'           # xterm-ghostty terminfo (TERM=xterm-ghostty)
  'ghostty-shell-integration'  # /usr/share/ghostty/shell-integration scripts
                               # libghostty climbs /usr/bin/ghastty -> /usr/share
                               # to find them, exporting GHOSTTY_RESOURCES_DIR/
                               # TERMINFO to the shell (resourcesdir.zig/Exec.zig)
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

_zigver=0.16.0
_zig="zig-x86_64-linux-${_zigver}"
source=(
  "$pkgname::git+https://github.com/fuddlesworth/ghastty.git#branch=main"
  "https://ziglang.org/download/${_zigver}/${_zig}.tar.xz"
)
sha256sums=(
  'SKIP'
  '70e49664a74374b48b51e6f3fdfbf437f6395d42509050588bd49abe52ba3d00'
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

  # Pinned toolchain: this tree requires the exact Zig release named in
  # build.zig.zon (minimum_zig_version), and Arch's `zig` package moves
  # independently of it. Use the bundled release from the source array
  # (keep _zigver in sync with build.zig.zon) and keep Zig's package
  # cache inside the build dir.
  export PATH="$srcdir/$_zig:$PATH"
  export ZIG_GLOBAL_CACHE_DIR="$srcdir/.zig-cache"

  # 1. libghostty — ReleaseFast, app-runtime=none. The renderer is fixed
  #    at build time by -Drenderer= (opengl or vulkan; the Qt frontend
  #    compiles both host paths and asks the library which one it got).
  #    Produces zig-out/lib/ghostty-internal.so, which the Qt CMake links.
  #    Fetches Zig dependencies from deps.files.ghostty.org (needs network).
  zig build -Dapp-runtime=none -Doptimize=ReleaseFast -Drenderer=opengl

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
