# Maintainer: Rafał Kozdrój <kozeid2+aur@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

_pkgbasename=sdl
_pkgname=lib32-$_pkgbasename
pkgname=$_pkgname-git
pkgver=1.2.15.r388.c4cf838b
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (32-bit)"
arch=('x86_64')
url="https://www.libsdl.org"
license=('LGPL')
depends=('lib32-libxext' 'lib32-libxrender' 'lib32-libx11' $_pkgbasename)
makedepends=('lib32-alsa-lib' 'lib32-mesa' 'lib32-libpulse' 'lib32-glu' 'gcc-multilib' 'git')
optdepends=('lib32-alsa-lib: ALSA audio driver'
            'lib32-libpulse: PulseAudio audio driver')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('staticlibs')
source=("git+https://github.com/libsdl-org/SDL-1.2.git")
md5sums=('SKIP')

pkgver() {
  cd "SDL-1.2"
  git describe --long --tags | sed 's/^release-//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "SDL-1.2"
  ./autogen.sh
  ./configure --prefix=/usr --disable-nasm --enable-alsa \
              --with-x --disable-rpath --disable-static --libdir=/usr/lib32 \
              --disable-input-tslib
  make
}

package() {
  cd "SDL-1.2"
  make DESTDIR="$pkgdir/" install

  rm -rf "$pkgdir"/usr/{include,share}

  cd "$pkgdir/usr/bin"
  mv sdl-config sdl-config-32
}
