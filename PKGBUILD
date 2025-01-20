# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=freetype-gl
pkgver=1.0
pkgrel=1
pkgdesc='OpenGL text using one vertex buffer, one texture and FreeType'
arch=('x86_64')
url='https://github.com/rougier/freetype-gl'
license=('LicenseRef-BSD-2-Clause-Freetype-GL')
depends=(freetype2 glew glibc libglvnd)
makedepends=(cmake)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('a44add2caff648cdbaefbc84cce005e5db64a7c7955089f4dd93f571647a91d383001826f355eab12d666273872d733582122ecf2e147d376ff08a6ef540c4c3')

build() {
    cd $pkgname-$pkgver
    # demos can't be built if BUILD_SHARED=True, because makefont will not find
    # freetype-gl.so.0 in /lib, and thus tests can't be built, because they require the demos,
    # they can be built if this package has already been installed
    cmake -B build \
        -DCMAKE_BUILD_TYPE='Release' \
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
    cd $pkgname-$pkgver
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 build/makefont "$pkgdir/usr/bin/makefont"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
