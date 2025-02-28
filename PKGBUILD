# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=ChemicalElements
_name=chemical-elements
pkgname=vcvrack-chemical-elements
pkgver=2.0.0
pkgrel=2
pkgdesc='Chemical Elements VCV Rack modules'
arch=(aarch64 x86_64)
url='https://gitlab.com/pythongirl/chemical-elements'
license=(GPL-3.0-or-later)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git jq simde zstd)
# get commit from https://github.com/VCVRack/library/tree/v2/repos
_commit=414e488e8db482e0d67a3294b2d8461ade36ac03
source=("git+https://gitlab.com/pythongirl/$_name#commit=$_commit")
sha256sums=('79b201abc903c5ff433626ebbcbee32370f6629270a621612cdb4961fa97dc1c')

prepare() {
  cd $_name
  if [ $(jq -r .version plugin.json) != $pkgver ]; then
    echo "Make sure to update _commit"
    false
  fi
  # common license
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
