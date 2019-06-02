# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=sourcetrail
_pkgname=Sourcetrail
pkgver=2019.2.39
_pkgver=${pkgver/\./\_}
pkgrel=1
pkgdesc='A cross-platform source explorer for C/C++ and Java'
arch=('x86_64')
url='https://www.sourcetrail.com'
license=('custom')
conflicts=('coati')
replaces=('coati')
makedepends=('rsync')
provides=("${pkgname}=${pkgver}")
options=(!strip)
source=("${pkgname}-${pkgver}.tar.gz::${url}/downloads/${pkgver}/linux/64bit/"
        "${pkgname}.desktop")
sha256sums=('182487761bedc3545e377998c047cbe2bf55aea438108e97d9c9d1b2b4757f8e'
            '9254abd7c73b70d3b81a40a6993b8c305cd24535aafe0eedffcd280f7fae2a3d')
noextract=("${pkgname}-${pkgver}.tar.gz")

prepare() {
  mkdir -p "${srcdir}/opt/${pkgname}"
  bsdtar --strip-components 1 -xf "${pkgname}-${pkgver}.tar.gz" \
         -C "${srcdir}/opt/${pkgname}"
}

package() {
  rsync -rtl "${srcdir}/opt" "${pkgdir}"

  # mimetypes icons setup
  mkdir -p "${pkgdir}/usr/"
  mv "${pkgdir}/opt/sourcetrail/setup/share" "${pkgdir}/usr/"

  hicolor_dir="${pkgdir}/usr/share/icons/hicolor"
  for icon_size in 128x128 256x256 512x512 64x64; do
    mkdir "${hicolor_dir}/${icon_size}/mimetypes"
    ln -s "${hicolor_dir}/${icon_size}/apps/${pkgname}.png" \
      "${hicolor_dir}/${icon_size}/mimetypes/${pkgname}.png"
  done

  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/applications/"
  mkdir -p "${pkgdir}/usr/share/pixmaps/"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

  install -m 644 "${srcdir}/${pkgname}.desktop" \
            "${pkgdir}/usr/share/applications/"

  # logo
  ln -s "/opt/${pkgname}/data/gui/icon/logo_1024_1024.png" \
            "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # license
  ln -s "/opt/${pkgname}/EULA.txt" \
            "${pkgdir}/usr/share/licenses/${pkgname}"

  # binary
  ln -s "/opt/${pkgname}/${_pkgname}.sh" \
            "${pkgdir}/usr/bin/${pkgname}"

}
