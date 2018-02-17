# Maintainer: gato_lento <vukk.euob at gmail>
# Based on helm-git PKGBUILD by: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname='helm'
pkgver=0.9.0
pkgrel=4
pkgdesc='a cross-platform, polyphonic synthesizer, available standalone and as an LV2 plugin'
arch=('x86_64')
url='http://tytel.org/helm/'
license=('GPL')
groups=('lv2-plugins')
depends=('alsa-lib' 'freetype2' 'mesa' 'libxinerama' 'curl' 'hicolor-icon-theme')
makedepends=('jack' 'libxcursor')
conflicts=('helm-git')
source=("https://github.com/mtytel/helm/archive/v${pkgver}.tar.gz")
sha256sums=('4004c11fd1d773cc2a12adb5336873bc86c5ecbd370b8da2820fed6ef5ec58ad')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  for build in standalone/builds/linux builds/linux/VST builds/linux/LV2; do
    sed -i -e 's|JUCE_INCLUDE_PNGLIB_CODE=0|JUCE_INCLUDE_PNGLIB_CODE=1|g' \
      "${build}/Makefile"
  done
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  CXXFLAGS="${CXXFLAGS} -DHAVE_LROUND -Wno-error"
  make PREFIX="/usr" standalone lv2
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  CXXFLAGS="${CXXFLAGS} -DHAVE_LROUND -Wno-error"
  make DESTDIR="$pkgdir" install_standalone install_lv2
}
