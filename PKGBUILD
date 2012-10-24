# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Alessio 'mOLOk' Bolognino <themolok@gmail.com>
# Contributor: Suat SARIALP <muhendis.suat@gmail.com>

pkgname=dev86
pkgver=0.16.19
pkgrel=1
pkgdesc="Simple C compiler to generate 8086 code"
arch=('i686' 'x86_64')
url="http://www.debath.co.uk/dev86/"
license=(GPL)
if [ "${CARCH}" == "x86_64" ]; then
  depends=('lib32-glibc')
  makedepends=('bin86' 'gcc-multilib')
else
  makedepends=('bin86')
fi
options=('!libtool' '!strip' '!makeflags')
source=(http://www.debath.co.uk/dev86/Dev86src-$pkgver.tar.gz
	mandir.patch
	copt.patch)
md5sums=('442e98e1afa23fe00d40c5a996385942'
         '509df653dec8956faf1a40a8c544d9ce'
         '32839371e28c1a04477df883e970d6cd')

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -p1 <$srcdir/mandir.patch
  patch -p1 <$srcdir/copt.patch
  echo 'quit' | make PREFIX=/usr DIST="$pkgdir"
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make install-all DIST="$pkgdir"

  # remove all the stuff supplied by bin86
  rm $pkgdir/usr/bin/{as,ld,nm,objdump,size}86
  rm $pkgdir/usr/share/man/man1/{as,ld}86.1
}
