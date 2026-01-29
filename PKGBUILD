# Maintainer: Luan Camarim <luan3lcamarim@gmail.com>

pkgname=azaharplus-novulkan-git
pkgver=r10793.176135e9b
pkgrel=1
pkgdesc="AzaharPlus (Citra Fork) compiled without Vulkan support"
arch=('x86_64')
url="https://github.com/AzaharPlus/AzaharPlus"
license=('GPL2')

depends=(
  'qt6-base'
  'qt6-multimedia'
  'sdl2'
)
makedepends=(
  'git'
  'cmake'
  'qt6-tools'
)

provides=('azaharplus')
conflicts=('azaharplus' 'azaharplus-git')

source=('git+https://github.com/AzaharPlus/AzaharPlus.git')
sha256sums=('SKIP')

pkgver() {
  cd AzaharPlus
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd AzaharPlus
  git submodule update --init --recursive
}

build() {
  export CFLAGS+=" -fno-lto -Wno-error=free-nonheap-object -Wno-error=stringop-overflow"
  export CXXFLAGS+=" -fno-lto -Wno-error=free-nonheap-object -Wno-error=stringop-overflow"

  cmake -S AzaharPlus -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_VULKAN=OFF \
    -DENABLE_LTO=OFF \
    -DCITRA_USE_SYSTEM_LIBS=ON \
    -DENABLE_COMPATIBILITY_LIST_DOWNLOAD=ON

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # Ajusta arquivos .desktop (se existirem)
  if [ -d "$pkgdir/usr/share/applications" ]; then
    for f in "$pkgdir"/usr/share/applications/*.desktop; do
      [ -f "$f" ] || continue
      sed -i 's/^Exec=.*/Exec=azahar/' "$f"
      sed -i 's/^Name=.*/Name=AzaharPlus/' "$f"
    done
  fi

  # Remove arquivos que causam conflito com pacotes do sistema
  rm -rf "$pkgdir/usr/include/enet"
  rm -rf "$pkgdir/usr/lib/static"
  rm -f  "$pkgdir/usr/lib/libcitra_room.a"
}
