# Author: mosra <mosra@centrum.cz>
pkgname=magnum-plugins-git
pkgver=2020.06.r119.g15b8cac9
_basis_pkgver=2f43afcc97d0a5dafdb73b4e24e123cf9687a418
pkgrel=1
pkgdesc="Plugins for the Magnum C++11/C++14 graphics engine (Git version)"
arch=('i686' 'x86_64')
url="https://magnum.graphics"
license=('MIT')
depends=('magnum-git' 'devil' 'faad2' 'libpng' 'libjpeg' 'freetype2' 'assimp' 'meshoptimizer' 'spirv-tools' 'glslang')
makedepends=('cmake' 'git' 'ninja')
provides=('magnum-plugins')
conflicts=('magnum-plugins')
source=("git+git://github.com/mosra/magnum-plugins.git"
        # A commit that's before the UASTC support (which is not implemented
        # yet, because latest versions crash even on trivial tests)
        "https://github.com/BinomialLLC/basis_universal/archive/${_basis_pkgver}.tar.gz")
sha1sums=('SKIP'
          'b8d3995292c2c0bbedea943250087b0a9a92ca96')

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
        -DWITH_MESHOPTIMIZERSCENECONVERTER=ON \
        -DWITH_MINIEXRIMAGECONVERTER=ON \
        -DWITH_OPENGEXIMPORTER=ON \
        -DWITH_PNGIMAGECONVERTER=ON \
        -DWITH_PNGIMPORTER=ON \
        -DWITH_PRIMITIVEIMPORTER=ON \
        -DWITH_SPIRVTOOLSSHADERCONVERTER=ON \
        -DWITH_STANFORDIMPORTER=ON \
        -DWITH_STANFORDSCENECONVERTER=ON \
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
