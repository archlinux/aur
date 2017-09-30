# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>

_pkgname=irrlicht
pkgname=irrlicht-svn
pkgver=r5543
pkgrel=1
pkgdesc="An open source high performance realtime 3D graphics engine. (SVN version)"
arch=('i686' 'x86_64' 'armv7h')
url="http://irrlicht.sourceforge.net/"
license=('ZLIB')
depends=('libgl' 'libjpeg' 'bzip2' 'libpng')
makedepends=('mesa' 'unzip' 'libxcursor')
optdepends=('libxcursor: run examples')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::svn://svn.code.sf.net/p/irrlicht/code/trunk")
md5sums=(SKIP)

pkgver() {
  cd $srcdir/$pkgname
  printf "r%s" "$(svnversion | tr -d 'A-z')"
}

build() {
  cd $srcdir/$pkgname/source/Irrlicht

  make NDEBUG=1 $MAKEFLAGS sharedlib
}

package() {
  cd $srcdir/$pkgname/source/Irrlicht

  sed -i "/^INSTALL_DIR/s:=.*:=$pkgdir/usr/lib:" Makefile

  make install

  cd $srcdir/$pkgname/
  install -Dm644 readme.txt $pkgdir/usr/share/licenses/$_pkgname/LICENSE

  # fix headers permissions
  chmod 644 $pkgdir/usr/include/$_pkgname/*

  cd $pkgdir/usr/lib
  ln -s libIrrlicht.so.$pkgver libIrrlicht.so.1
}
