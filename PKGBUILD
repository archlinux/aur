# Maintainer: VitalyR <vr AT vitalyr DOT com>
# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Christer Solskogen <christer.solskogen@gmail.com>

pkgname=sdl3-git
pkgver=3.4.0.r257.gf1a7a64eb4
pkgrel=1
pkgdesc="Simple Directmedia Layer (Version 3)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://www.libsdl.org"
license=('Zlib')
depends=(libxkbcommon libxfixes libxrandr libxext libdecor libxi alsa-lib libxtst libglvnd libxcursor libusb
	libpulse libpipewire fribidi mesa libxss libthai sndio jack libdrm libx11 glibc wayland)
makedepends=('cmake' 'ninja' 'git' 'vulkan-headers' 'python' 'ffmpeg' 'wayland-protocols' 'ibus')
optdepends=('vulkan-driver: vulkan renderer')
source=("git+https://github.com/libsdl-org/SDL.git")
provides=("sdl3=${pkgver%.r*}")
conflicts=("sdl3")
sha512sums=('SKIP')

pkgver() {
  cd SDL
  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/preview.//'
}

build() {
	cmake -S SDL -B build -G Ninja \
	-D CMAKE_BUILD_TYPE=None \
	-D SDL_HIDAPI_LIBUSB=ON \
	-D CMAKE_INSTALL_PREFIX=/usr \
	-D SDL_STATIC=OFF \
	-D SDL_RPATH=OFF \
	-D SDL_DEPS_SHARED=OFF
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	install -Dm644 SDL/LICENSE.txt -t "$pkgdir/usr/share/licenses/${pkgname}/"
}

