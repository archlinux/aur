# Maintainer: Peter Lewis <plewis@aur.archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Jesse Juhani Jaara <jesse.jaara@gmail.com>

pkgname=lib32-libmikmod
pkgver=3.1.12
pkgrel=6
pkgdesc='Portable sound library'
license=('GPL' 'LGPL')
url="http://sourceforge.net/projects/mikmod/"
arch=('x86_64')
depends=('libmikmod' 'lib32-glibc')
makedepends=('gcc-multilib')
options=('!libtool')
install=
source=(http://downloads.sourceforge.net/mikmod/libmikmod-${pkgver}.tar.gz
        libmikmod-3.1.12-64bit-fix.diff
	libmikmod-3.1.12-exitcrash-fix.diff
	libmikmod-3.1.12-loopingvolume-fix.diff
	libmikmod-3.1.12-md_sngchn-fix.diff
        libmikmod-CVE-2009-0179.patch)
md5sums=('9f3c740298260d5f88981fc0d51f6f16'
         'dc7ffd8d6d355e9d6ec671b7f2b2adc7'
         '03a4f5bfcecddf5f515672d6d477b7f7'
         'a837fd876cbd2ac27419b802504489db'
         '076d39de19de36b880ed90297f1ee0d1'
         'fa91f4bc17164be32bec0ea7a73f2aaa')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd $srcdir/libmikmod-$pkgver

  # patches from sdl_mixer-1.2.11 source
  patch -Np1 -i $srcdir/libmikmod-3.1.12-64bit-fix.diff
  patch -Np1 -i $srcdir/libmikmod-3.1.12-exitcrash-fix.diff
  patch -Np1 -i $srcdir/libmikmod-3.1.12-loopingvolume-fix.diff
  patch -Np1 -i $srcdir/libmikmod-3.1.12-md_sngchn-fix.diff
  patch -Np1 -i $srcdir/libmikmod-CVE-2009-0179.patch

  ./configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --libdir=/usr/lib32
  make
}

package() {
  cd $srcdir/libmikmod-$pkgver
  make DESTDIR=$pkgdir install
  rm -rf "${pkgdir}"/usr/{include,share,bin}
}

