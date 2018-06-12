# Maintainer: GordonGR <ntheo1979@gmail.com>
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Paul Mattal <paul@archlinux.org>

pkgname=('lib32-libx264' 'lib32-libx264-10bit' 'lib32-libx264-all')
_pkgbase=('x264')
pkgver=152.20171224
pkgrel=5
arch=('x86_64')
url='https://www.videolan.org/developers/x264.html'
license=('GPL')
depends=('lib32-glibc')
makedepends=('git' 'l-smash' 'nasm')
_commit='e9a5903edf8ca59ef20e6f4894c196f135af735e'
source=("git+https://git.videolan.org/git/x264.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
cd ${_pkgbase}

local _ver=$(grep '#define X264_BUILD' x264.h | cut -d' ' -f3)
local _date=$(git log -1 --format="%cd" --date=short | tr -d -)

echo ${_ver}.${_date}
}

prepare() {
mkdir build-{8,10}bit
}

build() {
for _b in 8 10; do (
  cd build-${_b}bit
  ../${_pkgbase}/configure \
    --prefix='/usr' \
    --enable-shared \
    --enable-pic \
    --enable-lto \
    --bit-depth="${_b}" \
    --libdir=/usr/lib32 --host=i686-linux-gnu
  make
) done
}

package_lib32-libx264() {
pkgdesc='Library for encoding H264/AVC video streams (8bit depth) (lib32)'
depends=('libx264')
provides=('lib32-libx264-8bit' 'libx264.so')
conflicts=('lib32-libx264')

make -C build-8bit DESTDIR=${pkgdir} install-lib-shared
rm -rf "${pkgdir}"/usr/include
}

package_lib32-libx264-10bit() {
pkgdesc='Library for encoding H264/AVC video streams (10bit depth) (lib32)'
depends=('libx264-10bit')
provides=('lib32-libx264' 'libx264.so')
conflicts=('lib32-libx264')

make -C build-10bit DESTDIR=${pkgdir} install-lib-shared
rm -rf "${pkgdir}"/usr/include
}

package_lib32-libx264-all() {
pkgdesc="Library for encoding H264/AVC video streams (all depths) (lib32)"
depends=('libx264-all')

local _ver=$(grep '#define X264_BUILD' "${_pkgbase}"/x264.h | cut -d' ' -f3)

install -d "${pkgdir}"/usr/lib32/x264

for _b in {8,10}bit; do
  provides+=("libx264-${_b}.so")

  make -C build-${_b} DESTDIR="${pkgdir}" install-lib-shared

  mv "${pkgdir}"/usr/lib32/libx264.so.${_ver} "${pkgdir}"/usr/lib32/x264/libx264-${_b}.so.${_ver}
  rm -r "${pkgdir}"/usr/{include,lib32/libx264.so,lib32/pkgconfig}
  ln -sr "${pkgdir}"/usr/lib32/x264/libx264-${_b}.so{.${_ver},}
done
}

