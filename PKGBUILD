# Maintainer: Jonas Platte <aur@jonasplatte.de>

pkgname=purescript-stack
pkgver=0.9.1
pkgrel=1
pkgdesc="A small strongly typed programming language with expressive types that compiles to Javascript, written in and inspired by Haskell."
arch=('i686' 'x86_64')
url="http://www.purescript.org/"
license=('MIT')
depends=('gmp' 'zlib')
makedepends=('stack')
provides=('purescript')
conflicts=('purescript-bin')

prepare() {
  # Force clean build, so the ls | awk stuff and cd * work
  # I'd be happy to do something different there, but it works for now.
  [ -d ./* ] && rm -r ./*

  stack update
  stack unpack purescript
}

pkgver() {
  ls | awk -F - '{ print $2 }'
}

build() {
  cd *
  stack build
}

# This rebuilds everything for some reason, not sure what goes on there
#check() {
#  cd *
#  stack test
#}

package() {
  cd *

  mkdir -p "${pkgdir}/usr/bin"
  stack install --local-bin-path "${pkgdir}/usr/bin"
  chrpath -d "${pkgdir}/usr/bin"/*
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
