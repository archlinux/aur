# Maintainer: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Max Rosin <archlinux at maxrosin dot com>
pkgname=info-beamer-git
_gitname=info-beamer
pkgver=243.ac815b1
pkgrel=2
pkgdesc="Allows you to develop interactive information displays using the Lua programming language."
arch=('i686' 'x86_64')
url="https://info-beamer.com/opensource"
license=('BSD')
depends=('ffmpeg2.8' 'lua51' 'libevent' 'glfw' 'devil' 'glew' 'ftgl')
makedepends=('git')
source=('git+https://github.com/dividuum/info-beamer.git')
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "$srcdir/$_gitname"
  sed -i 's/-lglfw3/-lglfw/g' Makefile
  sed -i 's/GL\/glfw.h/GLFW\/glfw3.h/g' font.c
  sed -i 's/GL\/glfw.h/GLFW\/glfw3.h/g' shader.c
  sed -i 's/#define _BSD_SOURCE/#define _DEFAULT_SOURCE/g' vnc.c main.c
  sed -i 's/-I\/usr\/include\/ffmpeg/-I\/usr\/include\/ffmpeg2.8/g' Makefile
  sed -i 's/avcodec_alloc_frame/av_frame_alloc/g' video.c
}

build() {
  cd "$srcdir/$_gitname"
  make LUA_LUAC=luac5.1
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" prefix="/usr" install
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  cp "$srcdir/$_gitname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
