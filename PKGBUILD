# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andreas Wagner <a.wagner@stud.uni-frankfurt.de>

pkgname=lockdev
pkgver=1.0.3_1.6
_pkgver=1.0.3
pkgrel=7
pkgdesc='Run-time shared library for locking devices, using _both_ FSSTND and SVr4 methods.'
url='https://packages.qa.debian.org/l/lockdev.html'
license=("GPL")
arch=('x86_64')
depends=('glibc' 'systemd')
source=("https://ftp.debian.org/debian/pool/main/l/${pkgname}/${pkgname}_${_pkgver}.orig.tar.gz"
	"https://ftp.debian.org/debian/pool/main/l/${pkgname}/${pkgname}_${pkgver/_/-}.diff.gz"
	'build.patch'
	'gcc-4.7.patch')
md5sums=('64b9c1b87b125fc348e892e24625524a'
         '5ef6267c42fca9145e0af006ccb6aff7'
         '2db93cadf6670ddcd01de4bfc22a35e1'
         'e16faebfa2d162d40830ef6f2700b7ba')
sha256sums=('ccae635d7ac3fdd50897eceb250872b3d9a191d298f213e7f0c836910d869f82'
            'a5405c6ee5e97e45eeb1c81330a7e9f444a58bda5e6771fa30007516c115007e'
            '5dab4ffe4193b3b3e0370b674c10f5ac8d1b31b67274a86d687d5fbc2c981d46'
            '3162dd90c6ba914908ba6bd6e156949b0e94aaf8ba6ba288e4d766428dfedf7e')

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

  # Setup lock directory
  install -dm755 "$pkgdir"/usr/lib/tmpfiles.d
  echo 'd /run/lock/lockdev 0775 root lock -' > "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
