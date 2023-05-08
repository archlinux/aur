# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_name=VSTPlugins-UhhyouPlugins
pkgname=uhhyou-plugins
pkgver=0.55.0
pkgrel=1
pkgdesc='A collection of synthesizer and effect VST3 plugins'
arch=(aarch64 x86_64)
url='https://ryukau.github.io/VSTPlugins/'
license=(GPL3)
groups=(pro-audio vst3-plugins)
depends=(xcb-util-cursor)
makedepends=(cairo cmake freetype2 gtkmm3 libx11 libxkbcommon-x11 pango vst3sdk xcb-util xcb-util-keysyms)
optdepends=('vst3-host: for running VST3 plugins')
_pocketfft_ref=53e9dd4
_vcl_ref=4c90584
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/ryukau/VSTPlugins/archive/refs/tags/UhhyouPlugins$pkgver.tar.gz"
  "pocketfft-$_pocketfft_ref.tar.gz::https://gitlab.mpcdf.mpg.de/mtr/pocketfft/-/archive/$_pocketfft_ref/pocketfft-$_pocketfft_ref.tar.gz"
  "vcl-$_vcl_ref.tar.gz::https://github.com/vectorclass/version2/archive/$_vcl_ref.tar.gz"
)
sha256sums=('319113420cd4dc0c6bced49646525c28c15402a98a835b631b8bb59f4ec09a1a'
            '0f2b09e14b1497c9a1283c5b64a6682fd43daa6ba7ca17eb3dbcc9b0ec46204f'
            'd2a36ccedf4585b33fdba6cb38000aaa022c5b5306efeff2ad58cca52999c827')

prepare() {
  cd $_name$pkgver
  # link submodules
  rm -r lib/pocketfft && ln -s "$srcdir"/pocketfft-$_pocketfft_ref lib/pocketfft
  rm -r lib/vcl && ln -s "$srcdir"/version2-$_vcl_ref* lib/vcl
  # copy and patch vst3sdk
  cp -r /usr/src/vst3sdk ../ || cp -r /usr/share/vst3sdk ../
  cp ci/linux_patch/cairocontext.cpp ../vst3sdk/vstgui4/vstgui/lib/platform/linux/cairocontext.cpp
}

build() {
  cmake -B build -S vst3sdk \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSMTG_MYPLUGINS_SRC_PATH=./$_name$pkgver \
    -DSMTG_ADD_VST3_HOSTING_SAMPLES=Off \
    -DSMTG_ADD_VST3_PLUGINS_SAMPLES=Off \
    -DSMTG_CREATE_PLUGIN_LINK=Off \
    -DSMTG_RUN_VST_VALIDATOR=Off \
    -Wno-dev
  cmake --build build
}

check() {
  for _plugin in build/VST3/Release/*.vst3; do
    # many plugins seem to use a lot of memory during validation so let's only test basics
    build/bin/Release/validator -suite "General Tests" $_plugin
  done
}

package() {
  depends+=(libxkbcommon.so libxkbcommon-x11.so libpangocairo-1.0.so libpangoft2-1.0.so
    libpango-1.0.so libgobject-2.0.so ttf-croscore)
  cd "$srcdir"/build/VST3/Release
  for plugin in *.vst3; do
    # install executable
    install -vDm755 $plugin/Contents/$CARCH-linux/*.so -t \
      "$pkgdir"/usr/lib/vst3/$plugin/Contents/$CARCH-linux
    # install resources
    install -vDm644 $plugin/Contents/moduleinfo.json -t "$pkgdir"/usr/lib/vst3/$plugin/Contents
    [ -f $plugin/Contents/Resources/Snapshots/*.png ] &&
      install -vDm644 $plugin/Contents/Resources/Snapshots/*.png -t \
        "$pkgdir"/usr/lib/vst3/$plugin/Contents/Resources/Snapshots
  done
  # install docs
  cd "$srcdir"/$_name$pkgver/docs
  find . -type f \( -name \*.html -o -name \*.svg -o -name \*.png \) -exec \
    install -vDm644 {} -T "$pkgdir"/usr/share/doc/$pkgname/{} \;
}
