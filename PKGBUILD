# Maintainer: Butui Hu <hot123tea123@gmail.com>

pkgname=itk-snap-nightly-bin
_pkgname=itk-snap
pkgver=4.4.0.20251111
pkgrel=1
pkgdesc='A software application used to segment structures in 3D medical images (nightly build)'
arch=('x86_64')
url='https://www.itksnap.org'
license=('GPL-3.0-or-later')
depends=(
  curl
  gcc-libs
  glib2
  glibc
)
makedepends=(
  chrpath
  gendesk
  git
)
provides=(itk-snap=${pkgver})
conflicts=(itk-snap)
source=(
  "${_pkgname}.tar.gz::https://sourceforge.net/projects/itk-snap/files/itk-snap/Nightly/itksnap-nightly-master-Linux-gcc64.tar.gz"
  "${_pkgname}.png::https://sourceforge.net/p/itk-snap/src/ci/master/tree/GUI/Qt/Resources/logo_square.png?format=raw"
)
sha512sums=('SKIP'
            '7d7866a4f28ee645cf4a454488d197a776475d2959d0f9d4d34cf534f34a73ffbb1b92430518f36948b4c25b736990693be07dd345600ed8292e526e2846fca1')
noextract=("${_pkgname}.tar.gz")

prepare() {
  # manually extract tarball due to their unpredicted name
  mkdir "${srcdir}/${_pkgname}"
  tar xvf "${srcdir}/${_pkgname}.tar.gz" -C "${srcdir}/${_pkgname}" --strip-components 1
  echo "Creating desktop file"
  gendesk -f -n --pkgname ${_pkgname} \
    --pkgdesc "${pkgdesc}" \
    --categories "Education;Graphics;Science;DataVisualization;MedicalSoftware;Viewer" \
    --icon "${_pkgname}" \
    --exec "itksnap"
}

package() {
  cp -a "${srcdir}/${_pkgname}" "${pkgdir}/usr"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  # move translations files to correct place
  mv -v "${pkgdir}/usr/translations" "${pkgdir}/usr/lib/snap-4.4.0/translations"
  # remove rpath
  chrpath --delete "${pkgdir}/usr/lib/snap-4.4.0/ITK-SNAP"
}
# vim:set ts=2 sw=2 et:
