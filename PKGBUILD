pkgname=scopehal-apps-git
pkgver=0.0.19bc636a
pkgrel=1
pkgdesc="glscopeclient and other client applications for libscopehal"
arch=('x86_64')
url="https://github.com/glscopeclient/scopehal-apps"
license=('BSD')
groups=()
depends=('gtkmm3' 'libsigc++' 'ffts' 'openmp' 'glfw' 'libvulkan.so' 'yaml-cpp' 'glew' 'catch2' 'spirv-tools' 'shaderc' 'liblxi' 'linux-gpib')
makedepends=('cmake' 'git' 'vulkan-headers')
source=("git+https://github.com/glscopeclient/scopehal-apps.git"
  "modules.patch")
sha256sums=('SKIP'
  '30f8bac9602eda284761339365d3c914c6fd661e70bb51c7675081e6aef5a27b')

pkgver() {
  cd "${srcdir}/scopehal-apps"
  echo "0.0."$(git describe --always)
}

prepare() {
  patch "$srcdir/scopehal-apps/.gitmodules" modules.patch
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
