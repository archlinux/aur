# Contributor: ilikenwf/Matt Parnell <parwok@gmail.com>
# Maintainer: ilikenwf/Matt Parnell <parwok@gmail.com>

pkgname=openoffice-uglyfix-freetype2
pkgver=2.5.5
pkgrel=1
pkgdesc="Original Uglyfix, which compiles freetype2 .so files and puts them in the libreoffice directory to fix font ugliness"
arch=(i686 x86_64)
license=('GPL')
url="http://freetype.sourceforge.net"
depends=('zlib' 'libreoffice')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/freetype/freetype-${pkgver}.tar.bz2
	openoffice.patch)    
md5sums=('2a7a314927011d5030903179cf183be0'
         '14d44b030ab8de3e865f095930018766')

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
