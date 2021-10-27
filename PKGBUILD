# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-text-pango
pkgver=1.0
pkgrel=2
pkgdesc="Prefer obs-text-pthread instead | This plugin provides a text source for OBS Studio which is layed out and rendered using Pango"
arch=('x86_64')
url="https://github.com/kkartaltepe/obs-text-pango"
license=("GPL2")
depends=("obs-studio")
makedepends=('cmake')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/kkartaltepe/obs-text-pango/archive/v$pkgver.tar.gz"
  "updated_french.patch::https://patch-diff.githubusercontent.com/raw/kkartaltepe/obs-text-pango/pull/12.patch"
)
sha256sums=(
  '07bc145256393a902637ade6820d03988b655796748733ecec53790d370d2e4e'
  '059b6364966f8c90044b27efc100136ca03e8093c69cc91c10b79b0f26640669'
)

build() {
  cd "$pkgname-$pkgver"

  patch -Np1 < $srcdir/updated_french.patch

  cmake -B build \
  -DOBS_INCLUDE_DIRS='/usr/include/obs' \
  -DCMAKE_INSTALL_PREFIX='/'

  make -C build
}

package() {
  mkdir -p $pkgdir/usr/lib/obs-plugins
  mkdir -p $pkgdir/usr/share/obs/obs-plugins

  cd "$pkgname-$pkgver"

  _fake_install_dir="$srcdir/plugin-install"

  make -C build DESTDIR="$_fake_install_dir/" install

  cp -a $_fake_install_dir/obs-plugins/64bit/libtext-pango.so $pkgdir/usr/lib/obs-plugins
  cp -a $_fake_install_dir/data/obs-plugins/text-pango $pkgdir/usr/share/obs/obs-plugins/
}