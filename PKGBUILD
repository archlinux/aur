# Maintainer: Balazs Ruzsa <ruzsa.balazs@gmail.com>
pkgname=retro-debugger-git
pkgver=v0.64.64.r1.7cbfb8a
pkgrel=2
pkgdesc="Multiplatform debugger APIs host for retro computers: C64 (Vice), Atari800 and NES (NestopiaUE)"
arch=(x86_64)
url="https://github.com/slajerek/RetroDebugger"
license=('custom')
depends=('sdl2' 'glib2' 'gtk3' 'alsa-lib' 'glew' 'libx11' 'libxcb' 'sndio' 'freetype2' 'zlib')
makedepends=('git')
provides=("${pkgname%-git}")
source=(
  'RetroDebugger::git+https://github.com/slajerek/RetroDebugger.git'
  'RetroDebugger.patch'
  'MTEngineSDL::git+https://github.com/slajerek/MTEngineSDL.git'
  'MTEngineSDL.patch'
)
md5sums=(
  'SKIP'
  '6d501a447e4d71d0ab5237e5c458da1a'
  'SKIP'
  'a5d8208f8045a7b7bec2530d17ee340e'
)

pkgver() {
	cd "$srcdir/RetroDebugger"
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/MTEngineSDL"
	patch -p1 -i "$srcdir/MTEngineSDL.patch"
	cd "$srcdir/RetroDebugger"
	patch -p1 -i "$srcdir/RetroDebugger.patch"
}

build() {
	cd "$srcdir/MTEngineSDL"
  mkdir -p build
  cd build
  cmake ..
  make

	cd "$srcdir/RetroDebugger"
  mkdir -p build
  cd build
  cmake ..
  make
}

package() {
	cd "$srcdir/RetroDebugger/build"
  mkdir -p "$pkgdir/usr/bin"
  install -m 0755 retrodebugger "$pkgdir/usr/bin"
}
