# Maintainer : Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=mingw-w64-frei0r-plugins
_pkgname=frei0r-plugins
pkgver=3.2.1
pkgrel=1
pkgdesc='Collection of video effect plugins (mingw-w64)'
arch=(any)
url='https://frei0r.dyne.org/'
license=(GPL-2.0-or-later)
depends=(
  mingw-w64-cairo
  mingw-w64-crt
  mingw-w64-gavl
  mingw-w64-opencv
  mingw-w64-dlfcn
)
options=(!strip !buildflags staticlibs !debug)
makedepends=(
  mingw-w64-gcc
  mingw-w64-cmake
  git
)
source=("git+https://github.com/dyne/frei0r#tag=v$pkgver"
        'sse2-guard.patch')
b2sums=('128b1542c88ec01abfba1cff1f26c9faeeb20a65988cf13fe2834fee14dad7a63950de75195af7ad9d404b7d1d4d5ced20130aa5d1b398db0e20fdf0e8e8641a'
        'b5158b6ad08849484d2c1df1ea002a0d547bc06c765af60397bc5349c49b76efc63d843eedb6dcb521a5c0d496e027b944d5750dd1a4e7d633bea38acf9e8037')
validpgpkeys=(6113D89CA825C5CEDD02C87273B35DA54ACB7D10) # Denis Roio (Jaromil)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/frei0r"

  patch -Np1 -i "${srcdir}/sse2-guard.patch"
}

build() {
  for _arch in ${_architectures}; do
    ${_arch}-cmake -S frei0r -B build-${_arch}
    cmake --build build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --install build-${_arch}
  done
}
