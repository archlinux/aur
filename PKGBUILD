# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Christoph Vigano <mail@cvigano.de>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: bender02 at gmx dot com

_pkgbasename=nettle
pkgname=lib32-$_pkgbasename-git
pkgver=3.7
pkgrel=1
pkgdesc="A low-level cryptographic library (32-bit)"
arch=('x86_64')
url="https://www.lysator.liu.se/~nisse/nettle/"
license=('GPL2')
depends=('lib32-gmp' $_pkgbasename)
makedepends=(gcc-multilib)
provides=('lib32-nettle' 'libnettle.so' 'libhogweed.so')
conflicts=('lib32-nettle')
source=("git+https://git.lysator.liu.se/nettle/nettle.git")
sha256sums=('SKIP')
#validpgpkeys=('343C2FF0FBEE5EC2EDBEF399F3599FF828C67298') # Niels Möller <nisse@lysator.liu.se>

pkgver() {
  cd nettle
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd $_pkgbasename

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./.bootstrap
  ./configure --prefix=/usr --libdir=/usr/lib32 \
    --enable-shared --with-include-path=/usr/lib32/gmp --disable-documentation --disable-openssl
  make
}

#check() {
#  cd $_pkgbasename
#  make -k check
#}

package() {
  cd $_pkgbasename
  make DESTDIR="$pkgdir/" install
  rm -rf "${pkgdir}"/usr/{include,share,bin}
}
