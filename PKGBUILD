# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=meteo-gtk
pkgver=0.9.9.2
pkgrel=1
pkgdesc="A forecast application using OpenWeatherMap API"
arch=('x86_64')
url="https://gitlab.com/bitseater/meteo"
license=('GPL-3.0-or-later')
depends=('gtk3' 'libayatana-appindicator' 'webkit2gtk')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream')
provides=("${pkgname%-gtk}")
conflicts=("${pkgname%-gtk}")
_commit=e1960a100fb2a58cd24e833aede152d5f86ca5e1  # tags/0.9.9.2^0
source=("git+https://gitlab.com/bitseater/meteo.git#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=('900E41F44EFF4B6D696EB80AE6BDC743AED36483') # Carlos Suárez <bitseater@gmail.com>

pkgver() {
  cd "${pkgname%-gtk}"
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson "${pkgname%-gtk}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"

  ln -s /usr/bin/com.gitlab.bitseater.meteo "$pkgdir/usr/bin/${pkgname%-gtk}"
}
