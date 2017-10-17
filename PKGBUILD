# Maintainer  : George Eleftheriou <eleftg>
# Contributor : Martin Wimpress <code@flexion.org>
# Contributor : Nick Pope
# Contributor : Bryce Nordgren <bnordgren at gmail dot com>

pkgname=hdfview
_pkgname=HDFView
pkgver=2.14.0
_pkgver=${pkgver%.0}
pkgrel=1
pkgdesc="a GUI browser for hdf5 files"
arch=('i686' 'x86_64')
url="https://support.hdfgroup.org/products/java/"
license=('custom')
depends=('hdf-java' 'java-environment')
makedepends=('apache-ant')
options=(!strip)
source=("https://www.support.hdfgroup.org/ftp/HDF5/hdf-java/current/src/hdf-view/${pkgname}-${_pkgver}.tar.gz"
        "${_pkgname}.desktop"
        "${_pkgname}.ico"
        license)
md5sums=('3dafb38490718d46e359d250c7bb2377'
         '78b1eb484df4520d83bf9a20f39a65e3'
         'b86542f80203ea9f93f447fa7c20d25a'
         'db0de6079dd881781768d05de29c50e0')

prepare() {
  cd "${pkgname}-${_pkgver}"
  sed -i "s;hdf\.lib\.dir = \${env\.HDFLIBS}/lib;hdf\.lib\.dir = /opt/hdfjava-3\.3\.2/lib;" build.properties
  sed -i '731s;<chmod perm="ugo+rx">;<chmod perm="ugo+rx" maxparallel="10">;' build.xml
}

build() {
  cd "${pkgname}-${_pkgver}"
  ant package
}

package() {
  cd "${pkgname}-${_pkgver}"
  mkdir "${pkgdir}/opt"
  cp -a "build/dist/${_pkgname}-${pkgver}-Linux.sh" "${pkgdir}/opt"
  cd "${pkgdir}/opt"

  # Make extraction non interactive
  sed -i 's/interactive=TRUE/interactive=FALSE/' ${_pkgname}-${pkgver}-Linux.sh
  sed -i 's/cpack_skip_license=FALSE/cpack_skip_license=TRUE/' ${_pkgname}-${pkgver}-Linux.sh

  ./${_pkgname}-${pkgver}-Linux.sh
  rm "${_pkgname}-${pkgver}-Linux.sh"
  mkdir -p "${pkgdir}/usr/bin"

  sed -i "s:JAVABIN=${pkgdir}/opt/${_pkgname}/${pkgver}/jre/bin:JAVABIN=/opt/${_pkgname}/${pkgver}/jre/bin:" "${_pkgname}/${pkgver}/${pkgname}.sh"
  sed -i "s:INSTALLDIR=${pkgdir}/opt/${_pkgname}/${pkgver}:INSTALLDIR=/opt/${_pkgname}/${pkgver}:" "${_pkgname}/${pkgver}/${pkgname}.sh"
  cp -a "${_pkgname}/${pkgver}/${pkgname}.sh" "${pkgdir}/usr/bin"

  # Desktop files, icons, wrappers and license
  install -D -m 644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -D -m 644 "${srcdir}/${_pkgname}.ico" "${pkgdir}/usr/share/pixmaps/${_pkgname}.ico"
  install -D -m 644 "${srcdir}/license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
