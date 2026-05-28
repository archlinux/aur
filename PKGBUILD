# Maintainer: VitalyR <vr AT vitalyr DOT com>
# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Christer Solskogen <christer.solskogen@gmail.com>

pkgname=sdl3-git
pkgver=3.4.8.r885.gbb3c613
pkgrel=3
pkgdesc="Simple Directmedia Layer (Version 3)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://www.libsdl.org"
license=('Zlib')
depends=('glibc' 'libxext' 'libxrender' 'libx11' 'libgl' 'libxcursor' 'hidapi' 'libusb' 'libunwind')
makedepends=('cmake' 'ninja' 'vulkan-headers' 'python' 'hidapi' 'ibus' 'jack' 'libdecor'
	     'libthai' 'fribidi' 'libgl' 'libpulse' 'libusb' 'libxext' 'libxfixes' 'libxi'
	     'libxinerama' 'libxkbcommon' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'mesa'
	     'pipewire' 'sndio' 'vulkan-driver' 'wayland' 'wayland-protocols' 'patchelf'
	     'git'
	)
optdepends=('vulkan-driver: vulkan renderer'
	    'alsa-lib: ALSA audio driver'
	    'libpulse: PulseAudio audio driver'
	    'jack: JACK audio driver'
	    'pipewire: PipeWire audio driver'
	    'sndio: sndio audio driver'
	    'libdecor: Wayland client decorations'
)
source=("git+https://github.com/libsdl-org/SDL.git")
provides=("sdl3=${pkgver%.r*}")
conflicts=("sdl3")
sha512sums=('SKIP')

pkgver() {
  cd SDL
  #git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/preview.//'
  printf "%s.r%s.g%s" "$(git tag -l 'release-*' | sort -V | tail -n1 | sed 's/release-//')" "$(git rev-list --count $(git tag -l 'release-*' | sort -V | tail -n1)..HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cmake -S SDL -B build -G Ninja \
	-D CMAKE_BUILD_TYPE=None \
	-D SDL_HIDAPI_LIBUSB=ON \
	-D CMAKE_INSTALL_PREFIX=/usr \
	-D SDL_STATIC=OFF \
	-D SDL_RPATH=OFF \
	-D SDL_DEPS_SHARED=ON \
	-D CMAKE_C_FLAGS="$CFLAGS -DNDEBUG" \
	-D CMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG"
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	mv "$pkgdir/usr/share/licenses/SDL3" "$pkgdir/usr/share/licenses/${pkgname}"
	install -Dm755 "$srcdir/build/test/testcontroller" "${pkgdir}/usr/bin/testcontroller"
	patchelf --remove-rpath "${pkgdir}/usr/bin/testcontroller"
}

