# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>
# Contributor: Chris Arndt <aur -at- chrisarndt -dot- de>

_name=VSTPlugins
pkgname=uhhyou-plugins
pkgver=0.71.0
pkgrel=1
pkgdesc='A collection of synthesizer and effect VST3 plugins'
arch=(aarch64 x86_64)
url='https://ryukau.github.io/VSTPlugins/'
license=(GPL-3.0-only)
groups=(pro-audio vst3-plugins)
depends=(cairo glibc libgcc libstdc++ libxcb xcb-util xcb-util-cursor)
makedepends=(cmake fontconfig git gtkmm3 libx11 libxkbcommon-x11 pango xcb-util-keysyms)
optdepends=('vst3-host: for running VST3 plugins')
source=(
  "git+https://github.com/ryukau/VSTPlugins#tag=UhhyouPlugins$pkgver"
  'git+https://gitlab.mpcdf.mpg.de/mtr/pocketfft.git/'
  'git+https://github.com/ryukau/vcl_version2#branch=sse2neon_hack'
  'git+https://github.com/steinbergmedia/vst3sdk'
  'git+https://github.com/steinbergmedia/vst3_base'
  'git+https://github.com/steinbergmedia/vst3_cmake'
  'git+https://github.com/steinbergmedia/vst3_pluginterfaces'
  'git+https://github.com/steinbergmedia/vst3_public_sdk'
  'git+https://github.com/steinbergmedia/vstgui'
)
sha256sums=('3d37db90de7d420279709cd6b8dd1f2f68fac9287d1d00bcaa9a0a46511a3d73'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd $_name
  # submodules
  git submodule init
  git config submodule.lib/pocketfft.url "$srcdir"/pocketfft
  git config submodule.lib/vcl.url "$srcdir"/vcl_version2
  git config submodule.lib/vst3sdk.url "$srcdir"/vst3sdk
  git -c protocol.file.allow=always submodule update
  pushd lib/vst3sdk
  git submodule init base cmake pluginterfaces public.sdk vstgui4
  git config submodule.base.url "$srcdir"/vst3_base
  git config submodule.cmake.url "$srcdir"/vst3_cmake
  git config submodule.pluginterfaces.url "$srcdir"/vst3_pluginterfaces
  git config submodule.public.sdk.url "$srcdir"/vst3_public_sdk
  git config submodule.vstgui4.url "$srcdir"/vstgui
  git -c protocol.file.allow=always submodule update
  popd
}

build() {
  cmake -B $pkgname-build -S $_name \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSMTG_RUN_VST_VALIDATOR=Off \
    -DSMTG_CREATE_PLUGIN_LINK=Off \
    -Wno-dev
  cmake --build $pkgname-build -j$(nproc --ignore=1)
}

check() {
  for _plugin in $pkgname-build/VST3/Release/*.vst3; do
    # many plugins seem to use a lot of memory during validation so let's only test basics
    $pkgname-build/bin/Release/validator -suite "General Tests" $_plugin
  done
}

package() {
  depends+=(libfontconfig.so libgobject-2.0.so libpango-1.0.so libpangocairo-1.0.so
    libpangoft2-1.0.so libxkbcommon.so libxkbcommon-x11.so ttf-croscore)
  cd  $pkgname-build/VST3/Release
  for plugin in *.vst3; do
    # install executable
    install -vDm755 $plugin/Contents/$CARCH-linux/*.so -t \
      "$pkgdir"/usr/lib/vst3/$plugin/Contents/$CARCH-linux
    # install resources
    if [[ -f $plugin/Contents/moduleinfo.json ]]; then
      install -vDm644 $plugin/Contents/moduleinfo.json \
        -t "$pkgdir"/usr/lib/vst3/$plugin/Contents/Resources
    else
      install -vDm644 $plugin/Contents/Resources/moduleinfo.json \
        -t "$pkgdir"/usr/lib/vst3/$plugin/Contents/Resources
    fi
    [ -f $plugin/Contents/Resources/Snapshots/*.png ] &&
      install -vDm644 $plugin/Contents/Resources/Snapshots/*.png -t \
        "$pkgdir"/usr/lib/vst3/$plugin/Contents/Resources/Snapshots
  done
  # install docs
  cd "$srcdir"/$_name/docs
  find . -type f \( -name \*.html -o -name \*.svg -o -name \*.png \) -exec \
    install -vDm644 {} -T "$pkgdir"/usr/share/doc/$pkgname/{} \;
}
