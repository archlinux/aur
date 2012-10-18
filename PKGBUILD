# Upstream Maintainer: Bill Fraser <wfraser@codewise.org>
#
# From flex's PKGBUILD:
#   Maintainer: Allan McRae <allan@archlinux.org>
#   Contributor: judd <jvinet@zeroflux.org>
#
# Maintainer: Fantix King <fantix.king at gmail.com>

_pkgbasename=flex
pkgname=libx32-flex
pkgver=2.5.37
pkgrel=0.1
pkgdesc="A tool for generating text-scanning programs"
arch=('x86_64')
url="http://flex.sourceforge.net"
license=('custom')
groups=('base-devel')
depends=('libx32-glibc' 'm4' 'sh' $_pkgbasename)
makedepends=('gcc-multilib-x32')
source=(http://downloads.sourceforge.net/sourceforge/flex/flex-$pkgver.tar.bz2 
        flex-2.5.37-no-bison.patch)
md5sums=('c75940e1fc25108f2a7b3ef42abdae06'
         'bd54cf8a1896da4efda41d6e27282ce7')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export LD="ld -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd $srcdir/$_pkgbasename-$pkgver

  patch -Np1 -i $srcdir/flex-2.5.37-no-bison.patch

  ./configure --prefix=/usr --libdir=/usr/libx32 \
    --mandir=/usr/share/man --infodir=/usr/share/info
  make
}

check() {
  cd $srcdir/$_pkgbasename-$pkgver
  make check
}

package() {
  cd $srcdir/$_pkgbasename-$pkgver

  make prefix=$pkgdir/usr \
    mandir=$pkgdir/usr/share/man \
    infodir=$pkgdir/usr/share/info \
    libdir=$pkgdir/usr/libx32 \
    install

  rm -rf "${pkgdir}"/usr/{include,share,bin}

  mkdir -p $pkgdir/usr/share/licenses
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}

