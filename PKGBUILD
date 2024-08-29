# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="localDimFinder"
_pkgname="${_binname,,}"
pkgname="${_pkgname}-bin"
pkgver=1.0
pkgrel=3
pkgdesc="A Bertini module for computing local dimensions of algebraic sets"
arch=('x86_64' 'i686')
url="https://bertini.nd.edu/LocalDimFinder/index.html"
_url="https://bertini.nd.edu/LocalDimFinder"
license=('custom:Bertini license')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("https://bertini.nd.edu/Bertini_License"
        "EXAMPLES.zip::${_url}/MechanismMobilityExamples.zip")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/LocalDimFinderLinux64_v${pkgver}.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${_url}/LocalDimFinderLinux32_v${pkgver}.tar.gz")
noextract=("${_pkgsrc}-x86_64.tar.gz"
           "${_pkgsrc}-i686.tar.gz"
           "EXAMPLES.zip")
sha256sums=('e53c1b505126e6f4ab9ddaedd5b807303b693b8d4997f13a502bc902569ab1f1'
            'd82865bf2f9eff6186862aed21e88dfa1b343e8529715c1e9da3609f45c1fb0c')
sha256sums_x86_64=('0115dbc1d65d93d16aa140c903d3970dbb6892157451a8ad47bd0610e72ce5c9')
sha256sums_i686=('a441985e59568da91c532eaf06f3cb93e3fccb872cbd2d7910c87825fd38bfa5')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}-${CARCH}"
  mkdir -p "${srcdir}/examples"

  bsdtar -xzf "${_pkgsrc}-${CARCH}.tar.gz" --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
  bsdtar -xzf "EXAMPLES.zip" --strip-components 1 -C "${srcdir}/examples"

  cd "${_pkgsrc}-${CARCH}"
  sed -i 's/test_points_/test_points/' "README"
}

package() {
  cd "${srcdir}"
  install -Dm644 "Bertini_License" "${pkgdir}/usr/share/licenses/${_binname}/Bertini_License"

  find "examples" -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/${_binname}/{}" \;

  cd "${_pkgsrc}-${CARCH}"
  install -Dm755 "${_binname}"        "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "README"             "${pkgdir}/usr/share/doc/${_binname}/README"
  install -Dm644 "LocalDimFinder.pdf" "${pkgdir}/usr/share/doc/${_binname}/MANUAL.pdf"

  install -Dm644 "inputCircleLine"        "${pkgdir}/usr/share/doc/${_binname}/examples/inputCircleLine"
  install -Dm644 "test_points_CircleLine" "${pkgdir}/usr/share/doc/${_binname}/examples/test_pointsCircleLine"
}
