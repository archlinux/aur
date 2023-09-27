# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=speedtest-librespeed
pkgver=1.1.0
pkgrel=1
pkgdesc="A graphical librespeed client written using gtk4 + libadwaita"
arch=('any')
url="https://github.com/Ketok4321/speedtest"
license=('GPL3')
depends=('libadwaita' 'python-aiohttp' 'python-cairo' 'python-gobject')
makedepends=('blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6e9f92c151b4c4017ea85755edf5f4de34e79b4d562e429b78f0e36b09178256')

prepare() {
  cd "speedtest-$pkgver"

  # Binary name conflicts with speedtest-cli & ookla-speedtest-bin
  sed -i "s/Exec=speedtest/Exec=$pkgname/g" data/xyz.ketok.Speedtest.desktop.in

  # Update version
  sed -i "s/1.0.1/$pkgver/g" meson.build
}

build() {
  arch-meson "speedtest-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"

  # Binary name conflicts with speedtest-cli & ookla-speedtest-bin
  mv "$pkgdir/usr/bin/speedtest" "$pkgdir/usr/bin/$pkgname"
}
