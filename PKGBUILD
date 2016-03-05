# Maintainer: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Max Rosin <archlinux at maxrosin dot com>
pkgname=info-beamer-git
_gitname=info-beamer
pkgver=243.ac815b1
pkgrel=3
pkgdesc="Allows you to develop interactive information displays using the Lua programming language."
arch=('i686' 'x86_64')
url="https://info-beamer.com/opensource"
license=('BSD')
depends=('ffmpeg' 'lua51' 'libevent' 'glfw' 'devil' 'glew' 'ftgl')
makedepends=('git')
source=('git+https://github.com/dividuum/info-beamer.git'
        'ffmpeg_2.9.patch')
sha256sums=('SKIP'
            '695713eb1f806ffc8f50cf44575fb071350f11f2b2f456c3fca53e07a560c657')

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
  patch -Np1 -i ../ffmpeg_2.9.patch
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
