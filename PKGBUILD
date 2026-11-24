# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=wildergarden
_name=wildergarden-vcv
pkgname=vcvrack-wildergarden
pkgver=2.2.0
pkgrel=1
pkgdesc='Wildergarden VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/ArdenButterfield/wildergarden-vcv'
license=(GPL-3.0-or-later)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git jq simde zstd)
# get release commit from https://github.com/VCVRack/library/issues/821
_commit=cbb5d1b9f9144caa71ab0bd7e8a75933f55fa00f
source=("git+https://github.com/ArdenButterfield/$_name#commit=$_commit")
sha256sums=('abd149ea496a68b83400910c00fffa9c28d796f44c163b7d3246a428d72e9123')

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
