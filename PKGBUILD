# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=meteo
pkgver=0.9.9.3
pkgrel=4
pkgdesc="A forecast application using OpenWeatherMap API"
arch=('x86_64')
url="https://gitlab.com/bitseater/meteo"
license=('GPL-3.0-or-later')
depends=(
  'gtk3'
  'libayatana-appindicator'
  'webkit2gtk'
)
makedepends=(
  'git'
  'meson'
  'vala'
)
checkdepends=('appstream')
conflicts=('meteo-gtk')
source=("git+https://gitlab.com/bitseater/meteo.git#tag=$pkgver"
        'https://gitlab.com/bitseater/meteo/-/merge_requests/104.patch')
sha256sums=('4bcd60794f3d2752abbf30a7e3554a2bd95be2c91d92c0bb2153a5639f8949cf'
            '62618aea39ff164dfc9aa9123c40f535786258520708cb2485ff1addf6356280')

prepare() {
  cd "$pkgname"

  # fix appdata
  patch -Np1 -i ../104.patch
}

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  ln -s /usr/bin/com.gitlab.bitseater.meteo "$pkgdir/usr/bin/$pkgname"
}
