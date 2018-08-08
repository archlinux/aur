# Maintainer: Rafał Kozdrój <kozeid2@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

_pkgbasename=sdl
_pkgname=lib32-$_pkgbasename
pkgname=$_pkgname-hg
pkgver=1.2.15.r12076.3e05d58dc84f
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (32-bit)"
arch=('x86_64')
url="http://www.libsdl.org"
license=('LGPL')
depends=('lib32-libxext' 'lib32-libxrender' 'lib32-libx11' $_pkgbasename)
makedepends=('lib32-alsa-lib' 'lib32-mesa' 'lib32-libpulse' 'lib32-glu' 'gcc-multilib' 'mercurial')
optdepends=('lib32-alsa-lib: ALSA audio driver'
            'lib32-libpulse: PulseAudio audio driver')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('staticlibs')
source=("hg+https://hg.libsdl.org/SDL#branch=SDL-1.2")
md5sums=('SKIP')

pkgver() {
  cd "SDL/"
  printf "%s.r%s.%s" \
    "$(hg log -r . -T "{latesttag}" | sed 's/^release-//')" \
    "$(hg identify -n)" \
    "$(hg identify -i)"
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "SDL/"
  ./autogen.sh
  ./configure --prefix=/usr --disable-nasm --enable-alsa \
              --with-x --disable-rpath --disable-static --libdir=/usr/lib32 \
              --disable-input-tslib
  make
}

package() {
  cd "SDL/"
  make DESTDIR="$pkgdir" install

  rm -rf "$pkgdir"/usr/{include,share}

  cd "$pkgdir/usr/bin"
  mv sdl-config sdl-config-32
}
