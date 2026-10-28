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
    # SNX_DEPLOY off: a build of the runtime otherwise copies it next to each game in the data folder of $HOME
    CC=clang CXX=clang++ cmake -S ScarletNX -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSNX_DEPLOY=OFF \
        -DSNX_TRACY=OFF \
        -DBUILD_TESTING=OFF \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    # Seat access to the pads' event nodes and to the hidraw nodes of the console's controllers (docs/USAGE.md)
    install -Dm644 ScarletNX/dist/72-scarletnx-input.rules "$pkgdir/usr/lib/udev/rules.d/72-scarletnx-input.rules"
}
