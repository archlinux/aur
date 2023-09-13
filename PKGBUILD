# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=freetype-gl
pkgver=20220922
pkgrel=2
pkgdesc='OpenGL text using one vertex buffer, one texture and FreeType'
arch=('x86_64')
url='https://github.com/rougier/freetype-gl'
license=('BSD')
depends=(freetype2 glew)
makedepends=(cmake git glfw imagemagick)
source=("git+$url#commit=513fa238357f7c11a9f427965fe336aae7955297")
b2sums=('SKIP')

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
        -Wno-dev
    cmake --build build
}

package() {
    cd $pkgname
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 build/makefont "$pkgdir/usr/bin/makefont"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
