# Maintainer: Yamashita Ren
# Contributor: PelPix <kylebloss[at]pelpix[dot]info>
# Contributor: DrZaius <lou[at]fakeoutdoorsman.com>
# Contributor: zhuqin <zhuqin83[at]gmail>
# Contributor: pressh <pressh[at]gmail>

pkgname=x264-ymod-git
_gitname="x264_YMod"
pkgver=148.r2610.09bc200
pkgrel=2
pkgdesc="H.264 video encoder and library, with custom patchset."
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
makedepends=('git' 'yasm')
url="https://github.com/YamashitaRen/x264_YMod"
conflicts=('x264')
provides=('x264')
source=('git://github.com/YamashitaRen/x264_YMod.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "%s.r%s.%s" "$(grep "#define X264_BUILD" x264.h | cut -d " " -f3)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_gitname
  
  ./configure --prefix=/usr --bit-depth=10 --enable-pic
  make
  mv x264 x264-10bit
  
  ./configure --prefix=/usr --enable-pic
  make
}

package() {
  cd $_gitname
  
  make DESTDIR="$pkgdir" install
  install -Dm755 x264-10bit "$pkgdir"/usr/bin/x264-10bit
}
