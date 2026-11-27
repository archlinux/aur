# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

_pkgname=dexed
pkgname=$_pkgname-git
pkgver=1.1.1.r0.gc314161
pkgrel=1
pkgdesc='A software synth closely modelled on the Yamaha DX7 (git version)'
arch=(x86_64)
url='https://asb2m10.github.io/dexed'
license=(GPL-3.0-only)
groups=(pro-audio vst3-plugins clap-plugins)
depends=(
  glibc
  hicolor-icon-theme
  libgcc
  libstdc++
)
makedepends=(
  alsa-lib
  cmake
  curl
  fontconfig
  freetype2
  gendesk
  git
  jack
  libpng
  libx11
  libxcursor
  libxinerama
  libxrandr
)
optdepends=(
  'jack: backend for standalone'
  'clap-host: for CLAP plugins'
  'vst3-host: for VST3 plugins'
)
provides=($_pkgname)
conflicts=($_pkgname $_pkgname-clap $_pkgname-docs $_pkgname-standalone $_pkgname-vst3)
source=(
  "$_pkgname::git+https://github.com/asb2m10/dexed.git"
  'surge-synthesizer-tuning-library::git+https://github.com/surge-synthesizer/tuning-library.git'
  'asb2m10-surgesynthteam_tuningui::git+https://github.com/asb2m10/surgesynthteam_tuningui'
  'ODDSound-MTS-ESP::git+https://github.com/ODDSound/MTS-ESP.git'
  'juce-framework-JUCE::git+https://github.com/juce-framework/JUCE.git'
  'free-audio-clap-juce-extensions::git+https://github.com/free-audio/clap-juce-extensions.git'
  # clap-juce-extensions
  'free-audio-clap::git+https://github.com/free-audio/clap.git'
  'free-audio-clap-helpers::git+https://github.com/free-audio/clap-helpers.git'
)
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags --long --exclude 'Nightly' --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  # prepare git submodule(s)
  git submodule init
  git submodule set-url libs/tuning-library "$srcdir/surge-synthesizer-tuning-library"
  git submodule set-url libs/surgesynthteam_tuningui "$srcdir/asb2m10-surgesynthteam_tuningui"
  git submodule set-url libs/MTS-ESP "$srcdir/ODDSound-MTS-ESP"
  git submodule set-url libs/JUCE "$srcdir/juce-framework-JUCE"
  git submodule set-url libs/clap-juce-extensions "$srcdir/free-audio-clap-juce-extensions"
  git -c protocol.file.allow=always submodule update --init

  pushd libs/clap-juce-extensions
  git submodule init
  git config submodule.clap-libs/clap.url "$srcdir/free-audio-clap"
  git config submodule.clap-libs/clap-helpers.url "$srcdir/free-audio-clap-helpers"
  git -c protocol.file.allow=always submodule update --init
  popd

  # generate desktop file
  gendesk -f -n \
    --exec Dexed \
    --name Dexed \
    --pkgname com.digitalsuburban.Dexed \
    --pkgdesc "$pkgdesc" \
    --icon "$_pkgname" \
    --genericname "Virtual FM synthesizer"

  # Disable copying of CLAP/VST3 plugins to ~/.{clap,vst3}
  sed -e "s/COPY_PLUGIN_AFTER_BUILD TRUE/COPY_PLUGIN_AFTER_BUILD FALSE/" \
    -i source/CMakeLists.txt
}

build() {
  cmake \
    -S $_pkgname \
    -B $_pkgname-build \
    -W no-author \
    -D CMAKE_INSTALL_PREFIX='/usr' \
    -D BUILD_ID=$pkgver
  cmake --build $_pkgname-build
}

package() {
  depends+=(libasound.so libfontconfig.so libfreetype.so)
  cd $_pkgname
  # desktop icon/file
  install -vDm644 assets/ui/dexedIcon.png "$pkgdir"/usr/share/icons/hicolor/512x512/apps/dexed.png
  install -vDm644 com.digitalsuburban.Dexed.desktop -t "$pkgdir"/usr/share/applications

  # documentation
  install -vDm644 doc/* README.md -t "$pkgdir"/usr/share/doc/$pkgname

  cd ../$_pkgname-build/source/Dexed_artefacts

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
