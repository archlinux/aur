# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=CloudReverb
pkgname=${_name,,}
_plugin_uri="http://github.com/xunil-cloud/$_name"
pkgver=0.4.1
pkgrel=2
pkgdesc='An algorithmic reverb plugin and app for creating huge, endless spaces and modulated echoes'
arch=(x86_64 aarch64)
url='https://github.com/xunil-cloud/CloudReverb'
license=(MIT)
depends=(alsa-lib freetype2 glibc gcc-libs)
makedepends=(cmake webkit2gtk)
checkdepends=(lv2lint)
optdepends=(
  'jack: for running the standalone version with JACK'
  'lv2-host: for loading the LV2 plugin'
  'vst3-host: for loading the VST3 plugin'
)
groups=(lv2-plugins pro-audio vst3-plugins)
_juce_commit='d6181bde38d858c283c3b7bf699ce6340c050b5d'
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/xunil-cloud/$_name/archive/refs/tags/v$pkgver.tar.gz"
  "JUCE-$_juce_commit.tar.gz::https://github.com/juce-framework/JUCE/archive/$_juce_commit.tar.gz"
)

sha256sums=('5a018f8e414999e65a98c12b5817744eb21d1f6f11c05681df97a3568fa5fc2a'
            'ab02a58f4cc0e42102a22e863e8bbe3aaa1c3e72899fd567154a5a1aa7898219')

prepare() {
  cd $_name-$pkgver
  test -d JUCE && rmdir JUCE
  ln -s "$srcdir"/JUCE-$_juce_commit JUCE
}

build() {
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -Wno-dev \
    -B $_name-$pkgver-build \
    -S $_name-$pkgver
  cmake --build $_name-$pkgver-build
}

check() {
  cd $_name-$pkgver-build
  lv2lint -Mpack -q \
    -s '_Z*' \
    -t 'Parameter Range' \
    -I "${_name}_artefacts/Release/LV2/$_name.lv2/" \
    "$_plugin_uri"
}

package() {
  depends+=(libasound.so libfreetype.so)
  # Standalone
  install -vDm 755 $_name-$pkgver-build/${_name}_artefacts/Release/Standalone/$_name \
    -t "$pkgdir"/usr/bin
  # LV2 plugin bundle
  install -vDm 755 $_name-$pkgver-build/${_name}_artefacts/Release/LV2/$_name.lv2/*.so \
    -t "$pkgdir"/usr/lib/lv2/$_name.lv2
  install -vDm 644  $_name-$pkgver-build/${_name}_artefacts/Release/LV2/$_name.lv2/*.ttl \
    -t "$pkgdir"/usr/lib/lv2/$_name.lv2
  # VST3 plugin bundle
  install -vDm 755  $_name-$pkgver-build/${_name}_artefacts/Release/VST3/$_name.vst3/Contents/$CARCH-linux/$_name.so \
    -t "$pkgdir"/usr/lib/vst3/$_name.vst3/Contents/$CARCH-linux
  cd $_name-$pkgver
  # License
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  # Docs
  install -vDm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -vDm 644 screenshots/*.png -t "$pkgdir"/usr/share/doc/$pkgname/screenshots
}
