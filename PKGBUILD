# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
_pkgbasename=v4l-utils
pkgname=lib32-$_pkgbasename
pkgver=1.22.1
pkgrel=1
pkgdesc="Userspace tools and conversion library for Video 4 Linux (32-bit)"
arch=('x86_64')
url="https://linuxtv.org/"
provides=("lib32-libv4l=$pkgver")
replaces=('lib32-libv4l')
conflicts=('lib32-libv4l')
license=('LGPL')
depends=($_pkgbasename 'lib32-gcc-libs' 'lib32-libjpeg-turbo' 'lib32-systemd')
source=(https://linuxtv.org/downloads/v4l-utils/${_pkgbasename}-${pkgver}.tar.bz2
        https://linuxtv.org/downloads/v4l-utils/${_pkgbasename}-${pkgver}.tar.bz2.asc)
validpgpkeys=('05D0169C26E41593418129DF199A64FADFB500FF') # Gregor Jasny <gjasny@googlemail.com>
sha512sums=('8a634d8995d13f453dfaf90ca5d0dfb26f2f4b10a0d200d76a949c46f77040d12fc0a5b35e05d7b1ba68bcfc85a445be5a5ab1d4a7d4eabfe3a254038ccc6170'
            'SKIP')

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=/usr --libdir=/usr/lib32 --sysconfdir=/etc
  make -C lib
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  MAKEFLAGS="-j1" make -C lib install DESTDIR="${pkgdir}/"
  rm -rf "${pkgdir}"/{usr/{include,share,bin,sbin},etc,lib}
}
