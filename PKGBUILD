# Maintainer: Alec Mev <alec@mev.earth>

pkgname=canaries-form-420
pkgver=8.2.0
pkgrel=1
pkgdesc='Helper program for filling out Modelo 420 of Agencia Tributaria Canaria'
arch=('x86_64')
url=http://www.gobiernodecanarias.org/tributos/portal/jsf/publico/asistenciaContribuyente/modelos/listado.jsp?tributo=IGIC
license=('custom')
depends=(
  'java-runtime'
  'ttf-ms-fonts'
)
makedepends=(
  'gendesk'
  'libarchive'
  'imagemagick'
)
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.zip::http://www.gobiernodecanarias.org/tributos/portal/estatico/asistencia_contribuyente/modelos/ref_y_propios/igic/mod420/bin/M420V820E21.zip")
sha256sums=('8a24f1fcef85f9d05f848b2a828c9976e7273e17055f5e4aaf3cb5417bb62d74')

_innerdir=I.G.I.C.-Modelo420-\(2021\)
_srcjar="${_innerdir}/pa-mod420.jar"
_pkgjar="/usr/share/java/${pkgname}/${pkgname}.jar"

prepare() {
  cat > "${pkgname}" <<EOF
#!/bin/sh
exec java -jar "${_pkgjar}" "\$@"
EOF
  gendesk \
    --pkgname "${pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --name "Agencia Tributaria Canaria Modelo 420" \
    --categories "Office;Finance;Java" \
    -n \
    -f
  local icon=escudo420_32.gif
  bsdtar --strip-components 2 -xf "${_srcjar}" "org_grecasa_ext_pa/iconos/${icon}"
  convert "${icon}" "${pkgname}.png"
  rm "${icon}"
}

package() {
  install -Dm644 "${_srcjar}" "${pkgdir}${_pkgjar}"
  install -Dm755 -t "${pkgdir}/usr/bin" "${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/applications/" "${pkgname}.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${_innerdir}/Manual_Modelo_420.pdf"
  install -Dm644 -t "${pkgdir}/usr/share/pixmaps/" "${pkgname}.png"
}

# TODO: Get rid of ttf-ms-fonts
# 
# https://bbs.archlinux.org/viewtopic.php?id=265663
# https://unix.stackexchange.com/q/645977/21976
# 
# If these two ^ don't pan out, maybe just unzip the jar, replace all
# occurrences of Arial, Helvetica, etc., and zip back up. Or, alternatively,
# patch JasperReports and return true from isAwtFontAvailable and what happens.
