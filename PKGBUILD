# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

_pkgname=dexed
pkgname=$_pkgname-git
pkgver=0.9.6.r90.g9e01c0c
pkgrel=1
pkgdesc='A software synth closely modelled on the Yamaha DX7 (git version)'
arch=(x86_64)
url='https://asb2m10.github.io/dexed'
license=(GPL3)
groups=(pro-audio vst3-plugins clap-plugins)
depends=(
  alsa-lib
  hicolor-icon-theme
  freetype2
)
makedepends=(
  git
  cmake
  curl
  jack
  libx11
  libxrandr
  libxinerama
  libxcursor
  webkit2gtk
  libpng
  gendesk
)
optdepends=(
  'jack: backend for standalone'
  'clap-host: for CLAP plugins'
  'vst3-host: for VST3 plugins'
)
source=(
  "$_pkgname::git+https://github.com/asb2m10/dexed.git"
  'steinbergmedia-vst3sdk::git+https://github.com/steinbergmedia/vst3sdk.git'
  'surge-synthesizer-tuning-library::git+https://github.com/surge-synthesizer/tuning-library.git'
  'surge-synthesizer-surgesynthteam_tuningui::git+https://github.com/surge-synthesizer/surgesynthteam_tuningui.git'
  'ODDSound-MTS-ESP::git+https://github.com/ODDSound/MTS-ESP.git'
  'juce-framework-JUCE::git+https://github.com/juce-framework/JUCE.git'
  'free-audio-clap-juce-extensions::git+https://github.com/free-audio/clap-juce-extensions.git'
  # clap-juce-extensions
  'free-audio-clap::git+https://github.com/free-audio/clap.git'
  'free-audio-clap-helpers::git+https://github.com/free-audio/clap-helpers.git'
  # steinbergmedia-vst3sdk
  'steinbergmedia-vst3_base::git+https://github.com/steinbergmedia/vst3_base.git'
  'steinbergmedia-vst3_cmake::git+https://github.com/steinbergmedia/vst3_cmake.git'
  'steinbergmedia-vst3_doc::git+https://github.com/steinbergmedia/vst3_doc.git'
  'steinbergmedia-vst3_pluginterfaces::git+https://github.com/steinbergmedia/vst3_pluginterfaces.git'
  'steinbergmedia-vst3_public_sdk::git+https://github.com/steinbergmedia/vst3_public_sdk.git'
  'steinbergmedia-vstgui::git+https://github.com/steinbergmedia/vstgui.git'
)
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags --exclude 'NIGHTLY' | sed -e 's/^v//' -e 's/-/.r/' -e 's/-/./g'
}

prepare() {
  cd $_pkgname
  # prepare git submodule(s)
  git submodule init
  git config submodule.libs/vst3sdk.url "$srcdir/steinbergmedia-vst3sdk"
  git config submodule.libs/tuning-library.url "$srcdir/surge-synthesizer-tuning-library"
  git config submodule.libs/surgesynthteam_tuningui.url "$srcdir/surge-synthesizer-surgesynthteam_tuningui"
  git config submodule.libs/MTS-ESP.url "$srcdir/ODDSound-MTS-ESP"
  git config submodule.libs/JUCE.url "$srcdir/juce-framework-JUCE"
  git config submodule.libs/clap-juce-extensions.url "$srcdir/free-audio-clap-juce-extensions"
  git -c protocol.file.allow=always submodule update --init

  pushd libs/clap-juce-extensions
  git submodule init
  git config submodule.clap-libs/clap.url "$srcdir/free-audio-clap"
  git config submodule.clap-libs/clap-helpers.url "$srcdir/free-audio-clap-helpers"
  git -c protocol.file.allow=always submodule update --init
  popd

  pushd libs/vst3sdk
  git submodule init
  git config submodule.base.url "$srcdir/steinbergmedia-vst3_base"
  git config submodule.cmake.url "$srcdir/steinbergmedia-vst3_cmake"
  git config submodule.doc.url "$srcdir/steinbergmedia-vst3_doc"
  git config submodule.pluginterfaces.url "$srcdir/steinbergmedia-vst3_pluginterfaces"
  git config submodule.public.sdk.url "$srcdir/steinbergmedia-vst3_public_sdk"
  git config submodule.vstgui4.url "$srcdir/steinbergmedia-vstgui"
  git -c protocol.file.allow=always submodule update --init
  popd

  # any missing submodules? yes, probably
  git submodule update --init --recursive

  # generate desktop file
  gendesk -f -n \
    --exec Dexed \
    --name Dexed \
    --pkgname com.digitalsuburban.Dexed \
    --pkgdesc "$pkgdesc" \
    --icon "$_pkgname" \
    --genericname "Virtual FM synthesizer"
}

build() {
  cmake \
    -S $_pkgname \
    -B build \
    -DCMAKE_INSTALL_PREFIX='/usr'
  cmake --build build
}

package() {
  cd $_pkgname
  # desktop icon/file
  install -vDm644 Resources/ui/dexedIcon.png "$pkgdir"/usr/share/icons/hicolor/512x512/apps/dexed.png
  install -vDm644 com.digitalsuburban.Dexed.desktop -t "$pkgdir"/usr/share/applications

  # documentation
  install -vDm644 Documentation/* README.md -t "$pkgdir"/usr/share/doc/$pkgname

  cd ../build/Source/Dexed_artefacts

  # vst3
  install -Dm755 VST3/Dexed.vst3/Contents/$(uname -m)-linux/Dexed.so \
    -t "$pkgdir"/usr/lib/vst3/Dexed.vst3/Contents/$(uname -m)-linux

  # clap
  install -vDm755 CLAP/Dexed.clap -t "$pkgdir"/usr/lib/clap

  # standalone
  install -vDm755 Standalone/Dexed -t "$pkgdir"/usr/bin
  ln -sf Dexed "$pkgdir"/usr/bin/dexed
}

# vim:set ts=2 sw=2 et:
