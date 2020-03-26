# Maintainer: Sam Burgos < santiago dot burgos1089 at gmail dot com >

pkgname=gnome-calendar-linuxmint
_pkgname=gnome-calendar
pkgver=3.36.0
pkgrel=1
pkgdesc='Simple and beautiful calendar application designed to perfectly fit the GNOME desktop. With Linux Mint patches'
arch=(x86_64)
url=https://wiki.gnome.org/Apps/Calendar
license=(GPL)
depends=(
    cinnamon
    cinnamon-control-center
    evolution-data-server
    geoclue2
    gnome-online-accounts
    gsettings-desktop-schemas
    libdazzle
    libgweather
    libical
)
optdepends=(
    'evolution: ICS file import'
)
makedepends=(
    appstream-glib
    git
    meson
    python
)
provides=(${_pkgname})
conflicts=(${_pkgname})
groups=(gnome)
_commit=fb2830bbc2fac7d0922fa736788cd3fefb38f111  # tags/3.36.0^0
source=(
    "git+https://gitlab.gnome.org/GNOME/gnome-calendar.git#commit=$_commit"
    "add_cinnamon_settings_online_support.patch"
    "replace_link_cinnamon_settings_online_support.patch"
    "set_window_icon_name.patch"
)
sha256sums=('SKIP'
            'c05b6d35b89c9b121d544f86a788f021bf06a705d8c507c8a9eecc596d1320ba'
            'ee49aad54bee8c50e5cdbbe68cd6f58287cd1cb368dd0f9f3a996a99418489c4'
            '1788c8cb1fbf8bd5cf81d700d9f5f7eb1e5eea265e35930dc70df147f79ebc9a')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname

  # Fix: Set window icon name
  patch -Np0 -i ../set_window_icon_name.patch

  # Replace GNOME Control Center internal call with Cinnamon Settings (cinnamon-settings online-accounts)
  patch -Np0 -i ../add_cinnamon_settings_online_support.patch

  # Replace GNOME Web Description link label with cinnamon-settings online-accounts
  patch -Np0 -i ../replace_link_cinnamon_settings_online_support.patch
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
