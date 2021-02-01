# Maintainer: tytan652 <tytan652@tytanium.xyz>
pkgname=obs-text-pango
pkgver=1.0
pkgrel=1
pkgdesc="This plugin provides a text source for OBS Studio which is layed out and rendered using Pango"
arch=('x86_64')
url="https://github.com/kkartaltepe/obs-text-pango"
license=("GPL2")
depends=("obs-studio")
makedepends=('cmake')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/kkartaltepe/obs-text-pango/archive/v$pkgver.tar.gz"
)
sha256sums=('07bc145256393a902637ade6820d03988b655796748733ecec53790d370d2e4e')

prepare() {
  rm -rf fakeroot
}

build() {
  cd "$pkgname-$pkgver"
  cmake -B build \
  -DOBS_INCLUDE_DIRS='/usr/include/obs' \
  -DCMAKE_INSTALL_PREFIX='/'
  make -C build
}

package() {
  mkdir -p "$pkgdir"/usr/lib/obs-plugins
  mkdir -p "$pkgdir"/usr/share/obs/obs-plugins

  cd "$pkgname-$pkgver"
  make -C build DESTDIR="$srcdir/fakeroot/" install

  cp -a "$srcdir"/fakeroot/obs-plugins/64bit/libtext-pango.so "$pkgdir"/usr/lib/obs-plugins
  cp -a "$srcdir"/fakeroot/data/obs-plugins/text-pango "$pkgdir"/usr/share/obs/obs-plugins/
}