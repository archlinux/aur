# Author: Miguel Useche <migueluseche@skatox.com>
# Maintainer: Miguel Useche <migueluseche@skatox.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=dcmtk
pkgver=3.6.4
pkgrel=1
pkgdesc="A collection of libraries and applications implementing large parts the DICOM standard"
arch=('i686' 'x86_64')
url="http://dicom.offis.de/dcmtk"
license=('other')
depends=('zlib' 'libpng' 'libtiff' 'libxml2' 'openssl' 'libssh' 'libwrap')
makedepends=('cmake' 'make')
source=("ftp://dicom.offis.de/pub/dicom/offis/software/dcmtk/dcmtk363/${pkgname}-${pkgver}.tar.gz")
sha512sums=('735f85d04410437a5163b154f43c8a299aff7a8f810605ce6c5027ae4569ff1323a69f70a2603805cec9d826a31166fd904bb53c3edc1137bfc41ba2902c2261')

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

  install -dm755 "${pkgdir}/usr/lib/"

  # Install ld config file
  install -dm755 "${pkgdir}/etc/ld.so.conf.d/"
  echo "/usr/lib/" > "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"
}
