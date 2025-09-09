# Maintainer : Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=mingw-w64-frei0r-plugins
_pkgname=frei0r-plugins
pkgver=2.4.0
pkgrel=1
pkgdesc='Collection of video effect plugins (mingw-w64)'
arch=(any)
url='https://frei0r.dyne.org/'
license=(GPL-2.0-or-later)
depends=(
  mingw-w64-crt
)
options=(!strip !buildflags staticlibs !debug)
makedepends=(
  mingw-w64-gcc
  mingw-w64-cairo
  mingw-w64-cmake
  mingw-w64-gavl
  mingw-w64-opencv
  git
  ninja
)
optdepends=(
  'mingw-w64-cairo: cairoaffineblend, cairoblend, cairogradient and cairoimagegrid plugins'
  'mingw-w64-gavl: rgbparade, scale0tilt and vectorscope plugins'
  'mingw-w64-opencv: facebl0r and facedetect plugins'
)
source=("git+https://github.com/dyne/frei0r#tag=v$pkgver")
b2sums=(0a79a0913ce69814a01e37204233813fcd566bf2df4b3d97da9161c397b66a1e8f52eccbe4d27f34f3a5d1cffd6a22cf4fbacbe28fdc39331c27d9d294d59a5b)
validpgpkeys=(6113D89CA825C5CEDD02C87273B35DA54ACB7D10) # Denis Roio (Jaromil)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    ${_arch}-cmake -S frei0r -B build-${_arch} -G Ninja \
                   -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    cmake --build build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --install build-${_arch}
  done
}
