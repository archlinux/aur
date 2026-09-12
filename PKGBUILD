# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=html2xhtml
pkgver=1.4
pkgrel=3
pkgdesc='HTML to XHTML converter'
arch=('x86_64' 'aarch64')
url='https://github.com/jfisteus/html2xhtml'
license=('GPL-2.0-only')
makedepends=('make' 'gcc' 'musl' 'gzip')
provides=(html2xhtml)
conflicts=(html2xhtml)
options=('!lto')
source=(https://github.com/jfisteus/${pkgname}/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz)
b2sums=('7390ac030cf6bf7fac60e218e85033038ccb6fe586dc93c1940f274365c816cad2964d29f13132edf3da2308e95142b65b26f9a8262c74b824500763d756f7bd')
build() {
  cd ${pkgname}-${pkgver}
  export CC="musl-gcc -fno-link-libatomic" CFLAGS="$CFLAGS -Os" PREFIX=/usr
  export LDFLAGS="-no-pie -Wl,-static -Wl,--no-dynamic-linker"

  ./configure \
    --prefix=$PREFIX \
    --enable-shared=no \
    --enable-static=yes \
    --with-pic=no
  make -j $(nproc)
}
package() {
  make -C ${pkgname}-${pkgver} DESTDIR="$pkgdir/" install-strip
}
