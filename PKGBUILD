# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=slock-bgimage
_pkgname=slock
pkgver=1.4
pkgrel=2
pkgdesc="A simple screen locker for X(patched to allow background images)"
arch=('x86_64' 'i686' 'pentium4')
url="https://github.com/GIJack/slock-bgimage"
license=('MIT')
depends=('libxext' 'libxrandr')
providies=("slock=${pkgver}")
conflicts=("slock")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GIJack/slock-bgimage/archive/refs/tags/${pkgver}.tar.gz")
#source=("slock-$pkgver.tar.bz2::https://hg.suckless.org/slock/archive/$_pkgver.tar.gz")
sha256sums=('b89303e7affe529e027fecc6f2109026cca9f167e627072d4cf6cf8ee4143b32')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  patch -N < slock-image.patch
  sed -i 's|static const char \*group = "nobody";|static const char *group = "nobody";|' config.def.h
  sed -ri 's/((CPP|C|LD)FLAGS) =/\1 +=/g' config.mk
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

