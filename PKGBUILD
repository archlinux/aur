# Maintainer: peter1000 <https://github.com/peter1000>
# Contributor: PelPix <kylebloss[at]pelpix[dot]info>
# Contributor: DrZaius <lou[at]fakeoutdoorsman.com>
# Contributor: zhuqin <zhuqin83[at]gmail>
# Contributor: pressh <pressh[at]gmail>

# Peter1000: recompile it also after ffmpeg is installed - these have circular optional dependencies

_srcname=x264
pkgname=('x264-git_p' 'libx264-git_p')
pkgver=146.2538.121396c
pkgrel=1
epoch=2
pkgdesc="CLI tools for encoding H264/AVC video streams"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
makedepends=('git' 'yasm')
url="http://www.videolan.org/developers/x264.html"
source=("${_srcname}::git://git.videolan.org/x264.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_srcname}"
  local _ver=$(grep '#define X264_BUILD' x264.h | cut -d' ' -f3)
  echo ${_ver}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "${srcdir}"
  cp -r ${_srcname} ${_srcname}-10bit
}

build() {
  cd "${srcdir}/${_srcname}"
  ./configure --prefix=/usr \
    --enable-shared --enable-pic
  make
}

package_x264-git_p() {
  pkgdesc='CLI tools for encoding H264/AVC video streams'
  depends=()
  provides=('x264' 'x264-git')
  conflicts=('x264' 'x264-10bit')

  make -C ${_srcname} DESTDIR="$pkgdir" install-cli
}

package_libx264-git_p() {
  pkgdesc='Library for encoding H264/AVC video streams'
  provides=('libx264.so' 'libx264' 'libx264-git' 'x264-dev')
  conflicts=('x264-dev' 'libx264' 'libx264-10bit')

  install -d "$pkgdir"/usr/lib
  make -C ${_srcname} DESTDIR="$pkgdir" install-lib-shared
}
