# Maintainer: Milkii Brewster <milkii on Freenode IRC>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=uhhyou.lv2
pkgname=$_pkgname-git
pkgdesc='Various synth, effect and CV LV2 plugins (git version)'
pkgver=r512.7924bf5
pkgrel=1
arch=(x86_64)
url='https://github.com/ryukau/LV2Plugins'
license=(GPL3)
groups=(lv2-plugins pro-audio)
depends=(gcc-libs)
makedepends=(git lv2 libglvnd)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/Wasted-Audio/ryukau_LV2Plugins.git"
        'dpf::git+https://github.com/DISTRHO/DPF.git'
        'vcl::git+https://github.com/vectorclass/version2.git'
        'pocketfft::git+https://gitlab.mpcdf.mpg.de/mtr/pocketfft.git'
        'uhhyou-include-array.patch')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'db81dad48cb8d8b450b52521545dd27e')

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $_pkgname
  git submodule init
  git submodule set-url lib/DPF "$srcdir"/dpf
  git submodule set-url lib/vcl "$srcdir"/vcl
  git submodule set-url lib/pocketfft "$srcdir"/pocketfft
  git -c protocol.file.allow=always submodule update
  patch -p1 -N -r - -i "$srcdir"/uhhyou-include-array.patch
}

build() {
  cd $_pkgname
  make -j $(nproc --ignore 1) JACK=false VST2=false
}

package() {
  depends+=(libGL.so)
  cd $_pkgname
  # LV2 bundles
  ( cd bin; \
    for plugin in *.lv2; do
      install -Dm755 $plugin/*.so -t "$pkgdir"/usr/lib/lv2/$plugin
      install -Dm644 $plugin/*.ttl -t "$pkgdir"/usr/lib/lv2/$plugin
    done;
  )
  # README
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
}
