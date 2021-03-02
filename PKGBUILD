# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>

pkgname=sdl2-nox-git
pkgver=release.2.0.14.r447.g84c44e01d
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 2)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://www.libsdl.org"
license=('MIT')
depends=('mesa')
makedepends=('git')
optdepends=('alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver'
            'jack: JACK audio driver')
source=("git+https://github.com/libsdl-org/SDL")
provides=(sdl2)
conflicts=(sdl2 sdl2-minimal-hg)
sha512sums=('SKIP')

pkgver() {
  cd SDL
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	rm -rf build
	mkdir build
}

build() {
	cd build
	../SDL/configure --prefix=/usr \
			--disable-arts --disable-esd --disable-nas \
			--disable-video-rpi \
			--enable-video-kmsdrm \
			--without-x --disable-video-opengl \
			--disable-video-wayland
	make
}

package() {
	cd build
	make install DESTDIR="$pkgdir"
	install -Dm644 ../SDL/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	chown -R root:root "$pkgdir"
}

