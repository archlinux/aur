# Author: mosra <mosra@centrum.cz>
pkgname=meshoptimizer
pkgver=0.23
pkgrel=2
pkgdesc='Mesh optimization library that makes meshes smaller and faster to render'
arch=(x86_64)
url='https://github.com/zeux/meshoptimizer'
license=(MIT)
makedepends=(cmake)
# gltfpack-bin in AUR
provides=(gltfpack)
conflicts=(gltfpack)
source=("https://github.com/zeux/meshoptimizer/archive/v$pkgver.tar.gz")
sha256sums=('ac574107dd7e532ecfbea208fff9cd18fbcd1687f1d540ff8a798624ada453e0')

build() {
    mkdir -p build && cd build
    cmake "$srcdir/meshoptimizer-$pkgver" \
        `# Supply only what's in makepkg.conf, not CMake Release defaults` \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        `# Undo https://github.com/zeux/meshoptimizer/blob/f9cd9fdb053c2552a43b71f098962b649bcf3604/CMakeLists.txt#L121` \
        -DCMAKE_SKIP_RPATH=ON \
        -DMESHOPT_BUILD_SHARED_LIBS=ON \
        -DMESHOPT_BUILD_GLTFPACK=ON \
        `# Avoid Ninja as a dependency. This is the default, but the` \
        `# CMAKE_GENERATOR env var may override that.` \
        -G "Unix Makefiles"
    cmake --build . -j
}

package() {
    cd build
    cmake --install . --prefix $pkgdir
}
