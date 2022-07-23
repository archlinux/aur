# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=FreeSurface
_name=FreeSurface
pkgname=vcvrack-freesurface
pkgver=2.0.5
pkgrel=1
pkgdesc='Casual Systems/Free Surface VCV Rack modules'
arch=(x86_64 aarch64)
url='https://github.com/freesurfacemodules/FreeSurface'
license=(GPL3)
groups=(proaudio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(simde zstd)
source=("$pkgname-$pkgver.tar.gz::https://github.com/freesurfacemodules/$_name/archive/refs/tags/v$pkgver.tar.gz"
        'devendor-libsamplerate.patch')
sha256sums=('ed9d4ed7d309740501ba1b14e38ec8090a7df5d4e45cdee194cd7fca5c834273'
            'a77618a142fd33439f0a4872194d9fffb65a283da01c8fdffc2d40251dc009bd')

prepare() {
  cd $_name-$pkgver
  patch -p1 -i ../devendor-libsamplerate.patch
}

build() {
  cd $_name-$pkgver
  LDFLAGS+=" $(pkg-config --libs samplerate)" \
    make SLUG=$_slug VERSION=$pkgver RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name-$pkgver
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
  # remove common license
  rm "$pkgdir"/usr/lib/vcvrack/plugins/$_slug/LICENSE*
}
