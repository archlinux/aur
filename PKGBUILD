# Maintainer: Butui Hu <hot123tea123@gmail.com>

pkgname=3dslicer-nightly-bin
_pkgname=3dslicer
pkgver=20230913.31938
pkgrel=1
pkgdesc='A free, open source and multi-platform software package widely used for medical, biomedical, and related imaging research (nightly build)'
arch=('x86_64')
url='https://www.slicer.org'
license=('BSD')
depends=(
  'dbus'
  'glib2'
)
makedepends=('gendesk')
provides=(3dslicer)
conflicts=('3dslicer')
source=(
    "${_pkgname}-${pkgver}.tar.gz::http://download.slicer.org/download?os=linux&stability=nightly"
    "${_pkgname}.svg::https://www.slicer.org/assets/img/3D-Slicer-Mark.svg"
)
noextract=("${_pkgname}.tar.gz")
sha512sums=('1e81e04f7d97ccddda2a04ef87924435f1629946ef4c79002b8ee68802c8ce7470627100a76b257aa342c5cfd049024d0453617c55798577d2f556b8c875706c'
            '3422d244f819a7ec4c475d3d8a90c79fcb73738920c0830b100c6342ca24d5be607ba60ee3d91892402036a0adf31d5ab7c8fc83f451121a7b537f7de5306014')
options=('!strip' '!emptydirs')

prepare() {
# manually extract tarball due to their unpredicted name
  mkdir "${srcdir}/${_pkgname}"
  tar xvf "${srcdir}/${_pkgname}-${pkgver}.tar.gz" -C "${srcdir}/${_pkgname}" --strip-components 1

  echo "Creating desktop file"
  gendesk -f -n --pkgname ${_pkgname} \
    --pkgdesc "${pkgdesc}" \
    --categories "Graphics;MedicalSoftware;Science;" \
    --icon "${_pkgname}" \
    --exec "Slicer"
}

package() {
  install -d "${pkgdir}/opt" "${pkgdir}/usr/bin"
  mv -v "${srcdir}/${_pkgname}" "${pkgdir}/opt"
  ln -s /opt/${_pkgname}/Slicer "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/${_pkgname}.svg" "${pkgdir}/usr/share/pixmaps/${_pkgname}.svg"
}
# vim:set ts=2 sw=2 et:

