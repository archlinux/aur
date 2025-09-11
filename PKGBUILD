# Maintainer: zaps166 <mumei6102@gmail.com>

pkgname=qmplay2-git
pkgver=25.09.11.r0.g94dcc1dd
pkgrel=1
pkgdesc='QMPlay2 is a video and audio player which can play most formats and codecs'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/zaps166/QMPlay2'
license=('LGPL')
depends=('qt6-base' 'qt6-svg' 'qt6-declarative' 'qt6-5compat' 'ffmpeg' 'libass' 'libgl' 'libva' 'libxv' 'alsa-lib' 'libcdio' 'taglib' 'libcddb' 'libpulse' 'libgme' 'libsidplayfp' 'pipewire' 'rubberband')
conflicts=('qmplay2')
provides=('qmplay2')
makedepends=('ninja' 'clang' 'llvm' 'lld' 'git' 'pkg-config' 'qt6-tools' 'cmake' 'fakeroot' 'shaderc')
options=(!lto)
source=(
    'git+https://github.com/zaps166/QMPlay2.git'
    'git+https://github.com/zaps166/QmVk.git'
    'git+https://github.com/KhronosGroup/Vulkan-Headers.git'
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
)

pkgver() {
    cd QMPlay2
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    mkdir -p QMPlay2-build
    cd QMPlay2
    git submodule init
    git config submodule.src/qmvk.url ../QmVk
    git config submodule.src/qmplay2/vulkan/headers.url ../Vulkan-Headers
    git -c protocol.file.allow=always submodule update
}

build() {
    cd QMPlay2-build
    cmake \
        -G Ninja \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        ../QMPlay2 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=OFF \
        -DUSE_PCH=ON \
        -DUSE_GLSLC=ON \
        -DUSE_GIT_VERSION=ON
    time ninja
}

package() {
    cd $srcdir/QMPlay2-build
    DESTDIR=$pkgdir ninja install
}
