# Maintainer: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Max Rosin <archlinux at maxrosin dot com>
pkgname=info-beamer-git
_gitname=info-beamer
pkgver=217.8309433
pkgrel=1
pkgdesc="Allows you to develop interactive information displays using the Lua programming language."
arch=('i686' 'x86_64')
url="http://info-beamer.org/"
license=('BSD')
depends=('ffmpeg' 'lua51' 'libevent' 'glfw' 'devil' 'glew' 'ftgl')
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
