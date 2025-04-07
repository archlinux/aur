# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann

_slug=voxglitch
_name=voxglitch
pkgname=vcvrack-voxglitch
pkgver=2.32.4
pkgrel=1
pkgdesc='Voxglitch VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/clone45/voxglitch'
license=(GPL-3.0-or-later)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git jq simde zstd)
# get release commit from https://github.com/VCVRack/library/tree/v2/repos
_commit=ff7f2a4cb54b24173061cbb5211bc996b6383f3c
source=("git+https://github.com/clone45/$_name#commit=$_commit")
sha256sums=('791164cb6f318485e88bfa7bab690b3592564b2e30c534e32523823b24dc081e')

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
