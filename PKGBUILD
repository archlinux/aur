# Maintainer: Peter Lewis <plewis@aur.archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Jesse Juhani Jaara <jesse.jaara@gmail.com>

pkgname=lib32-libmikmod
pkgver=3.2.0
pkgrel=1
pkgdesc="A portable sound library"
license=('GPL' 'LGPL')
url="http://mikmod.shlomifish.org/"
arch=('x86_64')
depends=('libmikmod' 'lib32-glibc')
makedepends=('gcc-multilib alsa-lib')
options=('!libtool')
install=$pkgname.install
source=($url/files/libmikmod-$pkgver.tar.gz
        libmikmod-3.2.0-64bit-fix.diff
        libmikmod-3.1.12-loopingvolume-fix.diff)
md5sums=('96e9820d72a41fe27ff304071739696c'
         '0bb09aac6e83e0a7fd6535961b3cff4c'
         'a837fd876cbd2ac27419b802504489db')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd $srcdir/libmikmod-$pkgver

  # patches from sdl_mixer-1.2.11 source
  patch -Np1 -i $srcdir/libmikmod-3.2.0-64bit-fix.diff
  patch -Np1 -i $srcdir/libmikmod-3.1.12-loopingvolume-fix.diff

  ./configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --libdir=/usr/lib32 --disable-static
  make
}

package() {
  cd $srcdir/libmikmod-$pkgver
  make DESTDIR=$pkgdir install
  rm -rf "${pkgdir}"/usr/{include,share,bin}
}

