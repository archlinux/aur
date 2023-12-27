# Maintainer: LekKit <github.com/LekKit>
# Contributor: Christopher Arndt <aur -at -chrisarndt -dot- de>

_pkgname=neural-amp-modeler-lv2
pkgname=$_pkgname-git
pkgver=0.1.3.r14.43fb036
pkgrel=1
pkgdesc='Neural Amp Modeler (NAM) LV2 plugin (git version)'
arch=(aarch64 armv7h i686 pentium4 riscv64 riscv x86_64)
url='https://github.com/mikeoliphant/neural-amp-modeler-lv2'
license=(GPL3)
depends=(gcc-libs glibc)
makedepends=(git cmake)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/mikeoliphant/$_pkgname.git"
        'lv2::git+https://github.com/lv2/lv2.git'
        'eigen::git+https://gitlab.com/libeigen/eigen.git'
        'NeuralAmpModelerCore::git+https://github.com/mikeoliphant/NeuralAmpModelerCore.git'
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-\)g/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $_pkgname
  for submodule in lv2 eigen NeuralAmpModelerCore; do
    git submodule init deps/$submodule
    git submodule set-url deps/$submodule "$srcdir"/$submodule
    git -c protocol.file.allow=always submodule update deps/$submodule
  done
}

build() {
  cmake -B $_pkgname-build -S $_pkgname \
     -DCMAKE_BUILD_TYPE=Release
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
