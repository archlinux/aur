# $Id: PKGBUILD 184409 2013-05-06 19:38:39Z foutrelis $
# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Original Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=libwebp-git
pkgver=v0.4.0.62.g9a463c4
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
source=("git+http://git.chromium.org/webm/libwebp.git" "gl.patch")
sha256sums=("SKIP" "2a4771968cd01568487d9ef0427a495cded6b7fac8cc123e8f0d6ade25eab28d")

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname
  
  patch -p1 < ../../gl.patch

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
