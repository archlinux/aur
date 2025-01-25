# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: LekKit <github.com/LekKit>
# Contributor: Christopher Arndt <aur -at -chrisarndt -dot- de>

declare -g -A submodules=(
  ["lv2"]="e9d94328743d630e27a9d322015437fd9080695d"
  ["NeuralAudio"]="84ef71b3189685dbab7a4757f19907dcb9e1d803"
  ["NeuralAmpModelerCore"]="e181f61efb8d05d34add45b5eecb3893ff21177c"
  ["RTNeural"]="5909c44909cd6100367f62cd04b348de85d57dbf"
  ["RTNeural-NAM"]="720d83fc30031eac0a639c60df3d9438930c40d9"
)

pkgname=neural-amp-modeler-lv2
pkgver=0.1.6
pkgrel=1
pkgdesc='Neural Amp Modeler (NAM) LV2 plugin'
arch=(aarch64 x86_64)
url='https://github.com/mikeoliphant/neural-amp-modeler-lv2'
license=(GPL-3.0-only)
groups=(lv2-plugins pro-audio)
depends=(gcc-libs glibc)
makedepends=(cmake)
optdepends=(
  'lv2-host: for loading the LV2 plugin'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mikeoliphant/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
        "lv2-${submodules[lv2]}.tar.gz::https://github.com/lv2/lv2/archive/${submodules[lv2]}.tar.gz"
        "NeuralAudio-${submodules[NeuralAudio]}.tar.gz::https://github.com/mikeoliphant/NeuralAudio/archive/${submodules[NeuralAudio]}.tar.gz"
        "NeuralAmpModelerCore-${submodules[NeuralAmpModelerCore]}.tar.gz::https://github.com/mikeoliphant/NeuralAmpModelerCore/archive/${submodules[NeuralAmpModelerCore]}.tar.gz"
        "RTNeural-${submodules[RTNeural]}.tar.gz::https://github.com/mikeoliphant/RTNeural/archive/${submodules[RTNeural]}.tar.gz"
        "RTNeural-NAM-${submodules[RTNeural-NAM]}.tar.gz::https://github.com/mikeoliphant/RTNeural-NAM/archive/${submodules[RTNeural-NAM]}.tar.gz"
)
sha256sums=('a310e2228217f006be390ec4b38d17e7c666326b70c269c1c915314520fbd74a'
            '2a273ad23fa6e98b3a419a51efb906eb77e0431deceff6e77df2827249e6f49c'
            '9e22d56d9af46f0aab326423f47eec3d7f0f6816bbaf5b9d0cb8480975de55c8'
            'e732c6e204597d4059aa01f5f416034383dac13d26859b97ef4b97ba0cb3ab39'
            '76f7f6160e681acbb4dd1fff4cfc23a3b61f51f0df2f8b3b5449c010628e4013'
            'dac2e65a25f04d686baa3656e4500b4aab2cb1c1fad0d96387623658d3718264')

prepare() {
  cd $pkgname-$pkgver/deps
  for submodule in lv2 NeuralAudio; do
    test -d $submodule && rmdir $submodule
    test -f $submodule || ln -s "$srcdir"/$submodule-${submodules[$submodule]} $submodule
  done
  cd NeuralAudio/deps
  for submodule in NeuralAmpModelerCore RTNeural RTNeural-NAM; do
    test -d $submodule && rmdir $submodule
    test -f $submodule || ln -s "$srcdir"/$submodule-${submodules[$submodule]} $submodule
  done
}

build() {
  cmake \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -B $pkgname-$pkgver-build \
    -S $pkgname-$pkgver
  cmake --build $pkgname-$pkgver-build --config Release -j $(nproc --ignore=1)
}

package() {
  install -vDm 644 $pkgname-$pkgver-build/neural_amp_modeler.lv2/*.ttl \
    -t "$pkgdir"/usr/lib/lv2/neural_amp_modeler.lv2
  install -vDm 755 $pkgname-$pkgver-build/neural_amp_modeler.lv2/*.so \
    -t "$pkgdir"/usr/lib/lv2/neural_amp_modeler.lv2
  install -vDm 644 $pkgname-$pkgver/README.md \
    -t "$pkgdir"/usr/share/doc/$pkgname
}
