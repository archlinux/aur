# Maintainer: Alec Mev <alec@mev.earth>

_form=420 # To make it easier to clone this PKGBUILD for other forms
pkgname="canaries-form-${_form}"
pkgver=8.4.0
pkgrel=1
pkgdesc="Helper program for filling out Modelo ${_form} of Agencia Tributaria Canaria"
arch=('x86_64')
url=https://www3.gobiernodecanarias.org/tributos/atc/jsf/publico/asistenciaContribuyente/modelos/listado.jsp?tributo=IGIC
license=('custom')
_java=11 # Latest working supported version (11 is LTS, broken in 16)
depends=(
  "java-runtime=${_java}"
  'ttf-ms-fonts'
)
makedepends=(
  'gendesk'
  'libarchive'
  'imagemagick'
)
install="${pkgname}.install"
_year=23
_zipname="M${_form}V${pkgver//./}E${_year}"
source=("${pkgname}-${pkgver}.zip::https://www.gobiernodecanarias.org/tributos/atc/estatico/asistencia_contribuyente/modelos/ref_y_propios/igic/mod${_form}/bin/${_zipname}.zip")
sha256sums=('5d0fb49d025c38cb794deb6eeadd8494c606c410531b9da54d569635cb295202')

_innerdir="${_zipname}/I.G.I.C.-Modelo${_form}-(20${_year})"
_srcjar="${_innerdir}/pa-mod${_form}.jar"
_pkgjar="/usr/share/java/${pkgname}/${pkgname}.jar"

prepare() {
  # Borrowed from https://aur.archlinux.org/cgit/aur.git/tree/pdfsam?h=pdfsam
  cat > "${pkgname}" <<EOF
#!/bin/sh
_x="\`archlinux-java status | grep "${_java}" | awk '{ print \$1 }' | head -1\`"
exec "/usr/lib/jvm/\${_x%/*}/bin/java" -jar "${_pkgjar}" "\$@"
EOF
  gendesk \
    --pkgname "${pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --name "Agencia Tributaria Canaria Modelo ${_form}" \
    --categories "Office;Finance;Java" \
    -n \
    -f
  local icon="escudo${_form}_32.gif"
  bsdtar --strip-components 2 -xf "${_srcjar}" "org_grecasa_ext_pa/iconos/${icon}"
  convert "${icon}" "${pkgname}.png"
  rm "${icon}"
}

package() {
  install -Dm644 "${_srcjar}" "${pkgdir}${_pkgjar}"
  install -Dm755 -t "${pkgdir}/usr/bin" "${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/applications/" "${pkgname}.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${_innerdir}/Manual_Modelo_${_form}.pdf"
  install -Dm644 -t "${pkgdir}/usr/share/pixmaps/" "${pkgname}.png"
}

# TODO: Get rid of ttf-ms-fonts
# 
# https://bbs.archlinux.org/viewtopic.php?id=265663
# https://unix.stackexchange.com/q/645977/21976
# 
# If these two ^ don't pan out, maybe just unzip the jar, replace all
# occurrences of Arial, Helvetica, etc., and zip back up. Alternatively, patch
# JasperReports and return true from isAwtFontAvailable and see what happens.
