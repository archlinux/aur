# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
# Contributor  : George Eleftheriou <eleftg>
# Contributor : Martin Wimpress <code@flexion.org>
# Contributor : Nick Pope
# Contributor : Bryce Nordgren <bnordgren at gmail dot com>
pkgname=hdfview-bin
_pkgname=HDFView
pkgver=3.1.0
pkgrel=1
pkgdesc="a GUI browser for reading hdf5 files - prebuilt binaries from the HDF group"
arch=('x86_64')
url="https://www.hdfgroup.org/downloads/hdfview/"
license=('custom')
provides=('hdfview')
replaces=('hdfview-beta')
conflicts=('hdfview-beta' 'hdfview')
source=("local://${_pkgname}-${pkgver}-centos7_64.tar.gz"
        ${_pkgname}.desktop
        HDF_logo.svg)
sha512sums=('f7828cf8bd23ef065971722a49d58e52668bb96a4e10015191355357fd92e401f357cab8a1eb2463a031ce4955c108df9f1eaea2d99008250612d25a7fa84f90'
            'c92d8cd4818feabb996b43c81e4e554e16f8120c80c73a5b7cc8bb2c4c4a59bdd47d42b19ec7a3454f855155ba17b65631e7016f891f29ef4ee8fd4ee45caf90'
            '649eb81f33a3b38a7ae2ee9a7f286ffa489d0bd7a9f37a0face64fe7956863dcab2131be3792c45dc03b1a6955fda2b37d168698922e938b73c90d24fee7a8c4')

package() {
  mkdir "${pkgdir}/opt"
  cp -a "${_pkgname}-${pkgver}-Linux.sh" "${pkgdir}/opt"
  cd "${pkgdir}/opt"

  # Make extraction non interactive
  sed -i 's/interactive=TRUE/interactive=FALSE/' ${_pkgname}-${pkgver}-Linux.sh
  sed -i 's/cpack_skip_license=FALSE/cpack_skip_license=TRUE/' ${_pkgname}-${pkgver}-Linux.sh

  ./${_pkgname}-${pkgver}-Linux.sh
  rm "${_pkgname}-${pkgver}-Linux.sh"

  mkdir -p "${pkgdir}/usr/bin"

  # Desktop files, icons, wrappers and license
  echo "#!/usr/bin/env bash" > "${pkgdir}/usr/bin/hdfview"
  echo "/opt/HDFView/${pkgver}/hdfview.sh "'-root $PWD "$@"' >> "${pkgdir}/usr/bin/hdfview"
  chmod 755 "${pkgdir}/usr/bin/hdfview"
  install -D -m 644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -D -m 644 "${srcdir}/HDF_logo.svg" "${pkgdir}/usr/share/pixmaps/HDF_logo.svg"
  install -D -m 644 "${srcdir}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
