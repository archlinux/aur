# Maintainer: Arthur HUGEAT <hugeat dot arthur at gmail dot com>
pkgname=gf-git
pkgver=1.0.0.r1607.877e07e
pkgrel=1
pkgdesc="Gamedev Framework (gf) is a framework to build 2D games in C++17. It is based on SDL and OpenGL ES 2.0, and presents an API that is very similar to the graphics module of SFML with additional features (development version)."
arch=('x86_64' 'i686')
url="https://gamedevframework.github.io/"
license=('ZLIB')
depends=('sdl2' 'boost-libs' 'freetype2' 'zlib' 'pugixml')
makedepends=('boost' 'cmake' 'git')
provides=('gf')
conflicts=('gf')

source=("git+https://github.com/GamedevFramework/gf")
sha256sums=('SKIP')

pkgver() {
  VERSION=$(grep " VERSION" gf/CMakeLists.txt | tr -s " " | cut -f 3 -d " ")
  echo "${VERSION}.r$(git -C gf rev-list --count HEAD).$(git -C gf rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/gf"
  git checkout master
	git submodule update --init
}

build() {
  cd "${srcdir}/gf"
  cmake -DGF_DEBUG=OFF \
        -DGF_BUILD_EXAMPLES=OFF \
        -DGF_BUILD_DOCUMENTATION=OFF \
        -DGF_BUILD_GAMES=OFF \
        -DGF_USE_EMBEDDED_LIBS=ON \
        -DGF_SINGLE_COMPILTATION_UNIT=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -S ${srcdir}/gf \
        -B ${srcdir}/build
  cmake --build ${srcdir}/build --parallel
}

check() {
  ctest --test-dir ${srcdir}/build/tests
}

package() {
  cmake --install ${srcdir}/build --prefix ${pkgdir}/usr
	mv ${pkgdir}/usr/share/doc/GF ${pkgdir}/usr/share/doc/gf
	install -Dm644 ${srcdir}/gf/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
