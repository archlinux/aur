# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=helm
pkgname="${_pkgname}-git"
pkgver=0.9.0.r1876.927d2ed2
pkgrel=1
pkgdesc="a cross-platform, polyphonic synthesizer LV2 and VST plugin"
arch=('i686' 'x86_64')
url="http://tytel.org/helm/"
license=('GPL')
groups=('lv2-plugins' 'vst-plugins')
depends=('alsa-lib' 'freetype2' 'mesa' 'lv2')
makedepends=('git' 'steinberg-vst36')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/mtytel/helm.git")
md5sums=('SKIP')
changelog=ChangeLog


prepare() {
  cd "$srcdir/${_pkgname}"

  msg2 "Fixing Makefiles..."
  sed -i -e "s|-I ~/srcs/VST3\\\\ SDK||" \
    builds/linux/VST/Makefile

  for build in standalone/builds/linux builds/linux/VST builds/linux/LV2; do
    sed -i -e 's|JUCE_INCLUDE_PNGLIB_CODE=0|JUCE_INCLUDE_PNGLIB_CODE=1|g' \
      "$build/Makefile"
  done

  msg2 "Fixing VST3 SDK include paths in JUCE sources..."
  for file in \
      JUCE/extras/Projucer/Source/Utility/jucer_StoredSettings.cpp \
      JUCE/modules/juce_audio_plugin_client/VST/juce_VST_Wrapper.cpp \
      JUCE/modules/juce_audio_processors/format_types/juce_VST3Headers.h; do
    sed -i -e 's|public.sdk/source/vst2.x|vst36|g' "$file"
  done
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  ver="$(grep 'JUCERPROJECT.*version' helm.jucer | sed 's/.*version=\"\(.*\)\".*/\1/')"
  echo "${ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}


build() {
  cd "${srcdir}/${_pkgname}"

  CXXFLAGS="${CXXFLAGS} -DHAVE_LROUND -Wno-error"
  make PREFIX="/usr" all vst
}

package() {
  cd "${srcdir}/${_pkgname}"

  CXXFLAGS="${CXXFLAGS} -DHAVE_LROUND -Wno-error"
  make DESTDIR="$pkgdir" install
  install -D builds/linux/VST/build/helm.so "$pkgdir/usr/lib/vst/helm.so"
}
