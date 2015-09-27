# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andreas Wagner <a.wagner@stud.uni-frankfurt.de>

pkgname=lockdev
pkgver=1.0.3_1.6
_pkgver=1.0.3
pkgrel=1
pkgdesc='Run-time shared library for locking devices, using _both_ FSSTND and SVr4 methods.'
url='http://packages.qa.debian.org/l/lockdev.html'
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc')
source=("http://ftp.debian.org/debian/pool/main/l/${pkgname}/${pkgname}_${_pkgver}.orig.tar.gz"
	"http://ftp.debian.org/debian/pool/main/l/${pkgname}/${pkgname}_${pkgver/_/-}.diff.gz"
	'build.patch'
	'gcc-4.7.patch')
md5sums=('64b9c1b87b125fc348e892e24625524a'
         '5ef6267c42fca9145e0af006ccb6aff7'
         '2db93cadf6670ddcd01de4bfc22a35e1'
         'e16faebfa2d162d40830ef6f2700b7ba')

prepare() {
  cd "${pkgname}-${_pkgver}"
  patch -p1 -i "../${pkgname}_${pkgver/_/-}.diff"
  sed -i "s|CFLAGS	= -g|CFLAGS	= -g -fPIC|" Makefile
  patch -p1 -i ../build.patch # FS#33280
  patch -p1 -i ../gcc-4.7.patch # FS#34457
}

build() {
  cd "${pkgname}-${_pkgver}"
  make CFLAGS="${CFLAGS} -D_PATH_LOCK=\\\"/run/lock/lockdev\\\" -fPIC"
}

package() {
  cd "${pkgname}-${_pkgver}"
  make basedir="${pkgdir}/usr" install
}
