
pkgname=scopehal-apps-git
pkgver=0.0.f18ad75
pkgrel=1
pkgdesc="glscopeclient and other client applications for libscopehal"
arch=('x86_64')
url="https://github.com/glscopeclient/scopehal-apps"
license=('BSD')
groups=()
depends=('gtkmm3' 'libsigc++' 'ffts' 'openmp' 'glfw' 'libvulkan.so' 'yaml-cpp' 'glew' 'catch2' 'spirv-tools' 'shaderc' 'liblxi' 'linux-gpib')
makedepends=('cmake' 'git' 'vulkan-headers')
source=("git+https://github.com/glscopeclient/scopehal-apps.git"
        "modules.patch"
        "target_link_libraries.patch")
sha256sums=('SKIP'
            'afcabed21ee30a3b08b86c452e09f964632f9ac2a2ce6d9eeea430c3060748af'
            '39459c2f5b67968ca9b743e335026dc280e340ed6e3e4091ac26afd7d709f290')

pkgver() {
  cd "${srcdir}/scopehal-apps"
  echo "0.0."`git describe --always`
}

prepare() {
    patch "$srcdir/scopehal-apps/.gitmodules" modules.patch
	cd "$srcdir/scopehal-apps"
	git submodule update --init --recursive
    patch -p1 < "$srcdir"/target_link_libraries.patch
}

build() {
    cd "$srcdir/scopehal-apps"
    mkdir -p build
    cd build
    cmake .. \
      -DCMAKE_BUILD_TYPE=RELEASE \
      -DCMAKE_INSTALL_PREFIX=/usr
      # -DBUILD_DOCS=ON
    make
}

package() {
	cd "$srcdir/scopehal-apps/build"
	make DESTDIR="$pkgdir/" install
}
