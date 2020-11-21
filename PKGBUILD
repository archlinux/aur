# Maintainer  : Chris Billington <chrisjbillington>
# Maintainer  : Martin Diehl <MartinDiehl>
# Maintainer  : Georgios Eleftheriou <eleftg>
# Contributor : Martin Wimpress <code@flexion.org>
# Contributor : Nick Pope
# Contributor : Bryce Nordgren <bnordgren at gmail dot com>

pkgname=hdfview
_pkgname=HDFView
pkgver=3.1.1
_pkgver=${pkgver::-2}
pkgrel=1
pkgdesc="a GUI browser for reading hdf5 files"
arch=('x86_64')
url="https://www.hdfgroup.org/downloads/hdfview/"
license=('custom')
depends=('hdf5110')
optdepends=(hdf4)
replaces=('hdfview-beta')
conflicts=('hdfview-beta')
makedepends=('ant' 'java-environment')
options=(!strip)
source=("${pkgname}-${pkgver}.tar.gz::https://support.hdfgroup.org/ftp/HDF5/releases/HDF-JAVA/hdfview-${pkgver}/src/hdfview-${pkgver}.tar.gz"
        ${_pkgname}.desktop
        HDF_logo.svg)
sha512sums=('c1ae719059d32a568c34f0526aad2adbf87f1a88cd3b4d9509a3373a6c1cb31c6223bc985740cf7edf0673c1e08c0addadf926a84c91806826cbb1c7514615d7'
            'c92d8cd4818feabb996b43c81e4e554e16f8120c80c73a5b7cc8bb2c4c4a59bdd47d42b19ec7a3454f855155ba17b65631e7016f891f29ef4ee8fd4ee45caf90'
            '649eb81f33a3b38a7ae2ee9a7f286ffa489d0bd7a9f37a0face64fe7956863dcab2131be3792c45dc03b1a6955fda2b37d168698922e938b73c90d24fee7a8c4')

prepare() {
  cd "${pkgname}-${pkgver}"

  if pacman -Q hdf4
  then
    sed 's,^hdf.lib.dir.*,hdf.lib.dir = /opt/hdf4/lib,g' -i build.properties
  else
    sed 's,^hdf.lib.dir.*,hdf.lib.dir = /opt/hdf5110/lib,g' -i build.properties
  fi

  sed 's,^hdf5.lib.dir.*,hdf5.lib.dir = /opt/hdf5110/lib,g' -i build.properties
}

build() {
  cd "${pkgname}-${pkgver}"
  ant package
}

package() {
    cd "${pkgname}-${pkgver}"
    mkdir "${pkgdir}/opt"
    cp -a "build/dist/${_pkgname}-${pkgver}-Linux.sh" "${pkgdir}/opt"
    cd "${pkgdir}/opt"

    # Make extraction non interactive
    sed -i 's/interactive=TRUE/interactive=FALSE/' ${_pkgname}-${pkgver}-Linux.sh
    sed -i 's/cpack_skip_license=FALSE/cpack_skip_license=TRUE/' ${_pkgname}-${pkgver}-Linux.sh

    ./${_pkgname}-${pkgver}-Linux.sh
    rm "${_pkgname}-${pkgver}-Linux.sh"

    # use default java
    rm -rf ${pkgdir}/opt/${_pkgname}/${pkgver}/jre
    sed -i 's:export JAVABIN=$INSTALLDIR/jre/bin:export JAVABIN=/usr/lib/jvm/default-runtime/bin:' ${pkgdir}/opt/${_pkgname}/${pkgver}/hdfview.sh

    mkdir -p "${pkgdir}/usr/bin"

    # Desktop files, icons, wrappers and license
    echo "#!/usr/bin/env bash" > "${pkgdir}/usr/bin/hdfview"
    echo "/opt/HDFView/${pkgver}/hdfview.sh "'-root $PWD "$@"' >> "${pkgdir}/usr/bin/hdfview"
    chmod 755 "${pkgdir}/usr/bin/hdfview"
    install -D -m 644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -D -m 644 "${srcdir}/HDF_logo.svg" "${pkgdir}/usr/share/pixmaps/HDF_logo.svg"
    install -D -m 644 "${srcdir}/${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
