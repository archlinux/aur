# Contributor: Homme Zwaagstra, danitool
pkgname=libecwj2
pkgver=3.3
pkgrel=3
pkgdesc="Library for both the ECW and the ISO JPEG 2000 image file formats"
arch=('i686' 'x86_64')
url="http://trac.osgeo.org/gdal/wiki/ECW"
license=('ECWPL')
depends=()
makedepends=('autoconf' 'libtool')
source=("http://meuk.technokrat.nl/${pkgname}-${pkgver}-2006-09-06.zip"
        'libecwj2-3.3-nolcms.patch'
        'libecwj2-3.3-3245a.patch'
        'libecwj2-3.3-3245b.patch'
        'libecwj2-3.3-NCSPhysicalMemorySize-Linux.patch'
        'libecwj2-3.3-2593.patch'
        'libecwj2-3.3-wcharfix.patch')
md5sums=('acc04e07153c2a2a6595b3e2ebf34432'
         'e4c4cde42a8910650fe665bf7c9bbde3'
         '7871632c8d52ceb0ac02589deaa3c347'
         'cf23c8fbb0009905185886708d1c6de4'
         '3018aa1e84ca64e0026c4f3d3481cac1'
         '3ebdc31fa456f47aba6e1a3295f690d3'
         'd0bf5fa7e6ba62ef5a138b5b22364b4e')

build() {
  cd $srcdir/$pkgname-$pkgver

  # Memory leak patches from http://trac.osgeo.org/mapserver/ticket/3245
  patch -p0 -i ${srcdir}/libecwj2-3.3-3245a.patch
  patch -p0 -i ${srcdir}/libecwj2-3.3-3245b.patch

  # Memory overflow patch from http://trac.osgeo.org/gdal/ticket/3366
  patch -p0 -i ${srcdir}/libecwj2-3.3-NCSPhysicalMemorySize-Linux.patch

  # Fix crash creating 16bit JP images on x86_64 from http://trac.osgeo.org/gdal/ticket/2593
  patch -p0 -i ${srcdir}/libecwj2-3.3-2593.patch

  # Gentoo patch
  patch -Np 0 -i "$srcdir/${pkgname}-${pkgver}-nolcms.patch" || return 1
  rm -rf Source/C/libjpeg Source/C/NCSEcw/lcms

  # Gentoo bug 328075
  sed -i -e "s:includeHEADERS_INSTALL:INSTALL_HEADER:" \
      Source/NCSBuildGnu/Makefile.am || return 1

  # std::length_error bug
  patch -p0 -i ${srcdir}/libecwj2-3.3-wcharfix.patch

  # rid of subdirectory warnings
  sed -i -e "s:AM_INIT_AUTOMAKE:AM_INIT_AUTOMAKE([subdir-objects]):" \
      configure.in || return 1
  #libtoolize suggestions
  sed -i -e '7aAC_CONFIG_MACRO_DIRS([m4])' configure.in
  sed -i -e '8aACLOCAL_AMFLAGS= -I m4' Makefile.am
  mkdir m4

  autoreconf -i

  ./configure --prefix=/usr || return 1
  make || return 1
  }

package() {
  cd $srcdir/$pkgname-$pkgver
  install -d "${pkgdir}/usr/include" || return 1
  make prefix="${pkgdir}/usr" install || return 1

  install -D -m644 SDK.pdf ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/SDK.pdf || return 1
  }
