# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname="dexed"
pkgver=0.9.4
pkgrel=5
pkgdesc="A software synth closely modelled on the Yamaha DX7"
arch=('i686' 'x86_64')
url="http://asb2m10.github.io/dexed/"
license=("GPL3")
groups=('pro-audio' 'vst-plugins')
depends=('alsa-lib' 'curl' 'hicolor-icon-theme' 'freetype2' 'libxinerama')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/asb2m10/dexed/archive/v${pkgver}.tar.gz"
        'dexed.desktop'
        'juce-pixel-format.patch'
        'juce-alsa.patch')
md5sums=('0e69fdcc3c18a8ac083657213a7921a2'
         'd888f8f2c1a44ed75c77d43faee73361'
         '3b8cd62ca811638639c7f6de18306849'
         'a5eb7812e4b8719547d6c7ba193d2e53')
changelog=ChangeLog


prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # https://github.com/asb2m10/dexed/pull/184
  patch -N -r - -p1 -i "${srcdir}/juce-alsa.patch" || :
  # patch JUCE to compile with GCC >= 9.x
  patch -N -r - -p1 -i "${srcdir}/juce-pixel-format.patch" || return 0
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/Builds/Linux"
  make \
    CONFIG=Release \
    CXXFLAGS="-D JUCE_JACK=1 -D JUCE_ALSA=1 -D buildVST=1 -D buildStandalone=1"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # install VST plugin
  install -Dm755 Builds/Linux/build/Dexed.so \
    "${pkgdir}/usr/lib/vst/Dexed.so"
  # install standalone program
  install -Dm755 Builds/Linux/build/Dexed \
    "${pkgdir}/usr/bin/dexed"

  # install icon and desktop file
  install -Dm755 Resources/ui/dexedIcon.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/dexed.png"
  install -Dm755 "${srcdir}/dexed.desktop" \
  "${pkgdir}/usr/share/applications/dexed.desktop"
}

# vim:set ts=2 sw=2 et:
