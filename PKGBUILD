# Maintainer: Arthur HUGEAT <hugeat dot arthur at gmail dot com>
pkgname=gf-git
pkgver=0.20.0.r1483.6032fc5
pkgrel=2
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
  git checkout develop
	git submodule update --init
}

build() {
  cd "${srcdir}/gf"
  cmake -DGF_USE_EMBEDDED_LIBS=ON \
        -DGF_BUILD_GAMES=OFF \
        -DGF_BUILD_EXAMPLES=OFF \
        -DGF_BUILD_DOCUMENTATION=OFF \
        -DGF_SINGLE_COMPILTATION_UNIT=OFF \
        -DGF_DEBUG=OFF \
        -DCMAKE_BUILD_TYPE=RelWithDebug \
        -DCMAKE_INSTALL_PREFIX=/usr \
        .
  make
}

check() {
  cd "${srcdir}/gf"
  make test
}

package() {
	cd "${srcdir}/gf"

	make DESTDIR="$pkgdir/" install
	mv ${pkgdir}/usr/share/doc/GF ${pkgdir}/usr/share/doc/gf
	install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
