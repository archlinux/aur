# $Id: PKGBUILD 59310 2011-11-23 10:19:34Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Alessio 'mOLOk' Bolognino <themolok@gmail.com>
# Contributor: Suat SARIALP <muhendis.suat@gmail.com>

pkgname=dev86
pkgver=0.16.18
pkgrel=3
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
	dev86-pic.patch
	dev86-0.16.17-fortify.patch)
md5sums=('f2e06b547397383b2b2650b9c4fd9bab'
         '1b750c5561a4bde5f83f65e5827feb73'
         '07238f9203c6528ea1e34198e771ea12')

build() {
  cd $srcdir/$pkgname-$pkgver
  patch -Np0 -i $srcdir/dev86-pic.patch
  patch -Np1 -i $srcdir/dev86-0.16.17-fortify.patch
  if [ "${CARCH}" = "x86_64" ]; then
    # x86_64 fix
    sed -i.orig -e 's,alt-libs elksemu,alt-libs,' \
		-e 's,install-lib install-emu,install-lib,' \
		$srcdir/$pkgname-$pkgver/makefile.in
    sed -i -e "s/-O2 -g/-O2 -g -m32/" makefile.in
    sed -i 's|^LDFLAGS.*=$|LDFLAGS=-m32|' makefile.in
  fi

  unset CFLAGS
  unset LDFLAGS
  unset CPPFLAGS
  unset CXXFLAGS

  make PREFIX=/usr DIST="$pkgdir"
  make install-all DIST="$pkgdir"
  mkdir -p $pkgdir/usr/share
  mv $pkgdir/usr/man $pkgdir/usr/share
  # remove all the stuff supplied by bin86
  rm $pkgdir/usr/bin/{as,ld,nm,objdump,size}86
  rm $pkgdir/usr/share/man/man1/{as,ld}86.1
}
