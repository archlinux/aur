# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="dcmtk"
_so="18"
pkgbase="${_basename}${_so}"
pkgname=("${pkgbase}"{,-docs,-libs})
pkgver=3.6.8
pkgrel=3
pkgdesc="A collection of libraries and applications implementing large parts the DICOM standard (so-version ${_so})"
arch=('i686' 'x86_64')
url="https://dicom.offis.de/dcmtk"
license=('BSD-3-Clause')
makedepends=('cmake>=3' 'doxygen' 'libpng' 'libtiff' 'libxml2' # 'openjpeg2'
             'openssl' 'zlib')
_pkgsrc="${_basename}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://dicom.offis.de/download/${_basename}/${_basename}${pkgver//./}/${_pkgsrc}.tar.gz")
sha256sums=('232076655503138debf2f624109f1799e539354f186ce4e04b27cf82a9d8720f')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  find . -type f -name 'CMakeLists.txt' -exec \
    sed -e 's|CMAKE_INSTALL_FULL_|CMAKE_INSTALL_|g' \
        -i "{}" +
        # -e 's|-${DCMTK_COMPLETE_PACKAGE_VERSION}||g" \

}

build() {
  export CXXFLAGS+=" -Wno-template-body"
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_INSTALL_DATADIR="share/${pkgbase}"
    -D CMAKE_INSTALL_DOCDIR="share/doc/${pkgbase}"
    -D CMAKE_INSTALL_INCLUDEDIR="include/${pkgbase}"
    -D CMAKE_INSTALL_LIBDIR="lib/${pkgbase}"
    -D CMAKE_INSTALL_SYSCONFDIR="/etc/${pkgbase}"
    -D BUILD_SHARED_LIBS:BOOL=ON
    -D DCMTK_ENABLE_PRIVATE_TAGS:BOOL=ON
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

package_dcmtk18() {
  depends=("${pkgbase}-libs=${pkgver}-${pkgrel}" 'gcc-libs' 'glibc' 'libxml2'
           'zlib')

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgbase}/COPYRIGHT"

  cd "${pkgdir}"
  find . -type f -empty -exec rm -v {} \;

  cd "usr"
  find "lib" -type f,l -name 'lib*.so*' -delete

  for file in bin/*; do
    mv "${file}" "${file}${_so}"
  done

  cd "share"
  rm -rf "doc"

  cd "man/man1"
  for file in *.1; do
    mv "${file}" "${file%.1}${_so}.1"
  done
}

package_dcmtk18-docs() {
  pkgdesc+=" (documentation)"
  arch=('any')

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${pkgdir}"
  rm -rf "etc"

  cd "usr"
  rm -rf "bin" "include" "lib"

  cd "share"
  rm -rf "${pkgbase}" "licenses" "man"
}

package_dcmtk18-libs() {
  pkgdesc+=" (runtime libraries)"
  depends=('gcc-libs' 'glibc' 'libpng' 'libtiff' 'libxml2' # 'openjpeg2'
           'openssl' 'zlib')
  provides=('libcmr.so' 'libdcmdata.so' 'libdcmdsig.so' 'libdcmect.so'
            'libdcmfg.so' 'libdcmimage.so' 'libdcmimgle.so' 'libdcmiod.so'
            'libdcmjpeg.so' 'libdcmjpls.so' 'libdcmnet.so' 'libdcmpmap.so'
            'libdcmpstat.so' 'libdcmqrdb.so' 'libdcmrt.so' 'libdcmseg.so'
            'libdcmsr.so' 'libdcmtkcharls.so' 'libdcmtls.so' 'libdcmtract.so'
            'libdcmwlm.so' 'libdcmxml.so' 'libi2d.so' 'libijg12.so'
            'libijg16.so' 'libijg8.so' 'liboficonv.so' 'liboflog.so'
            'libofstd.so')
  options+=('!emptydirs')

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${pkgdir}"
  find . -type f,l ! -name 'lib*.so*' -delete

  cd "usr/lib/${pkgbase}"
  for lib in lib*.so.*; do
    ln -sf "/usr/lib/${pkgbase}/${lib}" "${pkgdir}/usr/lib/${lib}"
  done
}
