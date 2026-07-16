# Maintainer: objecity <objecity.nekoweb.org>
pkgname=azaharplus-git
pkgver=2125.0.A.r42.53579d09b
pkgrel=1
pkgdesc="AzaharPlus, an Azahar fork that adds extra features and functionality."
arch=('x86_64')
url="https://github.com/AzaharPlus/AzaharPlus"
license=('GPL2')

depends=(
  'alsa-lib'
  'jack'
  'pipewire'
  'sndio'
  'openssl'
  'libx11'
  'libxext'
  'libglvnd'
  'qt6-base'
  'qt6-multimedia'
  'qt6-multimedia-ffmpeg'
  'sdl2'
)
makedepends=(
    'base-devel'
    'clang'
	'cmake'
	'git'
    'xorg-server-devel'
	'qt6-tools'
    'qt6-translations'
)
provides=('azaharplus' 'azaharplus-git')
conflicts=('azaharplus' 'azaharplus-appimage' 'azaharplus-novulkan-git')

source=('AzaharPlus::git+https://github.com/AzaharPlus/AzaharPlus.git')
sha256sums=('SKIP')

pkgver() {
  cd AzaharPlus
  git describe --long --tags | sed 's/AZAHAR_PLUS_//; s/_/./g; s/\([^-]*\)-g/r\1./; s/-/./g'
}

prepare() {
  cd AzaharPlus
  git submodule update --init --recursive
  sed -i '/check_submodules_present()/d' CMakeLists.txt
}

build() {
  export CFLAGS+=" -fno-lto -march=native -Wno-error=free-nonheap-object -Wno-error=stringop-overflow"
  export CXXFLAGS+=" -fno-lto -march=native -Wno-error=free-nonheap-object -Wno-error=stringop-overflow"

  cmake -S AzaharPlus -B build \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D ENABLE_VULKAN=ON \
    -D ENABLE_LTO=OFF \
    -D CITRA_USE_PRECOMPILED_HEADERS=OFF \
    -D CITRA_WARNINGS_AS_ERRORS=OFF \
    -Wno-dev
  cmake --build build -j$(nproc)
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}


