# Author: mosra <mosra@centrum.cz>
pkgname=(meshoptimizer gltfpack)
pkgver=1.2
pkgrel=1
_basis_pkgver=88e813c46b3ff42e56ef947b3fa11eeee7a504b0
pkgdesc='Mesh optimization library that makes meshes smaller and faster to render'
arch=(x86_64)
url='https://meshoptimizer.org'
license=(MIT)
depends=(glibc libgcc libstdc++)
makedepends=(cmake libwebp zstd)
source=("meshoptimizer-v$pkgver.tar.gz::https://github.com/zeux/meshoptimizer/archive/v$pkgver.tar.gz"
        # Use zeux's own fork that contains important fixes such as
        #   https://github.com/zeux/basis_universal/commit/36c8115064ef881d42c5dcd25d4da75ce66d53b3
        # and is used for the official gltfpack build as well. Deliberately
        # *not* using a Git clone because the history contains almost half a
        # gigabyte (!) of sample files.
        "basis-universal-${_basis_pkgver}.tar.gz::https://github.com/zeux/basis_universal/archive/${_basis_pkgver}.tar.gz"
        "use-system-zstd.patch")
sha256sums=('e40f71b809cdf3361b9a4def85fd44534e8733ce29d4b943c145b76859e4c2b4'
            '5855894bdd7e6b14bd419f6d632079bf4debeac2ac221b181cd06b1329d75ad9'
            'e773a16c8cf6ce14fa304c26162a3df18a143bbf76f2e8ee547d48fa4e24afa3')

prepare() {
    cd $srcdir/basis_universal-${_basis_pkgver}
    patch -p1 < "$srcdir/use-system-zstd.patch"

    # Fake an empty libwebp "CMake subproject". We however ultimately end up
    # using the one in /usr/lib and /usr/include, as the *.so is named the same
    # as the CMake subproject target, and the includes don't need any extra
    # prefix. Note that this only works in tandem with Basis enabled, where it
    # uses Basis internal PNG / JPEG decoders for converting those to WebP.
    # Without Basis, it peeks into `cwebp` internals for convering PNG / JPEG
    # to WebO, namely the private `imageio/image_dec.h` header.
    mkdir -p "$srcdir/libwebp"
    echo > "$srcdir/libwebp/CMakeLists.txt"
}

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
        -DMESHOPT_GLTFPACK_BASISU_PATH="$srcdir/basis_universal-${_basis_pkgver}" \
        -DMESHOPT_GLTFPACK_LIBWEBP_PATH="$srcdir/libwebp" \
        -DMESHOPT_SOVERSION=$pkgver \
        `# These are Basis options but they're only properly prefixed in` \
        `# later versions. (Meshoptimizer warns if Basis SSE isn't enabled).` \
        -DSSE=ON \
        `# Avoid Ninja as a dependency. This is the default, but the` \
        `# CMAKE_GENERATOR env var may override that.` \
        -G "Unix Makefiles"
    cmake --build . -j
}

package_meshoptimizer() {
    cd build
    DESTDIR=$pkgdir cmake --install .
    rm -r $pkgdir/usr/bin
}

package_gltfpack() {
    depends=(meshoptimizer libwebp zstd)
    pkgdesc='Automatically optimize glTF files to reduce the download size and improve loading and rendering speed'

    cd build
    DESTDIR=$pkgdir cmake --install .
    rm -r $pkgdir/usr/lib $pkgdir/usr/include
}
