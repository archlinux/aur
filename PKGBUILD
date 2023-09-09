# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot -de>

_plugin_uri='http://geontime.com/geonkick'
_pkgname=geonkick
pkgname="${_pkgname}-git"
pkgver=2.10.0.r1199.990cb7ba
pkgrel=1
pkgdesc='A free software percussion synthesizer (git version)'
arch=(x86_64)
url='https://gitlab.com/geonkick/geonkick'
license=(GPL3)
groups=(lv2-plugins pro-audio vst3-plugins)
depends=(gcc-libs glibc cairo hicolor-icon-theme libx11 libsndfile)
makedepends=(cmake git jack lv2 rapidjson sord)
checkdepends=(lv2lint)
optdepends=(
  'jack: for stand-alone application'
  'lv2-host: for loading the LV2 plugin'
  'vst3-host: for loading the VST3 plugin'
)
provides=($_pkgname $_pkgname-common $_pkgname-lv2 $_pkgname-standalone $_pkgname-vst3)
conflicts=($_pkgname $_pkgname-common $_pkgname-lv2 $_pkgname-standalone $_pkgname-vst3)
source=("$_pkgname::git+https://gitlab.com/geonkick/geonkick.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  local ver="$(grep 'geonkick VERSION' CMakeLists.txt | cut -d ' ' -f 3 | tr -d ')')"
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cmake \
    -B $_pkgname-build \
    -S $_pkgname \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DGKICK_VST3=ON \
    -W no-dev
  cmake --build $_pkgname-build
}

check() {
  cp -av $_pkgname-build/plugin/lv2/*.so $_pkgname/plugin/lv2/$_pkgname.lv2/
  lv2lint -Mpack -I $_pkgname/plugin/lv2/$_pkgname.lv2/ "$_plugin_uri"
  rm $_pkgname/plugin/lv2/$_pkgname.lv2/*.so
}


package() {
  DESTDIR="$pkgdir" cmake --install $_pkgname-build
  cd $_pkgname
  # desktop file
  install -vDm 644 data/$_pkgname.desktop \
    -t "$pkgdir"/usr/share/applications
  # documentation
  install -vDm 644 README.md NEWS.md \
    -t "$pkgdir"/usr/share/doc/$pkgname
  install -vDm 644 doc/*.{md,png} \
    -t "$pkgdir"/usr/share/doc/$pkgname
}
