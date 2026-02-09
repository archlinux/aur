# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: VitalyR <vr AT vitalyr DOT com>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Christer Solskogen <christer.solskogen@gmail.com>

pkgname=lib32-sdl3-git
pkgver=3.4.0.r258.g6f754e5c03
pkgrel=1
pkgdesc="Simple Directmedia Layer (Version 3)"
arch=('x86_64' 'i686')
url="https://www.libsdl.org"
license=('Zlib')
depends=(sdl3 lib32-libdecor lib32-libglvnd lib32-libxtst lib32-libxkbcommon lib32-libthai lib32-libxi
	 lib32-libpulse lib32-fribidi lib32-mesa lib32-libxrandr lib32-jack lib32-libxcursor lib32-sndio
	 lib32-libxext lib32-libusb lib32-libpipewire lib32-libxss lib32-alsa-lib lib32-libxfixes
	 lib32-glibc lib32-libx11 lib32-wayland lib32-libdrm)
makedepends=('cmake' 'git' 'ninja' 'wayland-protocols' 'ibus' 'vulkan-headers')
optdepends=('lib32-vulkan-driver: Vulkan Driver')
source=("git+https://github.com/libsdl-org/SDL.git")
provides=("lib32-sdl3=${pkgver%.r*}")
conflicts=("lib32-sdl3")
sha512sums=('SKIP')

pkgver() {
  cd SDL
  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/preview.//'
}

build() {
	export CFLAGS+=" -m32"
	export CXXFLAGS+=" -m32"
	export LDFLAGS+=" -m32"
	export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
	cmake -S SDL -B build -G Ninja \
	-D CMAKE_BUILD_TYPE=None \
	-D SDL_HIDAPI_LIBUSB=ON \
	-D CMAKE_INSTALL_PREFIX=/usr \
	-D CMAKE_INSTALL_LIBDIR=lib32 \
	-D SDL_STATIC=OFF \
	-D SDL_TESTS=OFF \
	-D SDL_TEST_LIBRARY=OFF \
	-D SDL_RPATH=OFF \
	-D SDL_DEPS_SHARED=OFF

	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	rm -rf "${pkgdir}/usr/lib/cmake"
	rm -rf "${pkgdir}/usr/include"
	rm -rf "${pkgdir}/usr/share/man"
	mv "${pkgdir}/usr/share/licenses/SDL3" "${pkgdir}/usr/share/licenses/lib32-sdl3-git"
}

