# Maintainer: peter1000 <https://github.com/peter1000>
# Contributor: PelPix <kylebloss[at]pelpix[dot]info>
# Contributor: DrZaius <lou[at]fakeoutdoorsman.com>
# Contributor: zhuqin <zhuqin83[at]gmail>
# Contributor: pressh <pressh[at]gmail>

_srcname=x264
pkgname='libx264-git_p'
pkgver=148.2574.e6d2a36
pkgrel=1
epoch=2
pkgdesc='Library for encoding H264/AVC video streams (Git dev-version bit depth=8)'
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
makedepends=('git' 'yasm' )
url="http://www.videolan.org/developers/x264.html"
provides=('libx264.so' 'x264-dev' 'libx264' 'libx264-git')
conflicts=('x264-dev' 'libx264' 'libx264-git')
replaces=('x264-dev')
source=("${_srcname}::git://git.videolan.org/x264/x264-sandbox.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_srcname}"
  local _ver=$(grep '#define X264_BUILD' x264.h | cut -d' ' -f3)
  echo ${_ver}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${_srcname}"
  ./configure --prefix=/usr \
    --enable-shared --enable-pic --disable-cli --bit-depth=8
  make
}

package() {
  install -d "$pkgdir"/usr/lib
  make -C ${_srcname} DESTDIR="$pkgdir" install-lib-shared
}
