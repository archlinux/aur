# Maintainer: fuddlesworth <fuddlesworth at users dot noreply dot github dot com>
#
# Built from main. The build fetches its pinned libraries (FFmpeg, OpenSSL, Vulkan-Headers, volk, VMA, hactool and
# the rest of cmake/dependencies.cmake) with CPM at configure time, each checked by SHA-256.

pkgname=scarletnx-git
pkgver=r2548.d42b41d
pkgrel=1
pkgdesc='Static recompiler that turns ARM64 and ARM32 programs into native code, like FEX-Emu in reverse'
arch=('x86_64' 'aarch64')
url='https://github.com/scarletnx/ScarletNX'
# ScarletNX, the AGB board (MPL-2.0), and what links into it statically: FFmpeg (LGPL), OpenSSL, hactool, lz4, zstd,
# enet, volk, VMA, lunasvg and plutovg. The shared fonts' stand-ins are OFL-1.1
license=(
    'GPL-3.0-or-later'
    'Apache-2.0'
    'BSD-2-Clause'
    'BSD-3-Clause'
    'FTL'
    'ISC'
    'LGPL-2.1-or-later'
    'MIT'
    'MPL-2.0'
    'OFL-1.1'
)
depends=(
    'glibc'
    'libgcc'
    'libstdc++'
    'hicolor-icon-theme'
    'llvm-libs'
    'sdl3'
    'vulkan-driver'
    'vulkan-icd-loader'
)
makedepends=(
    'clang'
    'cmake'
    'git'
    'llvm'
    'nasm'
    'ninja'
    'perl'
    'pkgconf'
    'python'
)
# glslang's release has prebuilt tools only for x86-64 (cmake/glsl.cmake), elsewhere the build takes the system's
makedepends_aarch64=('glslang')
provides=('scarletnx')
conflicts=('scarletnx')
# The build checks its own compiler flags (cmake/banned_flags.cmake), and the LTO flags of makepkg are GCC's
options=('!lto')
source=('git+https://github.com/scarletnx/ScarletNX.git')
sha256sums=('SKIP')

pkgver() {
    cd ScarletNX
    # The only tag is "nightly", which moves: count the commits instead
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    # Tuned for the machine that builds it, whatever makepkg.conf says: the flags below come after makepkg's, and win
    case "$CARCH" in
        x86_64) local arch_flags='-march=native -mtune=native' ;;
        aarch64) local arch_flags='-mcpu=native' ;;
    esac
    # CPM takes a package's folder in its cache as downloaded once the folder exists, so a configure that stopped
    # during a download leaves one that each later build fails on. The cache is complete only after a configure that
    # finished: without that mark, start it again. The build folder too, whose CMake cache names the CPM it loaded
    # (CPM_DIRECTORY): a CPM elsewhere then returns before it defines anything
    local cpm_cache="$srcdir/cpm-cache"
    if [[ ! -e "$cpm_cache/.complete" ]]; then
        rm -rf "$cpm_cache" build
    fi
    rm -f "$cpm_cache/.complete"
    # SNX_DEPLOY off: a build of the runtime otherwise copies it next to each game in the data folder of $HOME.
    # The O level is the project's (RelWithDebInfo's -O2 -g, after CFLAGS). The flags go in as -D, since CMake reads
    # CFLAGS only when it makes the build folder, which a rebuild keeps
    CC=clang CXX=clang++ cmake -S ScarletNX -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_C_FLAGS="$CFLAGS $arch_flags" \
        -DCMAKE_CXX_FLAGS="$CXXFLAGS $arch_flags" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCPM_SOURCE_CACHE="$cpm_cache" \
        -DSNX_DEPLOY=OFF \
        -DSNX_TRACY=OFF \
        -DBUILD_TESTING=OFF \
        -Wno-dev
    touch "$cpm_cache/.complete"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    # Seat access to the pads' event nodes and to the hidraw nodes of the console's controllers (docs/USAGE.md)
    install -Dm644 ScarletNX/dist/72-scarletnx-input.rules "$pkgdir/usr/lib/udev/rules.d/72-scarletnx-input.rules"
}
