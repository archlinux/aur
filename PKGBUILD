# Author: mosra <mosra@centrum.cz>
pkgname=magnum-plugins-git
pkgver=2020.06.r1061.g24295477
_basis_pkgver=1_15_update2
pkgrel=1
pkgdesc="Plugins for the Magnum C++11/C++14 graphics engine (Git version)"
arch=('i686' 'x86_64')
url="https://magnum.graphics"
license=('MIT')
depends=('magnum-git' 'devil' 'faad2' 'libpng' 'libjpeg' 'freetype2' 'assimp' 'meshoptimizer' 'openexr' 'spirv-tools' 'glslang' 'zstd' 'libwebp')
makedepends=('cmake' 'git' 'ninja')
provides=('magnum-plugins')
conflicts=('magnum-plugins')
source=("git+https://github.com/mosra/magnum-plugins.git"
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
        -DMAGNUM_WITH_ASSIMPIMPORTER=ON \
        -DMAGNUM_WITH_ASTCIMPORTER=ON \
        -DMAGNUM_WITH_BASISIMAGECONVERTER=ON \
        -DMAGNUM_WITH_BASISIMPORTER=ON \
        -DMAGNUM_WITH_CGLTFIMPORTER=ON \
        -DMAGNUM_WITH_DDSIMPORTER=ON \
        -DMAGNUM_WITH_DEVILIMAGEIMPORTER=ON \
        -DMAGNUM_WITH_DRFLACAUDIOIMPORTER=ON \
        -DMAGNUM_WITH_DRMP3AUDIOIMPORTER=ON \
        -DMAGNUM_WITH_DRWAVAUDIOIMPORTER=ON \
        -DMAGNUM_WITH_FAAD2AUDIOIMPORTER=ON \
        -DMAGNUM_WITH_FREETYPEFONT=ON \
        -DMAGNUM_WITH_GLSLANGSHADERCONVERTER=ON \
        -DMAGNUM_WITH_GLTFIMPORTER=ON \
        -DMAGNUM_WITH_GLTFSCENECONVERTER=ON \
        -DMAGNUM_WITH_ICOIMPORTER=ON \
        -DMAGNUM_WITH_JPEGIMPORTER=ON \
        -DMAGNUM_WITH_JPEGIMAGECONVERTER=ON \
        -DMAGNUM_WITH_KTXIMAGECONVERTER=ON \
        -DMAGNUM_WITH_KTXIMPORTER=ON \
        -DMAGNUM_WITH_MESHOPTIMIZERSCENECONVERTER=ON \
        -DMAGNUM_WITH_MINIEXRIMAGECONVERTER=ON \
        -DMAGNUM_WITH_OPENEXRIMAGECONVERTER=ON \
        -DMAGNUM_WITH_OPENEXRIMPORTER=ON \
        -DMAGNUM_WITH_OPENGEXIMPORTER=ON \
        -DMAGNUM_WITH_PNGIMAGECONVERTER=ON \
        -DMAGNUM_WITH_PNGIMPORTER=ON \
        -DMAGNUM_WITH_PRIMITIVEIMPORTER=ON \
        -DMAGNUM_WITH_SPIRVTOOLSSHADERCONVERTER=ON \
        -DMAGNUM_WITH_STANFORDIMPORTER=ON \
        -DMAGNUM_WITH_STANFORDSCENECONVERTER=ON \
        -DMAGNUM_WITH_STBDXTIMAGECONVERTER=ON \
        -DMAGNUM_WITH_STBIMAGECONVERTER=ON \
        -DMAGNUM_WITH_STBIMAGEIMPORTER=ON \
        -DMAGNUM_WITH_STBRESIZEIMAGECONVERTER=ON \
        -DMAGNUM_WITH_STBTRUETYPEFONT=ON \
        -DMAGNUM_WITH_STBVORBISAUDIOIMPORTER=ON \
        -DMAGNUM_WITH_STLIMPORTER=ON \
        -DMAGNUM_WITH_TINYGLTFIMPORTER=ON \
        -DMAGNUM_WITH_UFBXIMPORTER=ON \
        -DMAGNUM_WITH_WEBPIMPORTER=ON \
        -G Ninja
    ninja
}

package() {
    cd "$srcdir/build"
    DESTDIR="$pkgdir/" ninja install
}
