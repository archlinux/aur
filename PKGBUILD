# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=gnome-weather-precipitation
pkgver=50.0
pkgrel=1
pkgdesc="Access current weather conditions and forecasts"
url="https://apps.gnome.org/Weather"
arch=(any)
license=(GPL-2.0-or-later)
provides=("gnome-weather=$pkgver")
conflicts=(gnome-weather)
depends=(
  dconf
  geoclue
  gjs
  gtk4
  hicolor-icon-theme
  libadwaita
  libgweather-4
)
makedepends=(
  appstream
  git
  gobject-introspection
  meson
  typescript
)
groups=(gnome)
source=(
  "git+https://gitlab.gnome.org/fluhus/gnome-weather.git#branch=rain"
  "git+https://gitlab.gnome.org/BrainBlasted/gi-typescript-definitions.git"
  0001-Allow-to-configure-automatic-location-setting.patch
  0002-Various-fixes-for-the-search-provider.patch
  0003-Raise-existing-window-instead-of-opening-new-one-on-.patch
  0004-Fix-TypeScript-6-configuration.patch
)
b2sums=('SKIP'
        'SKIP'
        '14ead85f7b34e71c7cb057f2892644661200325037e1e21cc202c1d962c1e4ba592469f4631a63d7e5db27d3bf7bd5761d62fbfc4618486c7f2ba33218d98961'
        '7781cedc70dc1badfe3b12143f4483b86fef41271e7a8625bf6008c35815c02c70ceef74ee6f8277abaf70492b9713f8450fd34e629e8fe265d3af266e6f77d7'
        '1c607b5c65fb8dc935054a93986b37cd299a1e1c877a816404c43a7b4410f809ebc2bc276e38525e0e42fc7aadcc3aa0229da9ef5f0b97c66f379741d5f0d804'
        'SKIP')

prepare() {
  cd gnome-weather

  # Allow to configure automatic location setting
  # https://gitlab.gnome.org/GNOME/gnome-weather/-/merge_requests/192
  git apply -3 ../0001-Allow-to-configure-automatic-location-setting.patch

  # Various fixes for the search provider
  # https://gitlab.gnome.org/GNOME/gnome-weather/-/merge_requests/193
  git apply -3 ../0002-Various-fixes-for-the-search-provider.patch

  # Raise existing window instead of opening new one on activation
  # https://gitlab.gnome.org/GNOME/gnome-weather/-/merge_requests/194
  git apply -3 ../0003-Raise-existing-window-instead-of-opening-new-one-on-.patch

  # Preserve the resource output layout with TypeScript 6.
  git apply ../0004-Fix-TypeScript-6-configuration.patch

  git submodule init
  git submodule set-url gi-types "$srcdir/gi-typescript-definitions"
  git -c protocol.file.allow=always -c protocol.allow=never submodule update
}

build() {
  arch-meson gnome-weather build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
