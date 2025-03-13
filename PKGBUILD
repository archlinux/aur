# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=speedtest-librespeed
pkgver=1.4.0
pkgrel=1
pkgdesc="A graphical librespeed client written using gtk4 + libadwaita"
arch=('any')
url="https://github.com/Ketok4321/speedtest"
license=('GPL-3.0-or-later')
depends=(
  'libadwaita'
  'python-aiohttp'
  'python-cairo'
  'python-gobject'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'meson'
)
checkdepends=('appstream-glib')
source=("git+https://github.com/Ketok4321/speedtest.git#tag=v$pkgver")
sha256sums=('9707ff20d70a2961ed62bea99f7bb756bd0f7a209a042559a0d2bdbf6464438b')

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
  meson test -C build --no-rebuild --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  # Binary name conflicts with speedtest-cli & ookla-speedtest-bin
  mv "$pkgdir/usr/bin/speedtest" "$pkgdir/usr/bin/$pkgname"
}
