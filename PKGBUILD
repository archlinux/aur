# Maintainer: Sam Burgos < santiago dot burgos1089 at gmail dot com >

pkgname=gnome-calendar-linuxmint
_pkgname=gnome-calendar
pkgver=3.34.2
pkgrel=1
pkgdesc='Simple and beautiful calendar application designed to perfectly fit the GNOME desktop. With Linux Mint patches'
arch=(x86_64)
url=https://wiki.gnome.org/Apps/Calendar
license=(GPL)
depends=(
    evolution-data-server
    geoclue2
    gsettings-desktop-schemas
    libdazzle
    libgweather
)
optdepends=(
    'evolution: ICS file import'
)
makedepends=(
    appstream-glib
    git
    gnome-control-center
    meson
    python
)
provides=(${_pkgname})
conflicts=(${_pkgname})
groups=(gnome)
_commit=98881b9071ce39b8704e9b5af4eb1faa064ba3fa  # tags/3.34.2^0
source=(
    "git+https://gitlab.gnome.org/GNOME/gnome-calendar.git#commit=$_commit"
    "add_cinnamon_settings_online_support.patch"
    "set_window_icon_name.patch"
)
sha256sums=('SKIP'
            '9b81f538a4ebc74c66b6ea80a02303fe6adfc92dc183e6a96e0f090ac777e7d9'
            '1788c8cb1fbf8bd5cf81d700d9f5f7eb1e5eea265e35930dc70df147f79ebc9a')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname

  # Add support so that gnome-calendar run within Cinnamon by calling cinnamon-settings online-accounts
  patch -Np0 -i ../add_cinnamon_settings_online_support.patch

  # Fix: Set window icon name
  patch -Np0 -i ../set_window_icon_name.patch
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
