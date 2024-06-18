# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=CloudReverb
pkgname=${_name,,}
_plugin_uri="http://github.com/xunil-cloud/$_name"
pkgver=0.2
pkgrel=1
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
_juce_commit='b08520c2de1771af3dfcbfbc0e0b6b0b5eb083b0'
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/xunil-cloud/$_name/archive/refs/tags/v$pkgver.tar.gz"
  "JUCE-$_juce_commit.tar.gz::https://github.com/juce-framework/JUCE/archive/$_juce_commit.tar.gz"
)

sha256sums=('e7cfa6d8070e1f60a2bf0499994b1b55e3e8620591411f2dd37a7ae7175db7ae'
            '4b80c74d6eac9a4003f40b11a63f4bb73d25b934613cba59a0e4d7f9ffc7ea40')


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
