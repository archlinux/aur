# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=dexed
_juce_version=5.4.7
pkgname="${_pkgname}-git"
pkgver=0.9.4hf1.r57.g2ebdf1e
pkgrel=1
pkgdesc="A software synth closely modelled on the Yamaha DX7 (git version)"
arch=('i686' 'x86_64')
url="http://asb2m10.github.io/dexed/"
license=("GPL3")
groups=('pro-audio' 'vst-plugins')
depends=('alsa-lib' 'curl' 'hicolor-icon-theme' 'freetype2' 'libxinerama')
makedepends=('git' 'steinberg-vst36')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-vst-git")
source=("${_pkgname}::git+https://github.com/asb2m10/dexed.git"
        "https://d30pueezughrda.cloudfront.net/juce/juce-${_juce_version}-linux.zip"
        'git+https://github.com/steinbergmedia/vst3sdk.git'
        'git+https://github.com/surge-synthesizer/tuning-library.git'
        'git+https://github.com/surge-synthesizer/surgesynthteam_tuningui.git'
        'dexed.desktop')
sha256sums=('SKIP'
            '6f259573553a26951e896ed8d0737f78c3db7668894adc699a1e517aafe76e39'
            'SKIP'
            'SKIP'
            'SKIP'
            '092e8b4638f750c2d31e6d9592dee07a0f6b6f6f19e9bb07a3986da27496fe9b')
changelog=ChangeLog


pkgver() {
  cd "${srcdir}/${_pkgname}"

  #local ver=$(cpp -dM Source/Dexed.h | grep '^#define DEXED_ID' | cut -d '"' -f 2)
  #echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  echo $(git describe --tags | sed -E -e 's/-([0-9]+)-/-r\1-/' -e 's/^v//' -e 's/-/./g')
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  git submodule init
  git config submodule.vst3sdk.url "${srcdir}/vst3sdk"
  git config submodule.tuning-library.url "${srcdir}/tuning-library"
  git config submodule.surgesynthteam_tuningui.url "${srcdir}/surgesynthteam_tuningui"
  git submodule update

  mkdir -p assets
  ln -sf "${srcdir}/JUCE" assets
  VST2SDK_DIR="/usr/include/vst36" ./scripts/projuce-lin-vst2.sh
}

build() {
  cd "${srcdir}/${_pkgname}/Builds/Linux"
  make CONFIG=Release
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
