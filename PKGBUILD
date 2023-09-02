# Maintainer: Butui Hu <hot123tea123@gmail.com>

_pkgname=QuPath
pkgname=qupath
pkgver=0.4.4
pkgrel=1
pkgdesc='Bioimage analysis & digital pathology'
arch=('x86_64')
url='https://github.com/qupath/qupath'
license=('GPL')
depends=(
  freetype2
  gcc-libs
  giflib
  harfbuzz
  lcms2
  libjpeg-turbo
  libpng
  libtiff
  libxml2
)
makedepends=(
  'gendesk'
  'gradle'
  'java-environment=17'
)
optdepends=(
  'ttf-droid: font for CJK characters'
)
options=(!strip)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/qupath/qupath/archive/v${pkgver}.tar.gz")
sha512sums=('cb4cecb08932f16baf993fef385e9bf47c945e4fe676c989a69b6d371be0472a55b6e204c09f0cb83928e1ff3b8826d6b2559f031423adff1b9c1301154ee7d1')

prepare() {
  echo "Creating desktop file"
  gendesk -f -n --pkgname ${pkgname} \
    --pkgdesc "${pkgdesc}" \
    --categories "Graphics;MedicalSoftware;Science;" \
    --icon "/opt/${_pkgname}/lib/${_pkgname}.png" \
    --exec "${pkgname}"
}

build() {
  cd "${pkgname}-${pkgver}"
  # you could also build it with gradle wrapper
  # ./gradlew clean jpackage
  gradle clean jpackage -Porg.gradle.java.home=/usr/lib/jvm/default
}

package() {
  install -d ${pkgdir}/opt
  cp -a ${srcdir}/${pkgname}-${pkgver}/build/dist/${_pkgname} ${pkgdir}/opt/${_pkgname}
  install -d "${pkgdir}/usr/bin"
  ln -sf "/opt/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  # create libtiff.so.5 softlink to /usr/lib/libtiff.so
  ln -sf "/usr/lib/libtiff.so" "${pkgdir}/opt/QuPath/lib/app/libtiff.so.5"
}
# vim:set ts=2 sw=2 et:
