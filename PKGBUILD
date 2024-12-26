# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="localDimFinder"
pkgname="${_binname,,}"
pkgver=1.0
pkgrel=1
pkgdesc="A Bertini module for computing local dimensions of algebraic sets"
arch=('x86_64' 'i686')
url="https://bertini.nd.edu/LocalDimFinder/index.html"
license=('custom:Bertini License')
replaces=("${pkgname}-bin")
_pkgsrc="${pkgname}-${pkgver}"
source=("LICENSE::https://bertini.nd.edu/Bertini_License"
        # "EXAMPLES.tar.gz::https://bertini.nd.edu/LocalDimFinder/MechanismMobilityExamples.tar.gz")
        "EXAMPLES.zip::https://bertini.nd.edu/LocalDimFinder/MechanismMobilityExamples.zip")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::https://bertini.nd.edu/LocalDimFinder/LocalDimFinderLinux64_v${pkgver}.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::https://bertini.nd.edu/LocalDimFinder/LocalDimFinderLinux32_v${pkgver}.tar.gz")
sha256sums=('e53c1b505126e6f4ab9ddaedd5b807303b693b8d4997f13a502bc902569ab1f1'
            'd82865bf2f9eff6186862aed21e88dfa1b343e8529715c1e9da3609f45c1fb0c')
sha256sums_x86_64=('0115dbc1d65d93d16aa140c903d3970dbb6892157451a8ad47bd0610e72ce5c9')
sha256sums_i686=('a441985e59568da91c532eaf06f3cb93e3fccb872cbd2d7910c87825fd38bfa5')

case "${CARCH}" in
  x86_64)
    _bit="64"
    ;;
  i686)
    _bit="32"
    ;;
  *)
    echo "Unsupported architecture: ${CARCH}"
    ;;
esac

prepare() {
  cd "${srcdir}"
  rm -rf "${_pkgsrc}-${CARCH}" "examples"
  mv -f "LocalDimFinderLinux${_bit}_v${pkgver}" "${_pkgsrc}-${CARCH}"
  mv -f "MechanismMobilityExamples" "examples"

  cd "${_pkgsrc}-${CARCH}"
  sed -i 's/test_points_/test_points/' "README"
}

package() {
  cd "${srcdir}"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  find "examples" -type f -exec install -vDm644 "{}" "${pkgdir}/usr/share/doc/${pkgname}/{}" \;

  cd "${_pkgsrc}-${CARCH}"
  install -vDm755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"

  install -vDm644 "README"             "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "LocalDimFinder.pdf" "${pkgdir}/usr/share/doc/${pkgname}/MANUAL.pdf"

  install -vDm644 "inputCircleLine"        "${pkgdir}/usr/share/doc/${pkgname}/examples/inputCircleLine"
  install -vDm644 "test_points_CircleLine" "${pkgdir}/usr/share/doc/${pkgname}/examples/test_pointsCircleLine"
}
