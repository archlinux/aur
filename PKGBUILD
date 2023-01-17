# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_plugin_name=RoomReverb
pkgname="elephantdsp-${_plugin_name,,}"
_plugin_uri="https://www.ElephantDSP.com/plugins/Room_Reverb"
pkgver=1.0.0
pkgrel=1
pkgdesc='A mono and stereo algorithmic room reverb audio effect plugin'
arch=(x86_64 aarch64)
url='https://www.elephantdsp.com/products/room-reverb/'
license=(GPL3)
depends=(glibc gcc-libs zlib)
makedepends=(alsa-lib cmake flac freetype2 'juce>=7' libvorbis libx11 libxcursor libxinerama libxrandr)
checkdepends=(lv2lint lv2)
optdepends=(
  'clap-host: for CLAP plugin'
  'lv2-host: for LV2 plugin'
  'vst3-host: for VST3 plugin'
)
groups=(clap-plugins lv2-plugins pro-audio vst3-plugins)
_clap_commit='af1e05ce6487151c6b36003fdb47566dbb50194e'
_clap_ext_commit='cf93cac7ca6a1c0c548c2bda85d49e9bfdb979e1'
_clap_helpers_commit='f0b6802305ef628c18a597878e304f9f72aaac99'
source=("$pkgname-$pkgver.tar.gz::https://github.com/cvde/RoomReverb/archive/refs/tags/v$pkgver.tar.gz"
        "clap-juce-extensions-$_clap_ext_commit.tar.gz::https://github.com/free-audio/clap-juce-extensions/archive/$_clap_ext_commit.tar.gz"
        "clap-$_clap_commit.tar.gz::https://github.com/free-audio/clap/archive/$_clap_commit.tar.gz"
        "clap-helpers-$_clap_helpers_commit.tar.gz::https://github.com/free-audio/clap-helpers/archive/$_clap_helpers_commit.tar.gz"
        "roomreverb-devendor_juce.patch")
sha256sums=('d49ddec65c793abb7092c43344e25aa17d1a1370ac5427c6a79bae99e7626836'
            '7d411dc16f8cfdf5dc7e664b90890058521c51e745212c84dffcb0f9cc2bd5ed'
            '3092d3dab522229cd55f50a239f9e5aab2631bc561f0ed4b069eacadfb6a65bb'
            '94ed48d50a24934b2f018507fd0111d31246d378943edb4cc3ca22bafab0a6af'
            'a7478a0113128e55fdc14e4b861f95bd65c1c64cc20c0d544bce07f90c0a6ede')

prepare() {
  cd $_plugin_name-$pkgver

  # fix for cmake trying to install into ~/.clap, ~/.lv2, and ~/.vst3 during build
  sed -i -e '/COPY_PLUGIN_AFTER_BUILD/d' CMakeLists.txt

  patch -p1 -N -r - -i "$srcdir"/roomreverb-devendor_juce.patch

  # link external libs
  cd Libs
  rm -rf clap-juce-extensions &&
    ln -s "$srcdir"/clap-juce-extensions-$_clap_ext_commit clap-juce-extensions
  cd clap-juce-extensions/clap-libs
  rm -rf clap &&
    ln -s "$srcdir"/clap-$_clap_commit clap
  rm -rf clap-helpers &&
    ln -s "$srcdir"/clap-helpers-$_clap_helpers_commit clap-helpers
}

build() {
  cmake -S $_plugin_name-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -Wno-dev \
    -B $_plugin_name-$pkgver-build
  cmake --build $_plugin_name-$pkgver-build
}

check() {
  cd $_plugin_name-$pkgver-build
  echo lv2lint -Mpack -q \
    -I "${_plugin_name}_artefacts/Release/LV2/$_plugin_name.lv2/" \
    "$_plugin_uri"
}

package() {
  depends+=(libfreetype.so)
  cd $_plugin_name-$pkgver-build
  # LV2 plugin bundle
  install -Dm755 ${_plugin_name}_artefacts/Release/LV2/$_plugin_name.lv2/*.so \
    -t "$pkgdir"/usr/lib/lv2/$_plugin_name.lv2
  install -Dm644 ${_plugin_name}_artefacts/Release/LV2/$_plugin_name.lv2/*.ttl \
    -t "$pkgdir"/usr/lib/lv2/$_plugin_name.lv2
  # VST3 plugin bundle
  install -Dm755 ${_plugin_name}_artefacts/Release/VST3/$_plugin_name.vst3/Contents/$CARCH-linux/$_plugin_name.so \
    -t "$pkgdir"/usr/lib/vst3/$_plugin_name.vst3/Contents/$CARCH-linux
  # CLAP plugin binary
  install -Dm755 ${_plugin_name}_artefacts/Release/CLAP/$_plugin_name.clap \
    -t "$pkgdir"/usr/lib/clap
}
