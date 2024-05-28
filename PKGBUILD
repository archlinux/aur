# Maintainer: dreieck

_pkgname=vfrflight
pkgname="${_pkgname}-bin"
pkgver=2.3.1
pkgrel=5
pkgdesc="Tool for VFR flight planning developed by real world private pilot. Can be used for real world flight planning and trainings in FSX / FSX:SE / Prepar3D / X-Plane 10/11 and FlightGear."
arch=(
  'any'
)
url="http://web.archive.org/web/20230520051005/http://vfrflight.org/en/index.html"
license=('custom')
depends=(
  'bash'
  'java-environment>=1.7'
)
makedepends=(
)
optdepends=(
  "flightgear-addon-vfrflight: For communication between flightgear and ${_pkgname}."
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "https://www.huwig.de/aur/VfrFlight-${pkgver}.zip"
  "vfrflight.sh"
  "TERMS_OF_USE.txt"
)
sha256sums=(
  '4248c8da66b109e2145c8cb7542eaa6dca25174cf40cba06762762787c40ddbf'
  '6e11fbcdbfbf7d7e3ebba164513b201a8935745230c2e3c6e279f85de1f0a6af'
  '62322af524e2448f04ea289d9881a31ed87e4ba4dbca22e643ec4b2c831c17dd'
)

build() {
  cd "${srcdir}"
  msg2 "Generating information files on where to find documentation."
  printf '%s\n' "${url}" > "${srcdir}/upstream.url"
  printf '%s\n' "http://web.archive.org/web/20230205010920/http://vfrflight.org/en/documentation.html" > "${srcdir}/doc.url"
}

package() {
  cd "${srcdir}"

  install -d -v -m755 "${pkgdir}/opt/${_pkgname}"
  cp -rv "${srcdir}/VfrFlight-${pkgver}"/* "${pkgdir}/opt/${_pkgname}/"

  install -D -v -m755 "${srcdir}/vfrflight.sh" "${pkgdir}/usr/bin/vfrflight"

  for _docfile in upstream.url doc.url; do
    install -D -v -m644 "${srcdir}/${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  ln -svr "${pkgdir}/opt/${_pkgname}" "${pkgdir}/usr/share/doc/${_pkgname}/installation_dir"

  install -D -v -m644 "${srcdir}/TERMS_OF_USE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/TERMS_OF_USE.txt"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/TERMS_OF_USE.txt" "${pkgdir}/usr/share/doc/${_pkgname}/TERMS_OF_USE.txt"
}
