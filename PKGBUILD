# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=libwebp-git
pkgver=1.0.0.r17.gf9df0081a
pkgrel=1
pkgdesc="WebP library and conversion tools"
arch=(x86_64 i686)
url="https://developers.google.com/speed/webp/"
license=(BSD)
depends=(libpng libjpeg libtiff giflib)
makedepends=('git')
conflicts=('libwebp')
provides=('libwebp')
source=("${pkgname}::git+https://chromium.googlesource.com/webm/libwebp")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname}

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
  cd ${pkgname}

  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
