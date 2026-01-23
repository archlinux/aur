# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="AHFormatter"
pkgbase="${_Name,,}"
pkgname=(
  "${pkgbase}"
  "java-${pkgbase}"
)
pkgver=7.5.1.69020
_pkgver="$(awk -F. '{print $1 "." $2}' <<< "$pkgver")"
pkgrel=1
pkgdesc="Proprietary publishing engine. Generate PDF from XML or HTML. Format with XSL-FO or CSS."
arch=(
  'x86_64'
)
url="https://www.antennahouse.com/formatter-v${pkgver%%.*}"
license=(
  'custom:Antenna House EULA'
)
_pkgsrc="${pkgbase}-${_pkgver}"
source=(
  "${pkgbase}.sh"
)
source_x86_64=(
  "local://${_Name}V${_pkgver/./}-${_pkgver}E-R1.x86_64.rpm.gz"
)
sha256sums=('aa96daa7313fecdf5188978fd5e1b7611250975165b91aa1f25d640e37ed569d')
sha256sums_x86_64=('SKIP')

prepare() {
  cd "${srcdir}"
  mkdir -p "${_pkgsrc}-${CARCH}"
  bsdtar -xf "${_Name}V${_pkgver/./}-${_pkgver}E-R1.${CARCH}.rpm" --strip-components 3 -C "${srcdir}/${_pkgsrc}-${CARCH}"

  sed -e "s/@@VERSION@@/${_pkgver//.}/g" \
      -i "${pkgbase}.sh"

  cd "${_pkgsrc}-${CARCH}/etc"
  sed -i '/<font-folder path="@@HOME@@\/fonts">/c\
  <font-folder path="/usr/share/ahformatter/fonts">' font-config.xml
  sed -i '/<\/font-folder>/a\
  <font-folder path="@@HOME@@/.local/share/fonts" recursive="true"/>\
  <font-folder path="/usr/share/fonts" recursive="true"/>' font-config.xml
}

pkgver() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}/etc"
  sed -n 's|.*<entry key="build">\([^<]*\)</entry>.*|\1|p' version.xml
}

package_ahformatter() {
  depends=(
    'gcc-libs'
    'glibc'
    'icu76'
    'sh'
    'util-linux-libs'
  )
  optdepends=(
    "java-${pkgbase}: Java bindings"
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
    'libXfoTrans.so'
    'libXPSCreator.so'
  )
  backup=(
    "etc/${pkgbase}/font-config.xml"
    "etc/${pkgbase}/html.css"
  )
  install="${pkgbase}.install"

  cd "${srcdir}"
  install -vDm755 "${pkgbase}.sh" "${pkgdir}/usr/bin/AHFCmd"
  
  cd "${_pkgsrc}-${CARCH}"
  find "bin" -type f -execdir \
    install -vDm755 "{}" "${pkgdir}/usr/lib/${pkgbase}/{}" \;
  find "fonts" -type f -exec \
    install -vDm644 "{}" "${pkgdir}/usr/share/${pkgbase}/{}" \;
  find "include" -type f -exec \
    install -vDm644 "{}" "${pkgdir}/usr/{}" \;

  install -vd "${pkgdir}/usr/lib"
  find "lib" -type f,l \( -name 'lib*.so*' ! -name 'libicu*' ! -name "libXfoJavaCtl${_pkgver//.}.so" \) -execdir \
    cp -va "{}" "${pkgdir}/usr/lib/{}" \;

  install -vDm644 "ReadMe.txt" "${pkgdir}/usr/share/doc/${pkgbase}/README.txt"
  install -vDm644 "EULA.txt"   "${pkgdir}/usr/share/licenses/${pkgbase}/EULA.txt"

  cd "${srcdir}/${_pkgsrc}-${CARCH}/docs"
  find . -type f -exec \
    install -Dm644 "{}" "${pkgdir}/usr/share/doc/${pkgbase}/html/{}" \;

  cd "${srcdir}/${_pkgsrc}-${CARCH}/etc"
  find . -type f ! -name "${_Name}.lic" -exec \
    install -vDm644 "{}" "${pkgdir}/etc/${pkgbase}/{}" \;
}

package_java-ahformatter() {
  pkgdesc+=" (Java bindings)"
  depends=(
    "${pkgbase}>=${pkgver}-${pkgrel}"
    'gcc-libs'
    'glibc'
    'java-runtime>=8'
  )
  provides=(
    "libXfoJavaCtl${_pkgver/.}.so"
  )

  cd "${srcdir}/${_pkgsrc}-${CARCH}/lib"
  install -vDm644 "libXfoJavaCtl${_pkgver/.}.so" "${pkgdir}/usr/lib/libXfoJavaCtl${_pkgver/.}.so"

  find . -type f -name '*.jar' -exec \
    install -vDm644 "{}" "${pkgdir}/usr/share/java/${pkgbase}/{}" \;
}
