# Maintainer: Lone_Wolf <Lone_Wolf@klaas-de-kat.nl>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=spirv-tools-git
pkgver=r3673.e0936b6
pkgrel=1
epoch=1
pkgdesc='API and commands for processing SPIR-V modules'
url='https://github.com/KhronosGroup/SPIRV-Tools'
arch=('i686' 'x86_64')
license=('custom')
groups=('vulkan-devel')
source=('git+https://github.com/KhronosGroup/SPIRV-Tools'
              'git+https://github.com/google/googletest.git'
              'git+https://github.com/google/effcee.git'
              'git+https://github.com/google/re2.git'
              'git+https://github.com/abseil/abseil-cpp.git'
)
sha1sums=('SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP')
depends=(glibc gcc-libs sh)
makedepends=(cmake python git spirv-headers-git)
conflicts=(spirv-tools)
provides=(spirv-tools)

prepare() {
  # link external sources so cmake can find them
  cd SPIRV-Tools/external
  ln -s "$srcdir"/googletest
  ln -s $srcdir/abseil-cpp abseil_cpp
  ln -s "$srcdir"/effcee
  ln -s "$srcdir"/re2
}

pkgver() {
  cd SPIRV-Tools
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}


build() {

  cmake \
    -S SPIRV-Tools -B _build \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_INSTALL_LIBDIR=lib \
    -D SPIRV-Headers_SOURCE_DIR=/usr/ \
    -D BUILD_SHARED_LIBS=ON \
    -D SPIRV_TOOLS_BUILD_STATIC=OFF \
    -D SPIRV_WERROR=OFF \
    -Wno-dev
  make -C _build
}

check() {
    make -C _build test
}

package() {
  
  make -C _build DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir"/SPIRV-Tools/LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
