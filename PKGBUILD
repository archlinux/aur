# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann

_slug=voxglitch
_name=voxglitch
pkgname=vcvrack-voxglitch
pkgver=2.44.0
pkgrel=1
pkgdesc='Voxglitch VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/clone45/voxglitch'
license=(GPL-3.0-or-later)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git jq simde zstd)
# get release commit from https://github.com/VCVRack/library/issues/626
_commit=c4db491d63750683dcc0b6b52aff40c66f8162c6
source=("git+https://github.com/clone45/$_name#commit=$_commit")
sha256sums=('6844eaecec6ae88d706f95676aaba1de1a2661068fd6155912f189351957554a')

prepare() {
  cd $_name
  if [ $(jq -r .version plugin.json) != $pkgver ]; then
    echo "Make sure to update _commit"
    false
  fi
  # common license
  rm LICENSE
  # https://github.com/clone45/voxglitch/issues/217#issuecomment-2690344027
  sed -i -e 's/reserve/resize/g' src/vgLib-2.0/widgets/WaveformWidget.hpp
}

build() {
  cd $_name
  make SLUG=$_slug VERSION=$pkgver STRIP=: RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
}
