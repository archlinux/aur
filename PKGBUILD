# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=speedtest-librespeed
pkgver=1.1.1
pkgrel=1
pkgdesc="A graphical librespeed client written using gtk4 + libadwaita"
arch=('any')
url="https://github.com/Ketok4321/speedtest"
license=('GPL3')
depends=('libadwaita' 'python-aiohttp' 'python-cairo' 'python-gobject')
makedepends=('blueprint-compiler' 'git' 'meson')
checkdepends=('appstream-glib')
_commit=a1af19f339a6c81cad09ad69f71961505c2ba406  # tags/v1.1.1^0
source=("git+https://github.com/Ketok4321/speedtest.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd speedtest
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd speedtest

  # Binary name conflicts with speedtest-cli & ookla-speedtest-bin
  sed -i "s/Exec=speedtest/Exec=$pkgname/g" data/xyz.ketok.Speedtest.desktop.in
}

build() {
  arch-meson speedtest build
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
