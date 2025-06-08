# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=not-things
_name=not-things-vcv
pkgname=vcvrack-not-things
pkgver=2.0.3
pkgrel=1
pkgdesc='not-things VCV Rack modules'
arch=(aarch64 x86_64)
url='https://github.com/not-things-modular/not-things-vcv'
license=(GPL-3.0-or-later)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(git nlohmann-json simde zstd)
source=("git+https://github.com/not-things-modular/$_name#tag=v$pkgver"
        "include-cstdint.patch::https://github.com/not-things-modular/$_name/pull/12.patch")
sha256sums=('bd7a0d648416f8dece3d9b9f6938927290ba267514e548260b0d56b5e61f464f'
            '5e5ca379d811c1ef7ca4a71061f08316b75608722348e68980b99f285c9269e2')

prepare() {
  cd $_name
  # https://github.com/not-things-modular/not-things-vcv/pull/12
  patch -p1 -i ../include-cstdint.patch
  # common license
  rm LICENSE.md
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
