pkgname=scopehal-apps-git
pkgver=r3579.47ce3fbf
pkgrel=1
pkgdesc="glscopeclient and other client applications for libscopehal"
arch=('x86_64')
url="https://github.com/ngscopeclient/scopehal-apps"
license=('BSD-3-Clause')
groups=()
depends=('gtkmm3' 'libsigc++' 'ffts-git' 'openmp' 'glfw' 'yaml-cpp' 'glew' 'libsigc++-3.0' 'hidapi>=0.13.1')
# could be also built against 'libsigc++' (2.x version) instead of 'libsigc++-3.0', what should be our target?
optdepends=('libvulkan.so'  'spirv-tools' 'shaderc' 'liblxi' 'linux-gpib' )
makedepends=('cmake' 'git' 'vulkan-headers' 'catch2' 'lsb-release')
source=("git+https://github.com/ngscopeclient/scopehal-apps.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/scopehal-apps"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  sed -i 's%url = \.\./%url = https://github.com/ngscopeclient/%' "$srcdir/scopehal-apps/.gitmodules"
  cd "$srcdir/scopehal-apps"
  git submodule update --init --recursive
}

build() {
  cmake \
    -B build \
    -S "$srcdir/scopehal-apps" \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_INSTALL_PREFIX=/usr
  # -DBUILD_DOCS=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
