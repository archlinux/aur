# Author: mosra <mosra@centrum.cz>
pkgname=meshoptimizer
pkgver=0.25
pkgrel=1
pkgdesc='Mesh optimization library that makes meshes smaller and faster to render'
arch=(x86_64)
url='https://github.com/zeux/meshoptimizer'
license=(MIT)
makedepends=(cmake)
# gltfpack-bin in AUR
provides=(gltfpack)
conflicts=(gltfpack)
source=("https://github.com/zeux/meshoptimizer/archive/v$pkgver.tar.gz")
sha256sums=('68b2fef4e4eaad98e00c657c1e7f8982a7176e61dd7efdeaec67a025b8519be9')

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
    DESTDIR=$pkgdir cmake --install .
}
