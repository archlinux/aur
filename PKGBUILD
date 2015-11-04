# Contributor: Jens Staal <staal1978@gmail.com>
# Contributor: Sascha Biermmanns <saschakb at gmail dot com>
pkgname=heirloom-cvs
pkgver=2014.07.15
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="The Heirloom Toolchest of standard UNIX utilities, derived from original UNIX tools"
url="http://heirloom.sourceforge.net/tools.html"
license=('custom:"opensolaris"' 'custom:"lucent"')
depends=('heirloom-sh-cvs' 'heirloom-devtools-cvs')
makedepends=('cvs' 'bc')
source=('000-config.diff' '001-staticdep.diff' '002-nowhat.diff' 'makefile.patch')
md5sums=('f9be8f1cc57f87425b39414a7db06543'
         '115355b6058592f9ba16a1c011f27ecd'
         '7394fc957b4fe5a58e4f43d7e283e96b' '9112b52fddffa66cd464eeecd0109a21')

_hmake() {
	env PATH="/usr/heirloom/bin:$PATH" MAKEFLAGS="" make "$@"
}

build() {
  cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom login

  cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom co -P heirloom

  rm -rf $srcdir/build
  cp -ar $srcdir/heirloom $srcdir/build
  cd $srcdir/build

  patch -p1 < ../000-config.diff
  patch -p1 < ../001-staticdep.diff
  patch -p1 < ../002-nowhat.diff
  patch $srcdir/build/makefile -i $srcdir/makefile.patch

  _hmake 
}

package() {
  cd $srcdir/build

  _hmake install ROOT="$pkgdir"

  mkdir -p ${pkgdir}/usr/share/licenses/$pkgname/
  install -m0644 ${srcdir}/heirloom/LICENSE/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -m0644 ${srcdir}/heirloom/LICENSE/OPENSOLARIS.LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/OPENSOLARIS.LICENSE
  install -m0644 ${srcdir}/heirloom/LICENSE/LUCENT ${pkgdir}/usr/share/licenses/${pkgname}/LUCENT
}