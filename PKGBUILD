# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=dexed
pkgname="${_pkgname}-git"
pkgver=0.9.4.1.r246.760f9ef
pkgrel=1
pkgdesc="A software synth closely modelled on the Yamaha DX7 (git version)"
arch=('i686' 'x86_64')
url="http://asb2m10.github.io/dexed/"
license=("GPL3")
groups=('pro-audio' 'vst-plugins')
depends=('alsa-lib' 'curl' 'hicolor-icon-theme' 'freetype2' 'libxinerama')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-vst-git")
source=("${_pkgname}::git+https://github.com/asb2m10/dexed.git"
        'dexed.desktop'
        'juce-pixel-format.patch')
md5sums=('SKIP'
         'd888f8f2c1a44ed75c77d43faee73361'
         '3b8cd62ca811638639c7f6de18306849')
changelog=ChangeLog


pkgver() {
  cd "${srcdir}/${_pkgname}"

  local ver=$(cpp -dM Source/Dexed.h | grep '^#define DEXED_ID' | cut -d '"' -f 2)
  # replace alpha chars with a dot
  ver=$(echo $ver | sed -e 's/[a-z]\+/./')
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}


prepare() {
  cd "${srcdir}/${_pkgname}"
  # patch JUCE to compile with GCC >= 9.x
  patch -N -r - -p1 -i "${srcdir}/juce-pixel-format.patch" || return 0
}

build() {
  cd "${srcdir}/${_pkgname}/Builds/Linux"
  make \
    CONFIG=Release \
    CXXFLAGS="-D JUCE_JACK=1 -D JUCE_ALSA=1 -D buildVST=1 -D buildStandalone=1"
}

package() {
  cd "${srcdir}/${_pkgname}"

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
