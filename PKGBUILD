# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=dfhack
pkgver=0.43.05
_pkgver=$pkgver-beta1
pkgrel=3
pkgdesc="memory hacking library for Dwarf Fortress and a set of tools that use it"
arch=('x86_64' 'i686')
url="http://dfhack.readthedocs.io/en/v$pkgver/"
license=('custom')
depends=("dwarffortress=$pkgver" 'perl-xml-libxslt')
depends_x86_64=('lib32-glu' 'lib32-gtk2' 'lib32-libjpeg6-turbo' 'lib32-libpng12' 'lib32-libsm')
makedepends=('cmake' 'git' 'python-sphinx')
makedepends_x86_64=('gcc-multilib')
conflicts=('dfhack-bin' 'dfhack-git')

source=($pkgname::git+https://github.com/DFHack/dfhack#tag=$_pkgver
        dfhack.sh
        dfhack-run.sh)

md5sums=('SKIP'
         '81f5909c1a32391679f968e40f24d5ca'
         '3853c6f890d3541f710f2c4833a9e696')

prepare() {
  cd $srcdir/$pkgname

  git submodule update --init
}

build() {
  cd $srcdir/$pkgname/build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/opt/dwarffortress \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_DOCS=ON \
    -DBUILD_STONESENSE=ON \
    ..

  make
}

package() {
  cd $srcdir/$pkgname/build

  make DESTDIR=$pkgdir install

  install -Dm755 $srcdir/dfhack.sh     $pkgdir/usr/bin/dfhack
  install -Dm755 $srcdir/dfhack-run.sh $pkgdir/usr/bin/dfhack-run

  install -Dm644 ../LICENSE.rst $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
