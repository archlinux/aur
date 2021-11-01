# Author: mosra <mosra@centrum.cz>
pkgname=magnum-plugins-git
pkgver=2020.06.r378.g236c04a3
_basis_pkgver=1_15_update2
pkgrel=1
pkgdesc="Plugins for the Magnum C++11/C++14 graphics engine (Git version)"
arch=('i686' 'x86_64')
url="https://magnum.graphics"
license=('MIT')
depends=('magnum-git' 'devil' 'faad2' 'libpng' 'libjpeg' 'freetype2' 'assimp' 'meshoptimizer' 'openexr' 'spirv-tools' 'glslang' 'zstd')
makedepends=('cmake' 'git' 'ninja')
provides=('magnum-plugins')
conflicts=('magnum-plugins')
source=("git+git://github.com/mosra/magnum-plugins.git"
        "https://github.com/BinomialLLC/basis_universal/archive/v${_basis_pkgver}.tar.gz")
sha1sums=('SKIP'
          'b9615d48ebfc62a53f333ebf8a582558a058b0e9')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    # Bundle Basis Universal
    ln -sf $srcdir/basis_universal-${_basis_pkgver}/ "$srcdir/${pkgname%-git}/src/external/basis-universal"

    cmake "$srcdir/${pkgname%-git}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_ASSIMPIMPORTER=ON \
        -DWITH_BASISIMAGECONVERTER=ON \
        -DWITH_BASISIMPORTER=ON \
        -DWITH_CGLTFIMPORTER=ON \
        -DWITH_DDSIMPORTER=ON \
        -DWITH_DEVILIMAGEIMPORTER=ON \
        -DWITH_DRFLACAUDIOIMPORTER=ON \
        -DWITH_DRMP3AUDIOIMPORTER=ON \
        -DWITH_DRWAVAUDIOIMPORTER=ON \
        -DWITH_FAAD2AUDIOIMPORTER=ON \
        -DWITH_FREETYPEFONT=ON \
        -DWITH_GLSLANGSHADERCONVERTER=ON \
        -DWITH_ICOIMPORTER=ON \
        -DWITH_JPEGIMPORTER=ON \
        -DWITH_JPEGIMAGECONVERTER=ON \
        -DWITH_KTXIMAGECONVERTER=ON \
        -DWITH_KTXIMPORTER=ON \
        -DWITH_MESHOPTIMIZERSCENECONVERTER=ON \
        -DWITH_MINIEXRIMAGECONVERTER=ON \
        -DWITH_OPENEXRIMAGECONVERTER=ON \
        -DWITH_OPENEXRIMPORTER=ON \
        -DWITH_OPENGEXIMPORTER=ON \
        -DWITH_PNGIMAGECONVERTER=ON \
        -DWITH_PNGIMPORTER=ON \
        -DWITH_PRIMITIVEIMPORTER=ON \
        -DWITH_SPIRVTOOLSSHADERCONVERTER=ON \
        -DWITH_STANFORDIMPORTER=ON \
        -DWITH_STANFORDSCENECONVERTER=ON \
        -DWITH_STBDXTIMAGECONVERTER=ON \
        -DWITH_STBIMAGECONVERTER=ON \
        -DWITH_STBIMAGEIMPORTER=ON \
        -DWITH_STBTRUETYPEFONT=ON \
        -DWITH_STBVORBISAUDIOIMPORTER=ON \
        -DWITH_STLIMPORTER=ON \
        -DWITH_TINYGLTFIMPORTER=ON \
        -G Ninja
    ninja
}

package() {
    cd "$srcdir/build"
    DESTDIR="$pkgdir/" ninja install
}
