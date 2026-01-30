# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot -de>

_plugin_uri='http://geonkick.org/geonkick'
_pkgname=geonkick
pkgname="${_pkgname}-git"
pkgver=3.7.0.r1951.2fab92a7
pkgrel=1
pkgdesc='A free software percussion synthesizer (git version)'
arch=(x86_64)
url='https://quamplex.com/geonkick/'
license=(GPL-3.0-or-later)
groups=(lv2-plugins pro-audio vst3-plugins)
depends=(gcc-libs glibc cairo hicolor-icon-theme libsndfile libx11)
makedepends=(cmake git jack lv2 rapidjson sord vst3sdk)
checkdepends=(lv2lint)
optdepends=(
  'jack: for stand-alone application'
  'lv2-host: for loading the LV2 plugin'
  'vst3-host: for loading the VST3 plugin'
)
provides=($_pkgname $_pkgname-common $_pkgname-lv2 $_pkgname-standalone $_pkgname-vst3)
conflicts=($_pkgname $_pkgname-common $_pkgname-lv2 $_pkgname-standalone $_pkgname-vst3)
source=("$_pkgname::git+https://gitlab.com/Geonkick-Synthesizer/geonkick.git")
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
    -DVST3_SDK_PATH=/usr/src/vst3sdk \
    -W no-dev
  cmake --build $_pkgname-build
}

check() {
  local lv2specs=(
    atom buf-size core data-access dynmanifest event instance-access log midi
    morph options parameters patch port-groups port-props resize-port schemas
    state time ui units uri-map urid worker kx-programs kx-properties)

  mkdir -p lv2

  for spec in ${lv2specs[@]}; do
    ln -vsf /usr/lib/lv2/$spec.lv2 lv2
  done

  cp -av $_pkgname/src/plugin/lv2/$_pkgname.lv2/*.ttl $_pkgname-build/src/plugin/lv2/
  echo "Checking $pkgbase.lv2 with lv2lint ..."
  LV2_PATH="$PWD/lv2" lv2lint \
    -S nowarn \
    -s "rk__*" \
    -s "_Z*" \
    -M pack \
    -I "$_pkgname-build/src/plugin/lv2" \
    "$_plugin_uri" "$_plugin_uri/single"
  rm -v $_pkgname-build/src/plugin/lv2/*.ttl
}


package() {
  DESTDIR="$pkgdir" cmake --install $_pkgname-build
  cd $_pkgname
  # desktop file
  install -vDm 644 data/$_pkgname.desktop \
    -t "$pkgdir"/usr/share/applications
  # documentation
  install -vDm 644 AUTHORS README.md CHANGELOG.md \
    -t "$pkgdir"/usr/share/doc/$pkgname
  install -vDm 644 doc/*.{md,png} \
    -t "$pkgdir"/usr/share/doc/$pkgname
}
