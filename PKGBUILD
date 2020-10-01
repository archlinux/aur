# Contributor: Popolon <popolon@popolon.org>
# Maintainer: ilikenwf/Matt Parnell <parwok@gmail.com>

pkgname=openoffice-uglyfix-freetype2
pkgver=2.10.2
pkgrel=1
pkgdesc="Compiles freetype2 .so files and puts them in the openoffice/libreoffice directory to fix font ugliness"
arch=(i686 x86_64)
license=('GPL')
url="http://freetype.sourceforge.net"
depends=('zlib' 'libreoffice')
options=('!libtool')
# -source=(http://downloads.sourceforge.net/sourceforge/freetype/freetype-${pkgver}.tar.bz2
source=(https://downloads.sourceforge.net/sourceforge/freetype/freetype2/${pkgver}/freetype-${pkgver}.tar.xz
	openoffice.patch)    
md5sums=('7c0d5a39f232d7eb9f9d7da76bf08074'
         '1670a80091ed66f381d415a7b6ea17d1')

prepare()
{
  cd ${srcdir}/freetype-${pkgver}
  patch -Np0 -i ${srcdir}/openoffice.patch || return 1
}
      
build()
{
  cd ${srcdir}/freetype-${pkgver}
  ./configure --prefix=/usr --with-bytecode_interpreter --with-subpixel_rendering --disable-static || return 1
  make || return 1
}

package()
{
  cd ${srcdir}/freetype-${pkgver}
  make DESTDIR=${startdir}/pkg install || return 1
  mkdir -p ${pkgdir}/usr/lib/libreoffice/basis-link/program
  install -c ${startdir}/pkg/usr/lib/libfreetype.so* ${pkgdir}/usr/lib/libreoffice/basis-link/program/
  rm -rf ${pkgdir}/usr/{bin,include,share}
  rm -rf ${pkgdir}/usr/lib/{pkgconfig,libfreetype.so,libfreetype.so.6,libfreetype.so*}
}
