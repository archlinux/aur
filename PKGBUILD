# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=navio
pkgver=2.13.5492
pkgrel=1
pkgdesc="A digital platform that accompanies Macmillan Education’s English language courses for young learners"
arch=("x86_64")
url="https://lms-api-prod-navio.macmillan.education/PBF/apps"
license=("custom")
depends=("alsa-lib" "cairo" "gcc-libs" "gdk-pixbuf2" "glib2" "glibc" "gtk2" "libcups" "libgdiplus" "librsvg" "libx11" "libxinerama" "libxslt" "libxss" "mono" "nspr" "nss" "sqlite" "unixodbc")
DLAGENTS=("https::/usr/bin/curl --referer https://lms-api-prod-${navio}.macmillan.education/PBF/apps --output %o %u")
source=(
  "${pkgname}-${pkgver}.zip::https://lms-api-prod-${pkgname}.macmillan.education/ACEApi/PdfExport/downloadapp?environmentId=Linux64Bit_1404"
  "${pkgname}.desktop"
  "LICENSE"
)
sha256sums=(
  "2663b282fdda27a775eea1f2a7d3abfdebddffa047916caa7b8573755dff2440"
  "701446fe566d31ca485fbc4e2c6a9b9063ab8ae4b3d832f85009077661b52856"
  "df577fcc17403eb242e5e180488cfdb19226df44582ce86729e42f75586049b8"
)

prepare() {
  cd "${srcdir}"

  sed -n '/\x1F/,$p' "${srcdir}/install_${pkgname}64.run" > "${srcdir}/${pkgname}.tar.gz"
  tar -xf "${srcdir}/${pkgname}.tar.gz" -C . ./data.tar
  tar -xf "data.tar" -C .
}

package() {
  cd "${srcdir}"

  rm -rf "${srcdir}/Navio/gconf2-common_3.2.6-7_all.deb"
  rm -rf "${srcdir}/Navio/libgconf-2-4_3.2.6-7_amd64.deb"

  install -d "${pkgdir}/opt"
  cp -r "${srcdir}/Navio" "${pkgdir}/opt/"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/Navio/Navio_Data/Plugins/ThirdPartyNotices.txt" "${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices.txt"
  install -Dm755 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
