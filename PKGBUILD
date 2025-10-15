# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="AHFormatter"
pkgname="${_Name,,}"
pkgver=7.4.11.66458
_pkgver="$(awk -F. '{print $1 "." $2}' <<< "$pkgver")"
pkgrel=3
pkgdesc="Proprietary publishing engine. Generate PDF from XML or HTML. Format with XSL-FO or CSS."
arch=('x86_64')
url="https://www.antennahouse.com/formatter-v${pkgver%%.*}"
license=('custom:Antenna House EULA')
depends=(
  'gcc-libs'
  'glibc'
  'icu74'
  'sh'
  'util-linux-libs'
)
optdepends=(
  'java-runtime>=8: Java bindings'
)
provides=(
  'libAHCGM.so'
  'libAHCommon.so'
  'libAHFontService.so'
  'libAHGraphicService.so'
  'libAHMathML.so'
  'libAHPDFLib.so'
  'libAHRasterizer.so'
  'libAHskia.so'
  'libAHSVG.so'
  'libOOXMLCreator.so'
  'libPDFCreator.so'
  'libPDFLinearizer.so'
  'libPDFRes.so'
  'libPDFToolPage.so'
  'libPSCreator.so'
  'libSVGCreator.so'
  'libXfoCommon.so'
  'libXfoEngine.so'
  'libXfoFont.so'
  'libXfoGraphic.so'
  'libXfoHyphen.so'
  'libXfoInterface.so'
  'libXfoRender.so'
  'libXfoText.so'
  # 'libXfoJavaCtl74.so' ???
  'libXfoTrans.so'
  'libXPSCreator.so'
)
backup=(
  "etc/${pkgname}/font-config.xml"
  "etc/${pkgname}/html.css"
)
install="${pkgname}.install"
_pkgsrc="${pkgname}-${_pkgver}"
source=("${pkgname}.sh")
source_x86_64=("local://${_Name}V${_pkgver//./}-${_pkgver}E-MR10.x86_64.rpm.gz")
sha256sums=('394440f3bc32e579398c2a8989125ac9412ecbe4454a6bccf5dd3d96cb28496e')
sha256sums_x86_64=('27e6fc937fd49b656122b2712eaf7c6a503989efcf644528cde0a14ec4ff6662')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_Name}V${_pkgver//./}-${_pkgver}E-MR10.${CARCH}.rpm" -C "${srcdir}/${_pkgsrc}-${CARCH}"

  cd "${srcdir}/${_pkgsrc}-${CARCH}/usr/${_Name}V${_pkgver//./}/etc"
  sed -i '/<font-folder path="@@HOME@@\/fonts">/c\
  <font-folder path="/usr/share/ahformatter/fonts">' font-config.xml
  sed -i '/<\/font-folder>/a\
  <font-folder path="@@HOME@@/.local/share/fonts" recursive="true"/>\
  <font-folder path="/usr/share/fonts" recursive="true"/>' font-config.xml
}

pkgver() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}/usr/${_Name}V${_pkgver//./}/etc"
  sed -n 's|.*<entry key="build">\([^<]*\)</entry>.*|\1|p' version.xml
}

package() {
  cd "${srcdir}"
  install -vDm755 "${pkgname}.sh" "${pkgdir}/usr/bin/AHFCmd"
  
  cd "${_pkgsrc}-${CARCH}/usr/${_Name}V${_pkgver//./}"
  find "bin" -type f -execdir \
    install -vDm755 "{}" "${pkgdir}/usr/lib/${pkgname}/{}" \;
  find "fonts" -type f -exec \
    install -vDm644 "{}" "${pkgdir}/usr/share/${pkgname}/{}" \;
  find "include" -type f -exec \
    install -vDm644 "{}" "${pkgdir}/usr/{}" \;

  install -vd "${pkgdir}/usr/lib"
  find "lib" -type f,l \( -name 'lib*.so*' ! -name 'libicu*' \) -execdir \
    cp -va "{}" "${pkgdir}/usr/lib/{}" \;
  find "lib" -type f -name '*.jar' -execdir \
    install -vDm644 "{}" "${pkgdir}/usr/share/java/${pkgname}/{}" \;

  install -vDm644 "ReadMe.txt" "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
  install -vDm644 "EULA.txt"   "${pkgdir}/usr/share/licenses/${pkgname}/EULA.txt"

  cd "${srcdir}/${_pkgsrc}-${CARCH}/usr/${_Name}V${_pkgver//./}/docs"
  find . -type f -exec \
    install -Dm644 "{}" "${pkgdir}/usr/share/doc/${pkgname}/html/{}" \;

  cd "${srcdir}/${_pkgsrc}-${CARCH}/usr/${_Name}V${_pkgver//./}/etc"
  find . -type f ! -name "${_Name}.lic" -exec \
    install -vDm644 "{}" "${pkgdir}/etc/${pkgname}/{}" \;
}
