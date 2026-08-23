# Maintainer : Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=mingw-w64-frei0r-plugins
_pkgname=frei0r-plugins
pkgver=3.4.3
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
        'sse2-guard.patch'
        'opencv-5.patch')
b2sums=('b45d09072ff6479d3ad1c75d8e90506d031c0673fad1e1f77d7396e47e1e42dbf448c08fc2b3f63386198e9efccb4dec55a6caa098032ec0502208be89ba5f59'
        'b5158b6ad08849484d2c1df1ea002a0d547bc06c765af60397bc5349c49b76efc63d843eedb6dcb521a5c0d496e027b944d5750dd1a4e7d633bea38acf9e8037'
        '8a4d4b1e87b5c5ba553a687dc74d6d8b7af1566fba5ed59175cc9867894f0776442acfff8d0dbebe5b72a1f23ad8de80bd8853bfc4f024a250e6c666b28b5384')
validpgpkeys=(6113D89CA825C5CEDD02C87273B35DA54ACB7D10) # Denis Roio (Jaromil)

_architectures="${MINGW_W64_ARCHS:-x86_64-w64-mingw32}"

prepare() {
  cd "${srcdir}/frei0r"

  patch -Np1 -i "${srcdir}/sse2-guard.patch"
  patch -p1 -i "${srcdir}/opencv-5.patch"
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
