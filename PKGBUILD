# Maintainer: LekKit <github.com/LekKit>
# Contributor: Christopher Arndt <aur -at -chrisarndt -dot- de>

_pkgname=neural-amp-modeler-lv2
pkgname=$_pkgname-git
pkgver=0.1.7.r10.50be365
pkgrel=1
pkgdesc='Neural Amp Modeler (NAM) LV2 plugin (git version)'
arch=(aarch64 armv7h i686 pentium4 riscv64 riscv x86_64)
url='https://github.com/mikeoliphant/neural-amp-modeler-lv2'
license=(GPL-3.0-only)
groups=(lv2-plugins pro-audio)
depends=(gcc-libs glibc)
makedepends=(git cmake)
optdepends=(
  'lv2-host: for loading the LV2 plugin'
)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/mikeoliphant/$_pkgname.git"
        'lv2::git+https://github.com/lv2/lv2.git'
        'NeuralAudio::git+https://github.com/mikeoliphant/NeuralAudio.git'
        'NeuralAmpModelerCore::git+https://github.com/mikeoliphant/NeuralAmpModelerCore.git'
        'RTNeural::git+https://github.com/mikeoliphant/RTNeural.git'
        'math_approx::git+https://github.com/Chowdhury-DSP/math_approx.git'
        'xsimd::git+https://github.com/xtensor-stack/xsimd.git'
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $_pkgname
  for submodule in lv2 NeuralAudio; do
    git submodule init deps/$submodule
    git submodule set-url deps/$submodule "$srcdir"/$submodule
    git -c protocol.file.allow=always submodule update deps/$submodule
  done
  cd deps/NeuralAudio
  for submodule in NeuralAmpModelerCore RTNeural math_approx; do
    git submodule init deps/$submodule
    git submodule set-url deps/$submodule "$srcdir"/$submodule
    git -c protocol.file.allow=always submodule update deps/$submodule
  done
  cd deps/RTNeural
  git submodule init modules/xsimd
  git submodule set-url modules/xsimd "$srcdir"/xsimd
  git -c protocol.file.allow=always submodule update modules/xsimd
}

build() {
  cmake \
    -B $_pkgname-build \
    -S $_pkgname \
    -DCMAKE_BUILD_TYPE=Release \
    ${USE_NATIVE_ARCH:+-DUSE_NATIVE_ARCH=ON}

  cmake --build $_pkgname-build --config Release -j $(nproc --ignore=1)
}

package() {
  install -vDm 644 $_pkgname-build/neural_amp_modeler.lv2/*.ttl \
    -t "$pkgdir"/usr/lib/lv2/neural_amp_modeler.lv2
  install -vDm 755 $_pkgname-build/neural_amp_modeler.lv2/*.so \
    -t "$pkgdir"/usr/lib/lv2/neural_amp_modeler.lv2
  install -vDm 644 $_pkgname/README.md \
    -t "$pkgdir"/usr/share/doc/$pkgname
}
