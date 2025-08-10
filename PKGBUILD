# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann

_slug=voxglitch
_name=voxglitch
pkgname=vcvrack-voxglitch
pkgver=2.33.1
pkgrel=1
pkgdesc='Voxglitch VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/clone45/voxglitch'
license=(GPL-3.0-or-later)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git jq simde zstd)
# get release commit from https://github.com/VCVRack/library/issues/626
_commit=9d4593ffaadc235571d63ba5dec0093649e43916
source=("git+https://github.com/clone45/$_name#commit=$_commit")
sha256sums=('d4a0865114b95e52c6c271b4a51525f5550bcd270a75b14aed19a859422e9cd6')

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
