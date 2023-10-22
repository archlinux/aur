# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_name=VSTPlugins-UhhyouPlugins
pkgname=uhhyou-plugins
pkgver=0.58.0
pkgrel=2
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
sha256sums=('7d73da5bacffc87060edc57012253287a4fca2c1c283466869acd6e5e944624c'
            '0f2b09e14b1497c9a1283c5b64a6682fd43daa6ba7ca17eb3dbcc9b0ec46204f'
            'd2a36ccedf4585b33fdba6cb38000aaa022c5b5306efeff2ad58cca52999c827')

prepare() {
  cd $_name$pkgver
  # link submodules
  rm -r lib/pocketfft && ln -s "$srcdir"/pocketfft-$_pocketfft_ref lib/pocketfft
  rm -r lib/vcl && ln -s "$srcdir"/version2-$_vcl_ref* lib/vcl
  # copy and patch vst3sdk
  rm -rf lib/vst3sdk
  if [[ -d /usr/src/vst3sdk ]]; then
    cp -r /usr/src/vst3sdk lib
  else
    cp -r /usr/share/vst3sdk lib
  fi
  cp -f ci/linux_patch/cairocontext.cpp \
    lib/vst3sdk/vstgui4/vstgui/lib/platform/linux/cairocontext.cpp
}

build() {
  cmake -B $pkgname-build -S $_name$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSMTG_RUN_VST_VALIDATOR=Off \
    -DSMTG_CREATE_PLUGIN_LINK=Off \
    -Wno-dev
  cmake --build $pkgname-build
}

check() {
  for _plugin in $pkgname-build/VST3/Release/*.vst3; do
    # many plugins seem to use a lot of memory during validation so let's only test basics
    $pkgname-build/bin/Release/validator -suite "General Tests" $_plugin
  done
}

package() {
  depends+=(libxkbcommon.so libxkbcommon-x11.so libpangocairo-1.0.so libpangoft2-1.0.so
    libpango-1.0.so libgobject-2.0.so ttf-croscore)
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
  cd "$srcdir"/$_name$pkgver/docs
  find . -type f \( -name \*.html -o -name \*.svg -o -name \*.png \) -exec \
    install -vDm644 {} -T "$pkgdir"/usr/share/doc/$pkgname/{} \;
}
