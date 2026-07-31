# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: LekKit <github.com/LekKit>
# Contributor: Christopher Arndt <aur -at -chrisarndt -dot- de>

pkgname=neural-amp-modeler-lv2
pkgver=0.2.3
pkgrel=1
pkgdesc='Neural Amp Modeler (NAM) LV2 plugin'
arch=(aarch64 x86_64)
url='https://github.com/mikeoliphant/neural-amp-modeler-lv2'
license=(GPL-3.0-only BSD-3-Clause MIT)
groups=(lv2-plugins pro-audio)
depends=(glibc)
makedepends=(clang cmake lv2 ninja)
checkdepends=(lv2lint)
optdepends=(
  'lv2-host: for loading the LV2 plugin'
)

_plugin_uri="http://github.com/mikeoliphant/neural-amp-modeler-lv2"
declare -g -A _modules=(
  ["NeuralAudio"]="b1137e1db2d43670e7dcf6345ade7808613cac20"
  ["NeuralAmpModelerCore"]="4c0ee78b71abd5eb20aec58562e7540f43caac3b"
  ["RTNeural"]="5909c44909cd6100367f62cd04b348de85d57dbf"
  ["math_approx"]="f6d55e70f0c5e888d3a0c4e252b02b530210c78a"
  ["xsimd"]="a00c81f7b9e808a42aedcf7da2fbb1f9a636da34"
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/mikeoliphant/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
        "NeuralAudio-${_modules[NeuralAudio]}.tar.gz::https://github.com/mikeoliphant/NeuralAudio/archive/${_modules[NeuralAudio]}.tar.gz"
        "NeuralAmpModelerCore-${_modules[NeuralAmpModelerCore]}.tar.gz::https://github.com/mikeoliphant/NeuralAmpModelerCore/archive/${_modules[NeuralAmpModelerCore]}.tar.gz"
        "RTNeural-${_modules[RTNeural]}.tar.gz::https://github.com/mikeoliphant/RTNeural/archive/${_modules[RTNeural]}.tar.gz"
        "math_approx-${_modules[math_approx]}.tar.gz::https://github.com/Chowdhury-DSP/math_approx/archive/${_modules[math_approx]}.tar.gz"
        "xsimd-${_modules[xsimd]}.tar.gz::https://github.com/xtensor-stack/xsimd/archive/${_modules[xsimd]}.tar.gz"
)
sha256sums=('31fda69179c31afe8a909437cd447db40997b9bd1b372999475826d8b455bc98'
            '70f9a5278c7803ede3389f918a38b835e13c9262f5c1ba7481ea43029005e25e'
            '4e9998ae116c3805089165d7da8c5f79ee004771731fa44e47dde30f96eab276'
            '76f7f6160e681acbb4dd1fff4cfc23a3b61f51f0df2f8b3b5449c010628e4013'
            '3c638ff556d7874c01ccc327a84b9b09ed2334846341195e3f0d26803418a432'
            'f1c485107ae0b29069a88bf9619d2d93eaed8321ae03a83d7fc437da85d5b9fd')

prepare() {
  local mod
  cd $pkgname-$pkgver/deps
  test -d NeuralAudio && rmdir NeuralAudio
  test -f NeuralAudio || ln -s "$srcdir"/NeuralAudio-${_modules[NeuralAudio]} NeuralAudio
  cd NeuralAudio/deps
  for mod in NeuralAmpModelerCore RTNeural math_approx; do
    test -d $mod && rmdir $mod
    test -f $mod || ln -s "$srcdir"/$mod-${_modules[$mod]} $mod
  done
  mod=xsimd
  cd RTNeural/modules
  test -d $mod && rmdir $mod
  test -f $mod || ln -s "$srcdir"/$mod-${_modules[$mod]} $mod
}

build() {
  export CC=clang
  export CXX="clang++"
  export CXXFLAGS+=" -static-libstdc++ -static-libgcc"
  cmake \
    -G Ninja \
    -Wno-author \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_NAMCORE=${BUILD_NAMCORE:-ON} \
    -DBUILD_INTERNAL_STATIC_WAVENET=${DBUILD_INTERNAL_STATIC_WAVENET:-ON} \
    -DBUILD_INTERNAL_STATIC_LSTM=${BUILD_INTERNAL_STATIC_LSTM:-ON} \
    -DUSE_NATIVE_ARCH=${USE_NATIVE_ARCH:-OFF} \
    -DSMART_BYPASS_ENABLED=${SMART_BYPASS_ENABLED:-OFF} \
    -DNAM_USE_INLINE_GEMM=${NAM_USE_INLINE_GEMM:-OFF} \
    -DMULTIFRAME_8X8_CONVOLUTION=${MULTIFRAME_8X8_CONVOLUTION:-0} \
    -B $pkgname-$pkgver-build \
    -S $pkgname-$pkgver
  cmake --build $pkgname-$pkgver-build
}


check() {
  cd $pkgname-$pkgver-build

  local lv2specs=(
    atom buf-size core data-access dynmanifest event instance-access log midi
    morph options parameters patch port-groups port-props resize-port schemas
    state time ui units uri-map urid worker kx-programs kx-properties)

  mkdir -p .lv2

  for spec in ${lv2specs[@]}; do
    ln -vsf /usr/lib/lv2/$spec.lv2 .lv2
  done

  ln -vsf "$(pwd)"/neural_amp_modeler.lv2 .lv2
  echo "Checking $pkgbase.lv2 with lv2lint ..."
  LV2_PATH="${PWD}/.lv2" lv2lint \
    -s '_Z*' \
    -s '__*' \
    -s '*_bak' \
    "$_plugin_uri"
}

package() {
  DESTDIR="$pkgdir" cmake --install $pkgname-$pkgver-build
  install -vDm 644 $pkgname-$pkgver/README.md \
    -t "$pkgdir"/usr/share/doc/$pkgname
  # licenses
  install -vDm 644 $pkgname-$pkgver/deps/NeuralAudio/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-NeuralAudio
  install -vDm 644 $pkgname-$pkgver/deps/NeuralAudio/deps/NeuralAmpModelerCore/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-NeuralAmpModelerCore
  install -vDm 644 $pkgname-$pkgver/deps/NeuralAudio/deps/RTNeural/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-RTNeural
  install -vDm 644 $pkgname-$pkgver/deps/NeuralAudio/deps/math_approx/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-math_approx
  install -vDm 644 $pkgname-$pkgver/deps/NeuralAudio/deps/RTNeural/modules/xsimd/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-xsimd
}
