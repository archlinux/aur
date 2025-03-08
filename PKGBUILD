# Maintainer: Luis Marques <luigoalma@gmail.com>
# Taken and modified glfw package for lib32, original maintainers and contributors:
# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: philefou <tuxication AT gmail DOT com>
# Contributor: lindquist <tomas@famolsen.dk>
# Contributor: Christoph Siegenthaler <csi@gmx.ch>
# Contributor: Mihai Militaru <mihai.militaru@ephemeros.org>
# Contributor: SpepS <dreamspepser at yahoo dot it>

_pkgname=glfw
pkgname=lib32-glfw
pkgdesc="A free, open source, portable framework for graphical application development (32-bit)"
pkgver=3.4
pkgrel=2
arch=('x86_64')
replaces=('lib32-glfw-x11' 'lib32-glfw-wayland')
provides=('lib32-glfw-x11' 'lib32-glfw-wayland')
url="https://www.glfw.org/"
license=('custom:ZLIB')
depends=('lib32-libgl' 'lib32-libxkbcommon')
makedepends=('lib32-mesa' 'cmake' 'vulkan-headers' 'lib32-vulkan-icd-loader'
             'extra-cmake-modules' 'wayland-protocols' 'lib32-libxi' 'lib32-libxrandr'
             'lib32-libxcursor' 'lib32-libxinerama')
source=("glfw-${pkgver}.tar.gz"::"https://github.com/glfw/glfw/archive/${pkgver}.tar.gz")
sha512sums=('39ad7a4521267fbebc35d2ff0c389a56236ead5fa4bdff33db113bd302f70f5f2869ff4e6db1979512e1542813292dff5a482e94dfce231750f0746c301ae9ed')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cmake -B build -S "$_pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -DBUILD_SHARED_LIBS=ON \
    -DGLFW_BUILD_DOCS=OFF \
    -DGLFW_BUILD_EXAMPLES=OFF \
    -DGLFW_BUILD_TESTS=OFF \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  rm -rf "${pkgdir}"/usr/{bin,include,share}

  install -Dm644 "$_pkgname-$pkgver"/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

