# Maintainer: Eugene Flanagin <eflanagin at pm dot me>
#
# Open-source GFXBench 5 (Kishonti Ltd; code BSD-3-Clause, benchmark assets CC BY 4.0).
# This is the Linux "developer" build: the command-line test runner (testfw_app),
# not the Qt GUI. Three runners are built and installed side by side:
#   /opt/gfxbench5/vk  Vulkan + desktop GL,  XCB display protocol  (--gfx xcb_vulkan | glfw)
#   /opt/gfxbench5/gl  OpenGL / GLES 3.1,    XCB display protocol  (--gfx glfw | egl)
#   /opt/gfxbench5/wl  OpenGL / GLES 3.1,    native Wayland (GLFW built with Wayland; --gfx egl)
# The ~3 GB of assets are shared (/opt/gfxbench5/data). Launchers: gfxbench5-{vk,gl,wl}.
#
# Size warning: the git source is large (~1.7 GB mirror + ~5.3 GB checkout) and the
# build tree needs another ~4 GB; the installed package is ~3 GB.

pkgname=gfxbench5-git
pkgver=5.1.5.r2.g89aa956
pkgrel=1
pkgdesc="GFXBench 5 GPU benchmark (open-source release), Vulkan/OpenGL/Wayland CLI runners"
arch=('x86_64')
url="https://github.com/Kishonti-Opensource/gfxbench"
license=('BSD-3-Clause' 'CC-BY-4.0')
depends=('glibc' 'gcc-libs'
         'libx11' 'libxcb' 'libglvnd' 'vulkan-icd-loader' 'wayland'
         # dlopen()ed at runtime by the bundled GLFW 3.4 (X11 and Wayland backends);
         # they never show up in ldd/namcap
         'libxrandr' 'libxcursor' 'libxinerama' 'libxi' 'libxkbcommon')
makedepends=('git' 'cmake' 'python' 'vulkan-headers' 'wayland-protocols'
             # linked by upstream's CMake (X11/GLFW/systeminfo) but dropped again by
             # -Wl,--as-needed, so build-time only
             'libxext' 'libsm' 'libice' 'libdrm')
optdepends=('vulkan-driver: Vulkan tests (gfxbench5-vk, vulkan_* test ids)'
            'opengl-driver: OpenGL / GLES tests'
            'libdecor: client-side window decorations for the Wayland runner')
provides=('gfxbench5')
conflicts=('gfxbench5')
source=("git+https://github.com/Kishonti-Opensource/gfxbench.git"
        '0001-poco-1.5.3-delegate-fix-assignment-operator.patch'
        '0002-cmake-drop-Werror.patch'
        '0003-poco-disable-net-and-openssl.patch'
        '0004-set-window-class-for-compositor-rules.patch')
sha256sums=('SKIP'
            'ecaeaae56061090f33785e3d62e0c3471486910577e84dbefa9b32127af2c29d'
            '1a521d7a8c5e3d114d6c1857177e228bca04104f21bc441ada05b6b84f3c50bd'
            'd04fd2d9ca5c1021bcb52fa8c1a615de29602395788b4b947d1c987161ed94f5'
            '36993733821ddef69fb20ba73cc4da903a5fc7c06b739337bee0e497ae50193d')

pkgver() {
  cd gfxbench
  # upstream has no tags; prefix the product version from ./product (5.1.5) so
  # the version stays meaningful: <product>.r<commits>.g<hash>
  local ver
  ver=$(sed -n 's/^PRODUCT_VERSION="\(.*\)"$/\1/p' product)
  printf '%s.r%s.g%s' "${ver:-0}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd gfxbench
  local p
  for p in "${source[@]}"; do
    [[ $p == *.patch ]] || continue
    patch -Np1 -i "$srcdir/$p"
  done
}

# Common environment for upstream's scripts/build*.sh wrappers.
_gfxbench_env() {
  export WORKSPACE="$srcdir/gfxbench"
  export NG_THIRDPARTY_ROOT="$WORKSPACE/out/3rdparty"
  export PLATFORM=linux CONFIG=Release
  # users may carry odd CC/CXX (clang, aocc, ...) in their environment; the tree is GCC-only
  export CC=gcc CXX=g++
  # the tree still has cmake_minimum_required() < 3.5 in places (CMake 4.x refuses them)
  export CMAKE_POLICY_VERSION_MINIMUM=3.5
  # frameworks/ngl: link the system Vulkan loader instead of the bundled 2016 one
  export VULKAN_LIB_PATH=/usr/lib
  # scripts/build.sh reads $EDITOR as its own "editor build" flag (true/false)
  export EDITOR=false
  # parallelism: let makepkg's MAKEFLAGS drive make (MP_COMPILE would force -j16)
  export MP_COMPILE=false
  export MAKEFLAGS="${MAKEFLAGS:--j$(nproc)}"
  # GCC 14+ turns these C diagnostics into errors; the old bundled glew/epoxy code trips them
  export CFLAGS="$CFLAGS -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types -Wno-error=int-conversion -Wno-error=implicit-int -Wno-error=return-mismatch"
}

# Build one testfw_app variant with upstream's scripts/build.sh into out/pkg-<variant>.
_gfxbench_variant() {
  local v=$1
  export NG_BUILD_ROOT="$WORKSPACE/out/build-$v"
  export NG_INSTALL_ROOT="$WORKSPACE/out/install-$v"
  export APPLICATION_TYPE=developer
  # no CUDA on a stock system: never build the cudaw wrapper (its public header
  # needs <cuda.h>); systeminfo's find_package(cudaw QUIET) is optional
  export DISABLED_PACKAGES="CUDAToolkit cudaw" SKIP_PROJECT=cudaw
  unset DISPLAY_PROTOCOL OGLX_VARIANT USE_WAYLAND
  case $v in
    # the vk build bundles the assets (BUNDLE_DATA); they are identical for every
    # variant, so gl/wl skip the 3 GB copy and package() takes data from pkg-vk
    vk) export PRODUCT_ID=gfxbench_vulkan BUNDLE_DATA=true ;;
    gl) export PRODUCT_ID=gfxbench_gl     BUNDLE_DATA=false ;;
    wl) export PRODUCT_ID=gfxbench_gl     BUNDLE_DATA=false \
               DISPLAY_PROTOCOL=WAYLAND OGLX_VARIANT=sys USE_WAYLAND=true ;;
  esac
  rm -rf "$WORKSPACE/tfw-pkg" "$WORKSPACE/out/pkg-$v"
  ./scripts/build.sh
  mv "$WORKSPACE/tfw-pkg" "$WORKSPACE/out/pkg-$v"
}

build() {
  cd gfxbench
  _gfxbench_env

  # 1. bundled third-party libraries (static): libepoxy zlib libpng poco AgilitySDK glew glfw(X11).
  #    "loader" is the bundled 2016 Vulkan loader (libvulkan-1.so): skipped, so the
  #    only loader the build can find is the system vulkan-icd-loader.
  #    Poco 1.5.3 predates C++17, hence -std=gnu++11 for this step only.
  NG_BUILD_ROOT="$WORKSPACE/out/build-3rdparty" NG_INSTALL_ROOT="$WORKSPACE/out/3rdparty" \
    CXXFLAGS="$CXXFLAGS -std=gnu++11" SKIP_PROJECT=loader \
    ./scripts/build-3rdparty.sh

  # 2. the two XCB variants (link the X11 GLFW just built)
  _gfxbench_variant vk
  _gfxbench_variant gl

  # 3. rebuild only GLFW with the Wayland backend, over the same prefix (this
  #    replaces libglfw3.a, so it must come after vk/gl), then the Wayland variant
  NG_BUILD_ROOT="$WORKSPACE/out/build-3rdparty-wl" NG_INSTALL_ROOT="$WORKSPACE/out/3rdparty" \
    CXXFLAGS="$CXXFLAGS -std=gnu++11" USE_WAYLAND=true \
    SKIP_PROJECT="libepoxy zlib libpng poco AgilitySDK glew loader" \
    ./scripts/build-3rdparty.sh
  _gfxbench_variant wl
}

package() {
  local out="$srcdir/gfxbench/out"
  local opt="$pkgdir/opt/gfxbench5"
  local v

  # shared benchmark assets (~3 GB), taken from the vk build (see _gfxbench_variant)
  install -d "$opt"
  cp -a "$out/pkg-vk/data" "$opt/data"

  for v in vk gl wl; do
    # plugins/ is probed at runtime (LibraryLoader); it is empty in this build
    install -d "$opt/$v"/{bin,config,plugins}
    install -m755 "$out/pkg-$v/bin/testfw_app" "$opt/$v/bin/testfw_app"
    install -m644 "$out/pkg-$v"/config/*.json "$opt/$v/config/"
    ln -s ../data "$opt/$v/data"
  done

  # launcher: one script, selected by the name it is invoked as
  cat > "$srcdir/gfxbench5-launcher" <<'EOF'
#!/bin/bash
# gfxbench5-{vk,gl,wl}: launchers for the open-source GFXBench 5 command-line runner (testfw_app).
# Usage: gfxbench5-<variant> [--list] [testfw_app args...]
#   vk : Vulkan (--gfx xcb_vulkan, auto-selected for vulkan_* test ids) or desktop GL (--gfx glfw)
#   gl : OpenGL / GLES 3.1 via GLFW (--gfx glfw, default) or EGL (--gfx egl)
#   wl : native Wayland build, EGL/GLES (--gfx egl, default; --gfx glfw is known to crash)
# Defaults added when absent: -w 1920 -h 1080, --gfx (see above) and --resultdir (see below).
# Examples:
#   gfxbench5-vk -t vulkan_5_high_off                      # 1080p offscreen Aztec Ruins High, ~64 s
#   gfxbench5-gl -t gl_manhattan31_off --ei -play_time=10000
#   gfxbench5-wl -t gl_5_normal_off
#   gfxbench5-vk -t gl_5_high -w 2560 -h 1440             # onscreen window (WM_CLASS/app_id "gfxbench")
# Test-specific overrides: --ei -play_time=<ms>  --ei -screenmode=0|1  --ei -fsaa=<n>  --ei -test_width=<px>
# One API per invocation (do not mix vulkan_* and gl_* test ids in one run).
# Environment:
#   GFXBENCH_RESULTS   where result JSON files go, one <timestamp>/ subdirectory per run
#                      (default: $XDG_DATA_HOME/gfxbench5/results, i.e. ~/.local/share/gfxbench5/results);
#                      /opt/gfxbench5 itself is read-only, so testfw_app's own default would fail
#   GFXBENCH_MANGOHUD  set to 1 to allow MangoHud; the default exports MANGOHUD=0 for clean numbers
export MANGOHUD=${GFXBENCH_MANGOHUD:-0}
V=${0##*-}
case $V in
  vk|gl|wl) ;;
  *) echo "usage: gfxbench5-{vk,gl,wl} [--list] [testfw_app args...]" >&2; exit 2 ;;
esac
B=/opt/gfxbench5/$V
case "${1:-}" in
  ""|--list|-l)
    echo "Test ids ($B/config):"; ls "$B/config" | sed 's/\.json$//' | column -c 110
    echo; echo "Run: gfxbench5-$V -t <test_id> [-t ...]   (see the header of $0 for options)"; exit 0 ;;
  -h|--help)
    exec "$B/bin/testfw_app" --help ;;
esac
gfx=0; w=0; vk=0; rd=0
for a in "$@"; do
  case "$a" in
    --gfx*) gfx=1 ;;
    -w*|--width*) w=1 ;;
    --resultdir*) rd=1 ;;
    -tvulkan_*|--test_id=vulkan_*|vulkan_*) vk=1 ;;
  esac
done
args=("$@")
if [ $gfx = 0 ]; then
  case $V in wl) g=egl ;; *) g=glfw ;; esac
  [ $vk = 1 ] && g=xcb_vulkan
  args=(--gfx "$g" "${args[@]}")
fi
[ $w = 0 ] && args=(-w 1920 -h 1080 "${args[@]}")
if [ $rd = 0 ]; then
  # testfw_app names result files <test_id>.json and only adds a per-run timestamp
  # directory when no --resultdir is given, so add one here to keep every run
  r=${GFXBENCH_RESULTS:-${XDG_DATA_HOME:-$HOME/.local/share}/gfxbench5/results}/$(date +%Y_%m_%d_%H_%M_%S)
  mkdir -p "$r" || exit 1
  args=(--resultdir "$r" "${args[@]}")
fi
cd "$B" || exit 1
exec "$B/bin/testfw_app" -b "$B" "${args[@]}"
EOF
  install -Dm755 "$srcdir/gfxbench5-launcher" "$opt/gfxbench5"
  install -d "$pkgdir/usr/bin"
  for v in vk gl wl; do
    ln -s /opt/gfxbench5/gfxbench5 "$pkgdir/usr/bin/gfxbench5-$v"
  done

  cd "$srcdir/gfxbench"
  install -Dm644 LICENSE   -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
