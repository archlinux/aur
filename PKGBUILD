# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=freetype-gl
pkgver=20240122
_commit=9543576aab0ee5d1f0c89d8280e9420ca3fc4a6e
pkgrel=1
pkgdesc='OpenGL text using one vertex buffer, one texture and FreeType'
arch=('x86_64')
url='https://github.com/rougier/freetype-gl'
license=('BSD')
depends=(freetype2 glew)
makedepends=(cmake git)
source=("git+$url#commit=$_commit")
b2sums=('cc999266664caba698cbf53595785486878b63a9fa9881ccd3dcad460551711c5a12d6de90b30d5cf8400c85ae7bcfd54a64c70f267af0fc93d6ad601c2d55ae')

pkgver() {
    cd $pkgname
    git log -n1 --pretty='format:%cd' --date=format:'%Y%m%d' $_commit
}

prepare() {
    cd $pkgname
    head -n -3 CMakeLists.txt > tmp.txt && mv tmp.txt CMakeLists.txt
}

build() {
    cd $pkgname
    # demos can't be built if BUILD_SHARED=True, because makefont will not find
    # freetype-gl.so.0 in /lib, and thus tests can't be built, because they require the demos
    # they can be built if this package has already been installed
    cmake -B build \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_SKIP_RPATH=YES \
        -Dfreetype-gl_BUILD_APIDOC=False \
        -Dfreetype-gl_BUILD_DEMOS=False \
        -Dfreetype-gl_BUILD_SHARED=True \
        -Dfreetype-gl_BUILD_TESTS=False \
        -Dfreetype-gl_USE_VAO=True \
        -Dfreetype-gl_WITH_GLAD=False \
        -Dfreetype-gl_WITH_GLEW=True \
        -Wno-dev
    cmake --build build
}

package() {
    cd $pkgname
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 build/makefont "$pkgdir/usr/bin/makefont"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
