# Maintainer: Alec Mev <alec@mev.earth>

# Based on canaries-form-420, all comments and history are there

_form=425
pkgname="canaries-form-${_form}"
pkgver=6.1.0
pkgrel=1
pkgdesc="Helper program for filling out Modelo ${_form} of Agencia Tributaria Canaria"
arch=('x86_64')
url=https://www3.gobiernodecanarias.org/tributos/atc/jsf/publico/asistenciaContribuyente/modelos/listado.jsp?tributo=IGIC
license=('custom')
_java=11
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
sha256sums=('32e20d6524216772329c7e992e0c1f0166dc62c810e6d7d4f52ba0ebf5091de0')

_innerdir="${_zipname}/I.G.I.C.-Modelo${_form}-(20${_year})"
_srcjar="${_innerdir}/pa-mod${_form}.jar"
_pkgjar="/usr/share/java/${pkgname}/${pkgname}.jar"

prepare() {
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
