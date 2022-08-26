# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=sdl
pkgver=1.2.15+r430+gdff35e7a
pkgrel=1
epoch=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard"
arch=('x86_64')
url="https://www.libsdl.org"
license=('LGPL')
depends=('glibc' 'libxext' 'libxrender' 'libx11')
makedepends=('alsa-lib' 'mesa' 'libpulse' 'glu' 'git')
optdepends=('alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver')
options=('staticlibs')
_commit=dff35e7a6694acbd14c6222363b3e69f1bd1b96c # main
source=("git+https://github.com/libsdl-org/SDL-1.2#commit=$_commit"
        0001-SDL-1.2.15-no-default-backing-store.patch
        0002-x11-Bypass-SetGammaRamp-when-changing-gamma.patch
        0003-sdl-1.2.14-fix-mouse-clicking.patch
        0004-sdl-1.2.14-disable-mmx.patch)
sha256sums=('SKIP'
            '658a3467f285201431a274339bd5b35a15c6b12156d8b19b21d66546ab8512bc'
            '786c55a1e2c3bd5d68d5649d6f4325ec22109ea3453e73d8d173966798a36538'
            'c2be5af8e1fe36d3771972de4575d30b48372bb94f53433a3ae8cff030d1724d'
            '62275b1b2f8e79d5f12126a79994733dcd13d62954391fcdf93c76f35fde55a0')
validpgpkeys=('1528635D8053A57F77D1E08630A59377A7763BE6') # Sam Lantinga <slouken@libsdl.org>

pkgver() {
  cd SDL-1.2
  git describe --tags | sed 's/^release-//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd SDL-1.2

  git apply -3 ../0001-SDL-1.2.15-no-default-backing-store.patch

  # https://bugs.freedesktop.org/show_bug.cgi?id=27222
  git apply -3 ../0002-x11-Bypass-SetGammaRamp-when-changing-gamma.patch

  git apply -3 ../0003-sdl-1.2.14-fix-mouse-clicking.patch
  git apply -3 ../0004-sdl-1.2.14-disable-mmx.patch

  ./autogen.sh
}

build() {
  cd SDL-1.2
  CFLAGS+=' -ffat-lto-objects'
  ./configure --prefix=/usr --disable-nasm --enable-alsa \
              --with-x --disable-rpath --disable-static
  make
}

package() {
  cd SDL-1.2
  make DESTDIR="$pkgdir" install
}
