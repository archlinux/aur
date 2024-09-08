# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Andreas Wagner <a.wagner@stud.uni-frankfurt.de>

pkgname=lockdev
pkgver=1.0.3_1.6
_pkgver=1.0.3
pkgrel=8
pkgdesc='Run-time shared library for locking devices, using _both_ FSSTND and SVr4 methods.'
url='http://archive.ubuntu.com/ubuntu/pool/universe/l/lockdev/'
license=("GPL")
arch=('x86_64' armv7h)
depends=('glibc' 'systemd')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/l/${pkgname}/${pkgname}_${_pkgver}.orig.tar.gz"
        "http://archive.ubuntu.com/ubuntu/pool/universe/l/${pkgname}/${pkgname}_${_pkgver}-1.5build1.diff.gz"
	'build.patch'
	'gcc-4.7.patch')
md5sums=('64b9c1b87b125fc348e892e24625524a'
         '122cc7e6cfb6c723060ede637fdffd27'
         '2db93cadf6670ddcd01de4bfc22a35e1'
         'e16faebfa2d162d40830ef6f2700b7ba')
sha256sums=('ccae635d7ac3fdd50897eceb250872b3d9a191d298f213e7f0c836910d869f82'
            '89452fc97eac533f2dd35ec7a594fd105a1c761594af59057d4a7738b50c1dfe'
            '5dab4ffe4193b3b3e0370b674c10f5ac8d1b31b67274a86d687d5fbc2c981d46'
            '3162dd90c6ba914908ba6bd6e156949b0e94aaf8ba6ba288e4d766428dfedf7e')

prepare() {
  cd "${pkgname}-${_pkgver}"
  patch -p1 -i "../${pkgname}_${_pkgver}-1.5build1.diff"
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
