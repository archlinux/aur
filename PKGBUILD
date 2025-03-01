# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_slug=Ahornberg
_name=Ahornberg-VCV-Modules
pkgname=vcvrack-ahornberg
pkgver=2.1.6
pkgrel=4
pkgdesc='Ahornberg VCV Rack modules'
arch=(x86_64 aarch64)
url='https://github.com/Ahornberg/Ahornberg-VCV-Modules'
license=(GPL3 custom:OFL)
groups=(pro-audio vcvrack-plugins)
depends=(gcc-libs vcvrack)
makedepends=(simde zstd)
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Ahornberg/$_name/archive/refs/tags/v$pkgver.tar.gz"
        "fix-gcc-format.patch::https://github.com/Ahornberg/$_name/pull/20.patch")
sha256sums=('1b7006d7c6bb10c4efc51accf70959384fd512a20a3395104ea181302b79830b'
            'd87e4494844a6c432222487157d81510b402e0b2e55ac0608b1640c71790ab19')

prepare() {
  cd $_name-$pkgver
  # https://github.com/Ahornberg/Ahornberg-VCV-Modules/pull/20
  patch -p1 -i ../fix-gcc-format.patch
  # remove common license and unnecessary windows libs
  rm -r LICENSE.txt res/vst
}

build() {
  cd $_name-$pkgver
  make SLUG=$_slug VERSION=$pkgver STRIP=: RACK_DIR=/usr/share/vcvrack dist
}

package() {
  cd $_name-$pkgver
  install -d "$pkgdir"/usr/lib/vcvrack/plugins
  cp -va dist/$_slug -t "$pkgdir"/usr/lib/vcvrack/plugins
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  mv "$pkgdir"/usr/lib/vcvrack/plugins/$_slug/res/fonts/licenses/*.txt \
    "$pkgdir"/usr/share/licenses/$pkgname
}
