# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=wildergarden
_name=wildergarden-vcv
pkgname=vcvrack-wildergarden
pkgver=2.0.1
pkgrel=2
pkgdesc='Wildergarden VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/ArdenButterfield/wildergarden-vcv'
license=(GPL-3.0-or-later)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git jq simde zstd)
# get release commit from from https://github.com/VCVRack/library/tree/v2/repos
_commit=b3977e99bef7c905790973c0979eaf784cf3e015
source=("git+https://github.com/ArdenButterfield/$_name#commit=$_commit")
sha256sums=('138c27a8959b1e0bcfaf4247718af2f214b341a91f0761f39db56934abf2dda4')

prepare() {
  cd $_name
  if [ $(jq -r .version plugin.json) != $pkgver ]; then
    echo "Make sure to update _commit"
    false
  fi
  # remove common license
  rm LICENSE
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
