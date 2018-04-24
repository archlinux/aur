# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=dexed
pkgname="${_pkgname}-git"
pkgver=0.9.4.r228.eea1256
pkgrel=1
pkgdesc="A software synth closely modelled on the Yamaha DX7 (git version)"
arch=('i686' 'x86_64')
url="http://asb2m10.github.io/dexed/"
license=("GPL3")
groups=('vst-plugins')
depends=('alsa-lib' 'curl' 'hicolor-icon-theme' 'freetype2' 'libxinerama')
makedepends=('git' 'juce' 'steinberg-vst36')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-vst-git")
source=("${_pkgname}::git+https://github.com/asb2m10/dexed.git"
        'dexed.desktop')
md5sums=('SKIP'
         'd888f8f2c1a44ed75c77d43faee73361')
changelog=ChangeLog


pkgver() {
  cd "${srcdir}/${_pkgname}"

  local ver=$(cpp -dM Source/Dexed.h | grep '^#define DEXED_ID' | cut -d '"' -f 2)
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  msg2 "Building Dexed stand-alone..."
  cd "$srcdir/${_pkgname}"
  sed -i \
    -e 's|JUCE_JACK="0"|JUCE_JACK="1"|' \
    -e 's|buildVST="1"|buildVST="0"|' \
    Dexed.jucer
  Projucer --resave Dexed.jucer

  cd "${srcdir}/${_pkgname}/Builds/Linux"
  make CONFIG=Release
  cp -f build/Dexed "${srcdir}/${_pkgname}"

  msg2 "Building Dexed VST plug-in..."
  cd "$srcdir/${_pkgname}"
  sed -i \
    -e 's|JUCE_ALSA="1"|JUCE_ALSA="0"|' \
    -e 's|JUCE_JACK="1"|JUCE_JACK="0"|' \
    -e 's|buildVST="0"|buildVST="1"|' \
    -e 's|buildStandalone="1"|buildStandalone="0"|' \
    Dexed.jucer
  Projucer --resave Dexed.jucer

  cd "${srcdir}/${_pkgname}/Builds/Linux"
  make clean
  make CONFIG=Release
  cp -f build/Dexed.so "${srcdir}/${_pkgname}"
}

package() {
  cd "${srcdir}/${_pkgname}"

  # install VST plugin
  install -Dm755 Dexed.so "${pkgdir}/usr/lib/vst/Dexed.so"
  # install standalone program
  install -Dm755 Dexed "${pkgdir}/usr/bin/dexed"

  # install icon and desktop file
  install -Dm755 Resources/ui/dexedIcon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/dexed.png"
  install -Dm755 "${srcdir}/dexed.desktop" "${pkgdir}/usr/share/applications/dexed.desktop"
}

# vim:set ts=2 sw=2 et:
