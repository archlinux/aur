# Author: Miguel Useche <migueluseche@skatox.com>
# Maintainer: Miguel Useche <migueluseche@skatox.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=dcmtk
pkgver=3.6.8
pkgrel=1
pkgdesc="A collection of libraries and applications implementing large parts the DICOM standard"
arch=('i686' 'x86_64')
url="http://dicom.offis.de/dcmtk"
license=('other')
depends=('libpng' 'libtiff' 'libxml2' 'openssl' 'openjpeg2' 'zlib')
optdepedns=('libiconv' 'libicu')
makedepends=('cmake' 'make')
source=("https://dicom.offis.de/download/dcmtk/dcmtk368/${pkgname}-${pkgver}.tar.gz");
sha512sums=('1bb2aad1aa63e0a1b79d92d7c932a969deccde03fdb484dbd44198effb58d50de44a2b0cda150ce7df63e4e986af5bc1f694c8a7988b4c049c578d83ba81184a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

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

  # Remove empty files (0 length)
  find "${pkgdir}" -type f -empty -exec rm -v {} \;
}
