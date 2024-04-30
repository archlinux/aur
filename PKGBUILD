# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=freetype-gl
pkgver=20240429
_commit=cfddb99fc48cb944b21b832d7d9043d28ff1a4b6
pkgrel=2
pkgdesc='OpenGL text using one vertex buffer, one texture and FreeType'
arch=('x86_64')
url='https://github.com/rougier/freetype-gl'
license=('LicenseRef-BSD-2-Clause-Freetype-GL')
depends=(freetype2 glew glibc libglvnd)
makedepends=(cmake git)
source=("git+$url#commit=$_commit")
b2sums=('2ca96b1aa50f661a1d9b92f18aee87c1af3ef7ca5363e1c2d329c66aa46b8573644fe5fda680215870e945cb82d4d61ae9c7b2b08ac0d7b5827c30c59e3f3b60')

pkgver() {
    cd $pkgname
    git log -n1 --pretty='format:%cd' --date=format:'%Y%m%d'
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
    cd $pkgname
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 build/makefont "$pkgdir/usr/bin/makefont"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
