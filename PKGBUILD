# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname="dexed"
pkgver=0.9.4
pkgrel=4
pkgdesc="A software synth closely modelled on the Yamaha DX7"
arch=('i686' 'x86_64')
url="http://asb2m10.github.io/dexed/"
license=("GPL3")
groups=('vst-plugins')
depends=('alsa-lib' 'curl' 'hicolor-icon-theme' 'freetype2' 'libxinerama')
makedepends=('steinberg-vst36')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/asb2m10/dexed/archive/v${pkgver}.tar.gz"
        'dexed.desktop')
md5sums=('0e69fdcc3c18a8ac083657213a7921a2'
         'd888f8f2c1a44ed75c77d43faee73361')
changelog=ChangeLog


build() {
  msg2 "Building Dexed stand-alone..."
  cd "${srcdir}/${pkgname}-${pkgver}/Builds/Linux"
  make CONFIG=Release CXXFLAGS="-D JUCE_JACK=1 -D JUCE_ALSA=1 -D buildVST=0 -D buildStandalone=1"
  cp -f build/Dexed "${srcdir}/${pkgname}-${pkgver}"

  msg2 "Building Dexed VST plug-in..."
  cd "${srcdir}/${pkgname}-${pkgver}/Builds/Linux"
  make clean
  make CONFIG=Release CXXFLAGS="-D JUCE_JACK=0 -D JUCE_ALSA=0 -D buildVST=1 -D buildStandalone=0"
  cp -f build/Dexed.so "${srcdir}/${pkgname}-${pkgver}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # install standalone program
  install -Dm755 Dexed "${pkgdir}/usr/bin/dexed"
  # install VST plugin
  install -Dm755 Dexed.so "${pkgdir}/usr/lib/vst/Dexed.so"

  # install icon and desktop file
  install -Dm755 Resources/ui/dexedIcon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/dexed.png"
  install -Dm755 "${srcdir}/dexed.desktop" "${pkgdir}/usr/share/applications/dexed.desktop"
}

# vim:set ts=2 sw=2 et:
