# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=sourcetrail-bin
_pkgnamea=sourcetrail
_pkgname=Sourcetrail
pkgver=2019.4.61
_pkgver=${pkgver/\./\_}
pkgrel=1
pkgdesc='A cross-platform source explorer for C/C++ and Java'
arch=('x86_64')
url='https://www.sourcetrail.com'
license=('LGPL3')
makedepends=('rsync')
provides=("${_pkgnamea}=${pkgver}")
options=(!strip)
conflicts=("${pkgname}")
replaces=("${pkgname}")
source=("${_pkgnamea}-${pkgver}.tar.gz::${url}/downloads/${pkgver}/linux/64bit/"
        "${_pkgnamea}.desktop")
sha256sums=('3ba0995f3e271dcf9eb61a15e0078f89439320de1f011c376d50626fb81a27ef'
            '9254abd7c73b70d3b81a40a6993b8c305cd24535aafe0eedffcd280f7fae2a3d')
noextract=("${_pkgnamea}-${pkgver}.tar.gz")

prepare() {
  mkdir -p "${srcdir}/opt/${_pkgnamea}"
  bsdtar --strip-components 1 -xf "${_pkgnamea}-${pkgver}.tar.gz" \
         -C "${srcdir}/opt/${_pkgnamea}"
}

package() {
  rsync -rtl "${srcdir}/opt" "${pkgdir}"

  # mimetypes icons setup
  mkdir -p "${pkgdir}/usr/"
  mv "${pkgdir}/opt/sourcetrail/setup/share" "${pkgdir}/usr/"

  hicolor_dir="${pkgdir}/usr/share/icons/hicolor"
  for icon_size in 128x128 256x256 512x512 64x64; do
    mkdir "${hicolor_dir}/${icon_size}/mimetypes"
    ln -s "${hicolor_dir}/${icon_size}/apps/${_pkgnamea}.png" \
      "${hicolor_dir}/${icon_size}/mimetypes/${_pkgnamea}.png"
  done

  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/share/applications/"
  mkdir -p "${pkgdir}/usr/share/pixmaps/"
  mkdir -p "${pkgdir}/usr/share/licenses/${_pkgnamea}"

  install -m 644 "${srcdir}/${_pkgnamea}.desktop" \
            "${pkgdir}/usr/share/applications/"

  # logo
  ln -s "/opt/${_pkgnamea}/data/gui/icon/logo_1024_1024.png" \
            "${pkgdir}/usr/share/pixmaps/${_pkgnamea}.png"

  # license
  ln -s "/opt/${_pkgnamea}/EULA.txt" \
            "${pkgdir}/usr/share/licenses/${_pkgnamea}"

  # binary
  ln -s "/opt/${_pkgnamea}/${_pkgname}.sh" \
            "${pkgdir}/usr/bin/${_pkgnamea}"

}
