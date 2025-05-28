# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: LekKit <github.com/LekKit>
# Contributor: Christopher Arndt <aur -at -chrisarndt -dot- de>

pkgname=neural-amp-modeler-lv2
pkgver=0.1.8
pkgrel=1
pkgdesc='Neural Amp Modeler (NAM) LV2 plugin'
arch=(x86_64)
url='https://github.com/mikeoliphant/neural-amp-modeler-lv2'
license=(GPL-3.0-only BSD-3-Clause MIT)
groups=(lv2-plugins pro-audio)
depends=(gcc-libs glibc)
makedepends=(cmake lv2 ninja)
optdepends=(
  'lv2-host: for loading the LV2 plugin'
)

declare -g -A _modules=(
  ["NeuralAudio"]="cddc6afcd16f2252506d998a557b30071a25bfdf"
  ["NeuralAmpModelerCore"]="e181f61efb8d05d34add45b5eecb3893ff21177c"
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
sha256sums=('ef571a28fc913ccc12f3cef0f6832abe3449dd66f12b2567269d3ddfed82465d'
            'b1fcaf3ada0e90b9ba6eb633e8564413c11882d685d1e33128166946bdbdf937'
            'e732c6e204597d4059aa01f5f416034383dac13d26859b97ef4b97ba0cb3ab39'
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
  cmake \
    -G Ninja \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_NATIVE_ARCH=${USE_NATIVE_ARCH:-OFF} \
    -B $pkgname-$pkgver-build \
    -S $pkgname-$pkgver
  cmake --build $pkgname-$pkgver-build
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
  install -vDm 644 $pkgname-$pkgver/deps/NeuralAudio/deps/RTNeural-NAM/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-RTNeural-NAM
  install -vDm 644 $pkgname-$pkgver/deps/NeuralAudio/deps/math_approx/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-math_approx
  install -vDm 644 $pkgname-$pkgver/deps/NeuralAudio/deps/RTNeural/modules/xsimd/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-xsimd
}
