# Author: Miguel Useche <migueluseche@skatox.com>
# Maintainer: Miguel Useche <migueluseche@skatox.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# Most of this PKGBUILD + patches were taken from Fedora's dcmtk spec file, so thanks to the Fedora packagers for making this package work!

pkgname=dcmtk
pkgver=3.6.2

# Fedora release (from Koji)
_fedora_rel=1.fc28
# Newer Fedora releases in the future can be found at http://koji.fedoraproject.org/

pkgrel=1
pkgdesc="A collection of libraries and applications implementing large parts the DICOM standard"
arch=('i686' 'x86_64')
url="http://dicom.offis.de/dcmtk"
license=('other')
depends=('zlib' 'libpng' 'libtiff' 'libxml2' 'openssl' 'charls' 'libssh')
makedepends=('cmake' 'make')
source=("ftp://dicom.offis.de/pub/dicom/offis/software/dcmtk/dcmtk362/${pkgname}-${pkgver}.tar.gz" "http://kojipkgs.fedoraproject.org/packages/dcmtk/${pkgver}/${_fedora_rel}/src/${pkgname}-${pkgver}-${_fedora_rel}.src.rpm")
noextract=("${pkgname}-${pkgver}-${_fedora_rel}.src.rpm")
sha512sums=('a3190287b068ae17984909dd9e8d920ddea3b590fc3888c42fc33fca4a3cdcf7dcc9bd64d994620303eef7c7ab7b4184ac21ebd1167ae2c17e4a88f641d7ef94' '403b844a003c90afa696e4739fd687f0ea2ce8dd76e473c384738ab4190857ba39ea553e6eeaff39b8b2ddfe420aae1c131a14f7c622f34a2f6863f142cc1382')
#Currently it's not building otherwise
options=(!buildflags)

build() {
  cd "${srcdir}"

   # Extract RPM into another directory
  if [ ! -d fedora ]; then 
    mkdir fedora
  fi
  
  pushd fedora
  bsdtar -xf "../${pkgname}-${pkgver}-${_fedora_rel}.src.rpm"
  popd

  sum_original=`sha512sum "${srcdir}/fedora/${pkgname}-${pkgver}.tar.gz" | awk '{print $1}'`
  sum_fedora=`sha512sum "${srcdir}/${pkgname}-${pkgver}.tar.gz" | awk '{print $1}'`

  # Verify the authenticity of both the Fedora source and the upstream source
  if [[ $sum_fedora != $sum_original ]]; then
    error "sha512 sums of Fedora's source and upstream source do not match!"
    exit
  fi

  cd "${pkgname}-${pkgver}"

  # Apply Fedora patches (fixes build)
  for i in $(cat "${srcdir}/fedora/${pkgname}.spec" | grep "Patch[0-9]*:" | awk '{print $2}'); do
    patch -p1 -i "${srcdir}/fedora/${i}"
  done

  # Remove bundled charls
  rm -rf dcmjpls/libcharls/

  # Fix linker flags
  export LDFLAGS="-lssh -lz ${LDFLAGS}"

  # Use CMake instead of autotools (./configure)
  # Must build from the root directory or the man pages won't get installed
  cmake . \
    -DCMAKE_BUILD_TYPE:STRING="Release" \
    -DBUILD_SHARED_LIBS:BOOL=ON \
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
