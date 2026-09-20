# Maintainer: Florian Hülsmann <fh@cbix.de>
# Contributor: Miroslav Koškár <http://mkoskar.com/>
# Contributor: David Runge <dave@sleepmap.de>

_slug=Befaco
_name=Befaco
pkgname=vcvrack-befaco
pkgver=2.11.0
pkgrel=1
pkgdesc='VCV Rack plugin collection'
arch=(aarch64 x86_64)
url='https://github.com/VCVRack/Befaco'
license=(custom  CC-BY-NC-4.0  GPL-3.0-or-later)
groups=(proaudio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git simde zstd)
source=("git+https://github.com/VCVRack/$_name#tag=v$pkgver"
        'git+https://github.com/Befaco/Iroi'
        'git+https://github.com/hemmer/OwlProgram')
sha256sums=('41943fa86b7dff65948e82bea49632ca3f8c60eb9f9fa18a1cd4365bcd0776e4'
            'SKIP'
            'SKIP')

prepare() {
  cd $_name
  git submodule init
  git config submodule.libs/Iroi.url "$srcdir"/Iroi
  git config submodule.libs/OwlProgram.url "$srcdir"/OwlProgram
  git -c protocol.file.allow=always submodule update
}

build() {
  cd $_name
  make SLUG=$_slug VERSION=$pkgver STRIP=: RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name
  install -vDm644 LICENSE.md LICENSE-dist.md -t "$pkgdir"/usr/share/licenses/$pkgname
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
}
