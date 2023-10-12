# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=weather-vala-git
pkgver=r16.7a20233
pkgrel=1
pkgdesc='Application for viewing the current weather (latest commit)'
url="https://github.com/alexkdeveloper/weather"
arch=('x86_64')
license=('GPL3')
conflicts=("weather-vala")
provides=("weather-vala")
depends=('geoclue' 'libadwaita' 'libgweather-4')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd weather
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson weather build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  cd "$pkgdir"
  mv usr/bin/weather usr/bin/weather-vala
  sed -i -E "s|Exec=weather|Exec=weather-vala|g" usr/share/applications/io.github.alexkdeveloper.weather.desktop
}
