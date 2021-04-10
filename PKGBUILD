# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Contributor: Simon Reiser <me@sfxr.de>
# Contributor: Alexandru Ianu <alexandru.ianu@gmail.com>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Christoph Vigano <mail@cvigano.de>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: bender02 at gmx dot com

# Based on nettle6 fromt the aur and lit32-nettle from the official repos

_pkgbasename=nettle
pkgname=lib32-${_pkgbasename}6
pkgver=3.4.1
pkgrel=1
pkgdesc="A low-level cryptographic library (legacy version, 32-bit)"
arch=('x86_64')
url="https://www.lysator.liu.se/~nisse/nettle/"
license=('GPL2')
depends=('lib32-gmp' $_pkgbasename)
makedepends=(gcc-multilib)
source=(https://ftp.gnu.org/gnu/nettle/$_pkgbasename-$pkgver.tar.gz{,.sig})
sha256sums=('f941cf1535cd5d1819be5ccae5babef01f6db611f9b5a777bae9c7604b8a92ad'
            'SKIP')
validpgpkeys=('343C2FF0FBEE5EC2EDBEF399F3599FF828C67298') # Niels Möller <nisse@lysator.liu.se>

build() {
  cd "$srcdir/$_pkgbasename-$pkgver"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=/usr --libdir=/usr/lib32 \
    --enable-shared --with-include-path=/usr/lib32/gmp
  make
}

check() {
  cd "$srcdir/$_pkgbasename-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$_pkgbasename-$pkgver"
  make DESTDIR="$pkgdir/" install

  # remove static libs	#--disable-static - build would break (since nettle 2.6) - and had no effect before
  rm -f ${pkgdir}/usr/lib32/{libhogweed,libnettle}.a

  rm -rf "${pkgdir}"/usr/{include,share,bin,lib32/{*.so,pkgconfig}}
}
