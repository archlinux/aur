# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=Tyche
_name=VCVTyche
pkgname=vcvrack-tyche
pkgver=2.1.5
pkgrel=1
pkgdesc='Tyche VCV Rack modules'
arch=(x86_64)
url='https://github.com/denolehov/VCVTyche'
license=(GPL-3.0-or-later)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git simde zstd)
source=("git+https://github.com/denolehov/$_name#tag=v$pkgver"
        'git+https://github.com/deerel/OpenSimplexNoise')
sha256sums=('c2ebe1feb22dcdf4a834a5e15c86b45a22e67eba013c2ac6639ea618adff5b8f'
            'SKIP')

prepare() {
  cd $_name
  # submodule
  git submodule init
  git config submodule.external/OpenSimplexNoise.url "$srcdir"/OpenSimplexNoise
  git -c protocol.file.allow=always submodule update
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
