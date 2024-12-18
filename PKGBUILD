# Author: Miguel Useche <migueluseche@skatox.com>
# Maintainer: Miguel Useche <migueluseche@skatox.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=dcmtk
pkgver=3.6.9
pkgrel=1
pkgdesc="A collection of libraries and applications implementing large parts the DICOM standard"
arch=('i686' 'x86_64')
url="http://dicom.offis.de/dcmtk"
license=('other')
depends=('libpng' 'libtiff' 'libxml2' 'openssl' 'openjpeg2' 'zlib')
optdepedns=('libiconv' 'libicu')
makedepends=('cmake' 'make')
source=("https://dicom.offis.de/download/dcmtk/dcmtk369/${pkgname}-${pkgver}.tar.gz");
sha512sums=('1ea4140940f33b34e21895cd7aa6b05be109fcecfbed45f61f8a4a248ea98deae59f2b362e518051d6054f588189d5ef9bba0ab81afa73b219c9ebcf415a0ca0')

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
