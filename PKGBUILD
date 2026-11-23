# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=libwebp-git
pkgver=1.6.0.r334.g68dd1c304
pkgrel=2
pkgdesc="WebP library and conversion tools"
arch=(x86_64 i686)
url="https://developers.google.com/speed/webp/"
license=(BSD-3-Clause)
depends=(
    freeglut
    giflib
    glibc
    libglvnd
    libjpeg-turbo
    libpng
    libtiff
    )
makedepends=(git)
conflicts=(libwebp)
provides=(libwebp)
source=("libwebp-chromium::git+https://chromium.googlesource.com/webm/libwebp")
sha256sums=('SKIP')

pkgver() {
  cd libwebp-chromium
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd libwebp-chromium

  ./autogen.sh 
  ./configure --prefix=/usr \
     --enable-swap-16bit-csp \
     --enable-experimental \
     --enable-libwebpmux \
     --enable-libwebpdemux \
     --enable-libwebpdecoder \
     --enable-libwebpextras \
     --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd libwebp-chromium
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
