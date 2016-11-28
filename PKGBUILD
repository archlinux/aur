# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=dexed-vst
pkgname="${_pkgname}-git"
pkgver=0.9.2.r153.47b947d
pkgrel=1
pkgdesc="A VST plugin synth closely modelled on the Yamaha DX7"
arch=('i686' 'x86_64')
url="http://asb2m10.github.io/dexed/"
license=("GPL3")
groups=('vst-plugins')
depends=('alsa-lib' 'freetype2' 'libxext' 'gcc-libs-multilib')
makedepends=('git' 'steinberg-vst36')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/asb2m10/dexed.git")
md5sums=('SKIP')
changelog=ChangeLog


pkgver() {
  cd "${srcdir}/${_pkgname}"

  local ver=$(cpp -dM Source/Dexed.h | grep '^#define DEXED_ID' | cut -d '"' -f 2)
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_pkgname}"
  msg2 "Fixing VST3 SDK include paths in Makefile..."
  sed -i -e "s|-I ~/src/vstsdk2.4|-I /usr/include/vst36|" Builds/Linux/Makefile

  msg2 "Fixing VST3 SDK include paths in JUCE sources..."
  for file in \
      JuceLibraryCode/modules/juce_audio_plugin_client/VST/juce_VST_Wrapper.cpp \
      JuceLibraryCode/modules/juce_audio_processors/format_types/juce_VST3Headers.h; do
    sed -i -e 's|public.sdk/source/vst2.x|vst36|g' "$file"
  done
}

build() {
  cd "${srcdir}/${_pkgname}/Builds/Linux"

  CXXFLAGS="${CXXFLAGS} -DHAVE_LROUND"
  make CONFIG=Release
}

package() {
  cd "${srcdir}/${_pkgname}/Builds/Linux"

  install -Dm755 build/Dexed.so "${pkgdir}/usr/lib/vst/Dexed.so"
}

# vim:set ts=2 sw=2 et:
