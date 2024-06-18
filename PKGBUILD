# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: John N Bilbery (beelzebud) <beelzebud@gmail.com>

_name=ChowMatrix
_pkgname=${_name,,}
pkgname=$_pkgname-git
pkgver=1.3.0.r7.ge78920a
pkgrel=1
pkgdesc='A multi-format delay effect plugin and standalone app providing an expandable tree of delay lines, each with individual controls'
arch=(x86_64)
url="https://github.com/Chowdhury-DSP/$_name"
license=(BSD-3-Clause)
depends=(alsa-lib freetype2 gcc-libs glibc hicolor-icon-theme libglvnd)
makedepends=(cmake curl git webkit2gtk)
provides=($_pkgname)
conflicts=($_pkgname $_pkgname.lv2-git)
groups=(clap-plugins lv2-plugins pro-audio vst3-plugins)
optdepends=(
  'lv2-host: for loading the CLAP format plugin'
  'jack: for running the standalone app under JACK'
  'lv2-host: for loading the LV2 format plugin'
  'vst3-host: for loading the VST3 format plugin'
)
source=(
  "$_pkgname::git+$url.git#branch=develop"
  'JUCE::git+https://github.com/lv2-porting-project/JUCE.git'
  'foleys_gui_magic::git+https://github.com/Chowdhury-DSP/foleys_gui_magic.git'
  'chowdsp_utils::git+https://github.com/Chowdhury-DSP/chowdsp_utils.git'
  'clap-juce-extensions::git+https://github.com/free-audio/clap-juce-extensions.git'
  'clap::git+https://github.com/free-audio/clap.git'
  'clap-helpers::git+https://github.com/free-audio/clap-helpers.git'
  "$_pkgname.desktop"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'b6619b8a1c3fb5f8983330911cd9a0feadb12e1d0f85c6813c4714e375fbaf79')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  git submodule init
  git submodule set-url modules/JUCE "$srcdir"/JUCE
  git submodule set-url modules/foleys_gui_magic "$srcdir"/foleys_gui_magic
  git submodule set-url modules/chowdsp_utils "$srcdir"/chowdsp_utils
  git submodule set-url modules/clap-juce-extensions "$srcdir"/clap-juce-extensions
  git -c protocol.file.allow=always submodule update --init

  cd modules/clap-juce-extensions
  git submodule init
  git submodule set-url clap-libs/clap "$srcdir"/clap
  git submodule set-url clap-libs/clap-helpers "$srcdir"/clap-helpers
  git -c protocol.file.allow=always submodule update --init
}

build() {
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -Wno-dev \
    -B $pkgname-build \
    -S $_pkgname
  cmake --build $pkgname-build
}

package() {
  depends+=(libasound.so libfreetype.so libGL.so)
  # Standalone
  install -Dm755 $pkgname-build/${_name}_artefacts/Release/Standalone/$_name \
    -t "$pkgdir"/usr/bin
  # LV2 bundle
  install -Dm 644 $pkgname-build/${_name}_artefacts/Release/LV2/$_name.lv2/*.ttl \
    -t "$pkgdir"/usr/lib/lv2/$_name.lv2
  install -Dm 755 $pkgname-build/${_name}_artefacts/Release/LV2/$_name.lv2/*.so \
    -t "$pkgdir"/usr/lib/lv2/$_name.lv2
  # VST3 bundle
  install -Dm 755 \
    $pkgname-build/${_name}_artefacts/Release/VST3/$_name.vst3/Contents/$CARCH-linux/*.so \
    -t "$pkgdir"/usr/lib/vst3/$_name.vst3/Contents/$CARCH-linux
  # CLAP plugin
  install -Dm 755 $pkgname-build/${_name}_artefacts/Release/CLAP/$_name.clap \
    -t "$pkgdir"/usr/lib/clap/

  cd $_pkgname
  # Icon
  install -Dm 644 res/logo.svg \
    "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg
  # Desktop file
  install -Dm 644 "$srcdir"/$_pkgname.desktop -t "$pkgdir"/usr/share/applications
  # License
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  # Documentation
  install -Dm 644 manual/*.pdf -t "$pkgdir"/usr/share/doc/$pkgname
}
