# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: LekKit <github.com/LekKit>
# Contributor: Christopher Arndt <aur -at -chrisarndt -dot- de>

pkgname=neural-amp-modeler-lv2
pkgver=0.1.6
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
  ["NeuralAudio"]="84ef71b3189685dbab7a4757f19907dcb9e1d803"
  ["NeuralAmpModelerCore"]="e181f61efb8d05d34add45b5eecb3893ff21177c"
  ["RTNeural"]="5909c44909cd6100367f62cd04b348de85d57dbf"
  ["RTNeural-NAM"]="720d83fc30031eac0a639c60df3d9438930c40d9"
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/mikeoliphant/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
        "NeuralAudio-${_modules[NeuralAudio]}.tar.gz::https://github.com/mikeoliphant/NeuralAudio/archive/${_modules[NeuralAudio]}.tar.gz"
        "NeuralAmpModelerCore-${_modules[NeuralAmpModelerCore]}.tar.gz::https://github.com/mikeoliphant/NeuralAmpModelerCore/archive/${_modules[NeuralAmpModelerCore]}.tar.gz"
        "RTNeural-${_modules[RTNeural]}.tar.gz::https://github.com/mikeoliphant/RTNeural/archive/${_modules[RTNeural]}.tar.gz"
        "RTNeural-NAM-${_modules[RTNeural-NAM]}.tar.gz::https://github.com/mikeoliphant/RTNeural-NAM/archive/${_modules[RTNeural-NAM]}.tar.gz"
)
sha256sums=('a310e2228217f006be390ec4b38d17e7c666326b70c269c1c915314520fbd74a'
            '9e22d56d9af46f0aab326423f47eec3d7f0f6816bbaf5b9d0cb8480975de55c8'
            'e732c6e204597d4059aa01f5f416034383dac13d26859b97ef4b97ba0cb3ab39'
            '76f7f6160e681acbb4dd1fff4cfc23a3b61f51f0df2f8b3b5449c010628e4013'
            'dac2e65a25f04d686baa3656e4500b4aab2cb1c1fad0d96387623658d3718264')

prepare() {
  cd $pkgname-$pkgver/deps
  test -d NeuralAudio && rmdir NeuralAudio
  test -f NeuralAudio || ln -s "$srcdir"/NeuralAudio-${_modules[NeuralAudio]} NeuralAudio
  cd NeuralAudio/deps
  for mod in NeuralAmpModelerCore RTNeural RTNeural-NAM; do
    test -d $mod && rmdir $mod
    test -f $mod || ln -s "$srcdir"/$mod-${_modules[$mod]} $mod
  done
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
    -t "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-NeuralAudio
  install -vDm 644 $pkgname-$pkgver/deps/NeuralAudio/deps/NeuralAmpModelerCore/LICENSE \
    -t "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-NeuralAmpModelerCore
  install -vDm 644 $pkgname-$pkgver/deps/NeuralAudio/deps/RTNeural/LICENSE \
    -t "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-RTNeural
  install -vDm 644 $pkgname-$pkgver/deps/NeuralAudio/deps/RTNeural-NAM/LICENSE \
    -t "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-RTNeural-NAM
}
