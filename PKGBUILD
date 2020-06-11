# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Mihai Militaru <mihai.militaru@gmx.com>
# Contributor: scippio <scippio@berounet.cz>
# Contributor: Jesse Jaara <jesse.jaara@gmail.com>
# Contributor: Dan Vratil <dan@progdan.cz>
# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=lib32-freeimage
pkgver=3.18.0
pkgrel=1
pkgdesc="Library project for developers who would like to support popular graphics image formats"
arch=('x86_64')
license=('GPL' 'custom:FIPL')
url="http://freeimage.sourceforge.net"
depends=('freeimage' 'lib32-gcc-libs')
makedepends=('gcc-multilib')
source=("http://downloads.sourceforge.net/project/freeimage/Source%20Distribution/${pkgver}/FreeImage${pkgver//./}.zip")
sha256sums=('f41379682f9ada94ea7b34fe86bf9ee00935a3147be41b6569c9605a53e438fd')

build()
{
  export CC="gcc -march=i686 -m32"
  export CXX="g++ -march=i686 -m32 -std=c++98"
  export CFLAGS="${CFLAGS/-march=x86-64} -O3 -fPIC -fvisibility=hidden -DNO_LCMS"
  export CXXFLAGS="${CXXFLAGS/-march=x86-64} -O3 -fPIC -fvisibility=hidden"

  cd FreeImage
  make
  make -f Makefile.fip
}

package()
{
  cd FreeImage
  make DESTDIR=${pkgdir} install || true
  make -f Makefile.fip DESTDIR=${pkgdir} install

  rm -rf ${pkgdir}/usr/include
  mv ${pkgdir}/usr/lib ${pkgdir}/usr/lib32

  install -Dm 644 ${srcdir}/FreeImage/license-fi.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
