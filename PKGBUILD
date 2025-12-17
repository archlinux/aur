# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>
# Contributor: Chris Arndt <aur -at- chrisarndt -dot- de>

_name=VSTPlugins-UhhyouPlugins
pkgname=uhhyou-plugins
pkgver=0.68.0
pkgrel=1
pkgdesc='A collection of synthesizer and effect VST3 plugins'
arch=(aarch64 x86_64)
url='https://ryukau.github.io/VSTPlugins/'
license=(GPL-3.0-only)
groups=(pro-audio vst3-plugins)
depends=(cairo gcc-libs glibc libxcb xcb-util xcb-util-cursor)
makedepends=(cmake fontconfig git gtkmm3 libx11 libxkbcommon-x11 pango vst3sdk
             xcb-util-keysyms)
optdepends=('vst3-host: for running VST3 plugins')
_pocketfft_ref=0fa0ef5
_vcl_ref=4c90584
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/ryukau/VSTPlugins/archive/refs/tags/UhhyouPlugins$pkgver.tar.gz"
  "pocketfft-$_pocketfft_ref.tar.gz::https://gitlab.mpcdf.mpg.de/mtr/pocketfft/-/archive/$_pocketfft_ref/pocketfft-$_pocketfft_ref.tar.gz"
  "vcl-$_vcl_ref.tar.gz::https://github.com/vectorclass/version2/archive/$_vcl_ref.tar.gz"
)
sha256sums=('0c94a5a45b49338f23ff95f0565bb73c5274d26f60a550bbfdd071b1390381bb'
            '03f0a020d7815e13acaa9419f94b13977df1902724fb2227bcf800de9b8e5200'
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
  cd lib/vst3sdk/vstgui4
  git apply ../../../ci/linux_patch/cairographicscontext.patch
}

build() {
  cmake -B $pkgname-build -S $_name$pkgver \
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
  cd "$srcdir"/$_name$pkgver/docs
  find . -type f \( -name \*.html -o -name \*.svg -o -name \*.png \) -exec \
    install -vDm644 {} -T "$pkgdir"/usr/share/doc/$pkgname/{} \;
}
