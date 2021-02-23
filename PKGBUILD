# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>

pkgname=sdl2-git
pkgver=release.2.0.14.r422.gc287087fc
pkgrel=2
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 2)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://www.libsdl.org"
license=('MIT')
depends=('libgl' 'libibus' )
makedepends=('alsa-lib' 'mesa' 'libpulse' 'libxrandr' 'libxinerama' 'wayland' 'libxkbcommon'
             'wayland-protocols' 'ibus' 'fcitx' 'libxss' 'jack' 'git' )
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
			--disable-video-rpi \
			--enable-video-kmsdrm
	make
}

package() {
	cd build
	make install DESTDIR="$pkgdir"
	install -Dm644 ../SDL/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	chown -R root:root "$pkgdir"
}

