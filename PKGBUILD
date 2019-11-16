# Author: Miguel Useche <migueluseche@skatox.com>
# Maintainer: Miguel Useche <migueluseche@skatox.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=dcmtk
pkgver=3.6.5
pkgrel=1
pkgdesc="A collection of libraries and applications implementing large parts the DICOM standard"
arch=('i686' 'x86_64')
url="http://dicom.offis.de/dcmtk"
license=('other')
depends=('zlib' 'libpng' 'libtiff' 'libxml2' 'openssl' 'libssh' 'libwrap')
makedepends=('cmake' 'make')
source=("ftp://dicom.offis.de/pub/dicom/offis/software/dcmtk/dcmtk365/${pkgname}-${pkgver}.tar.gz")
sha512sums=('c0cf61b0095c5708709406bfef5e8bb82dd01dbf77df7f2af2118004920bda68218eb1e4174bf92941cdae0acdb275c886570dafd29476eee2eb815e9a82830a')

#Currently it's not building otherwise
options=(!buildflags)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Fix linker flags
  export LDFLAGS="-lssh -lz ${LDFLAGS}"

  # Use CMake instead of autotools (./configure)
  # Must build from the root directory or the man pages won't get installed
  cmake . \
    -DCMAKE_BUILD_TYPE:STRING="Release" \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DCMAKE_INSTALL_LIBDIR:PATH=lib \
	-DCMAKE_INSTALL_LIBEXECDIR:PATH=lib \
    -DDCMTK_WITH_OPENSSL:BOOL=ON \
    -DDCMTK_WITH_PNG:BOOL=ON \
    -DDCMTK_WITH_PRIVATE_TAGS:BOOL=ON \
    -DDCMTK_WITH_TIFF:BOOL=ON \
    -DDCMTK_WITH_XML:BOOL=ON \
    -DDCMTK_WITH_CHARLS=ON \
    -DDCMTK_WITH_ZLIB:BOOL=ON \
    -DCMAKE_INSTALL_PREFIX=/usr

  make ${MAKEFLAGS}
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install

  # Move configuration files from /usr/etc to /etc
  mv "${pkgdir}/usr/etc/" "${pkgdir}/"

  # Remove empty files (0 length)
  find "${pkgdir}" -type f -empty -exec rm -v {} \;
}
