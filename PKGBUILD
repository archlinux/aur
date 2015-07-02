# $Id: PKGBUILD 184409 2013-05-06 19:38:39Z foutrelis $
# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Original Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=libwebp-git
pkgver=v0.4.1.530.g39216e5
pkgrel=1
pkgdesc="WebP library and conversion tools"
arch=(x86_64 i686)
url="https://developers.google.com/speed/webp/"
license=(BSD)
depends=(libpng libjpeg libtiff giflib)
options=('!libtool')
conflicts=('libwebp')
provides=('libwebp')

_gitname='libwebp'

source=(
  "git+https://chromium.googlesource.com/webm/libwebp"
  "0001-fix-gcc-5.1-error-where-c-14-string-literals-are-det.patch"
  "0002-add-libgl-to-LD-line.patch"
)

sha256sums=(
  "SKIP"
  "921596773f784832cf7c6fd5988b4272baa209cc959f658a894c9b1fdc5225df"
  "c5390acae9739f9c5c8a47677194c7f24d317bee6003d4fa1886f93fab1226ad"
)

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname
  
  git am ../0001-fix-gcc-5.1-error-where-c-14-string-literals-are-det.patch
  git am ../0002-add-libgl-to-LD-line.patch

  ./autogen.sh 
  ./configure --prefix=/usr \
     --enable-swap-16bit-csp \
     --enable-experimental \
     --enable-libwebpmux \
     --enable-libwebpdemux \
     --enable-libwebpdecoder \
     --disable-static
  make
}

package() {
  cd $_gitname

  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
