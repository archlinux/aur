# Maintainer: fazzi (faaris <dot> ansari <at> proton <dot> me)
# Original glfw package: Sven-Hendrik Haase <svenstaro@archlinux.org>

pkgname=glfw-waywall
pkgdesc="A free, open source, portable framework for graphical application development (wayland for waywall)"
pkgver=3.4
pkgrel=1
arch=('x86_64')
conflicts=('glfw' 'glfw-wayland' 'glfw-wayland-minecraft-libdecoration' 'glfw-wayland-minecraft-cursorfix')
provides=("glfw=$pkgver")
url="https://www.glfw.org/"
license=('custom:ZLIB')
depends=('libgl' 'libxkbcommon')
makedepends=('mesa' 'cmake' 'doxygen' 'vulkan-headers' 'vulkan-icd-loader' 'extra-cmake-modules'
             'wayland-protocols' 'libxi' 'libxrandr' 'libxcursor' 'libxinerama')
source=("$pkgname-$pkgver.tar.gz::https://github.com/glfw/glfw/archive/${pkgver}.tar.gz"
				"https://raw.githubusercontent.com/tesselslate/waywall/refs/heads/main/doc/assets/glfw.patch")
sha512sums=('39ad7a4521267fbebc35d2ff0c389a56236ead5fa4bdff33db113bd302f70f5f2869ff4e6db1979512e1542813292dff5a482e94dfce231750f0746c301ae9ed'
						'7fb3ccfce656e56fbacd602098df010374cc348850b94cd02eed81cded78665868ce0a81df564d066bdb8f4557f52f98fb383618e3f064484ff70e4f129ca0d1')

prepare() {
  cd "$srcdir/glfw-$pkgver"
	patch -p1 < "$srcdir/glfw.patch"
}

build() {
  cmake -B build -S "glfw-$pkgver" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DBUILD_SHARED_LIBS=ON \
		-DGLFW_BUILD_WAYLAND=ON \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "glfw-$pkgver"/LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
