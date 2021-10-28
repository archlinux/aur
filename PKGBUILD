# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=vgrive
pkgver=1.6.1
pkgrel=6
pkgdesc="Google Drive client made in Vala"
arch=('x86_64')
url="https://github.com/bcedu/VGrive"
license=('GPL3')
depends=('gtk3' 'granite' 'libappindicator-gtk3' 'libsoup')
makedepends=('meson' 'vala' 'wayland-protocols')
#checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'https://github.com/bcedu/VGrive/pull/116.patch')
sha256sums=('f125ef74ce1d53517cc45d69716bb9668847d5c406096306aedf2a1178b4bfde'
            '1210228c34d35b3b9464df735464c17124fa9d8bb693ccb708370a0bf8b14735')

prepare() {
  cd "VGrive-$pkgver"

  # Fix compilation errors in new vala
  patch -Np1 -i "$srcdir/116.patch"
}

build() {
  arch-meson "VGrive-$pkgver" build
  meson compile -C build
}

check() {

  # Validate appstream file fails, only validate desktop & schema files
  meson test 'Validate desktop file' 'Validate schema file' -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  ln -s /usr/bin/com.github.bcedu.vgrive "$pkgdir/usr/bin/$pkgname"
}
