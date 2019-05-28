# Maintainer: Sam Burgos < santiago dot burgos1089 at gmail dot com >

pkgname=gnome-calendar-linuxmint
_pkgname=gnome-calendar
pkgver=3.32.2
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
)
optdepends=(
    'evolution: ICS file import'
)
makedepends=(
    appstream-glib
    git
    gtk-doc
    meson
    python
)
provides=(${_pkgname})
conflicts=(${_pkgname})
groups=(gnome)
_commit=366f6f7aadebcb5bb61dfa6a1416384f90a3a4cd  # tags/3.32.2^0
source=(
    "git+https://gitlab.gnome.org/GNOME/gnome-calendar.git#commit=$_commit"
    "null-icaltime.diff"
    "add_cinnamon_settings_online_support.patch"
    "set_window_icon_name.patch"
)
sha256sums=('SKIP'
            'c1aa738a4ff275f725d0aa5406312600503b2b59270448a9e6b30b82a924dc27'
            '2445f754a044dd1ccb8c948b5d5b43248b61ec3570fc76416f74148abc5abf4d'
            'd0c4affaa3edcb0c44ff1ef06a4e78951b7b5820becdbfdf7d41d90d523f3c08')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname
  # Set datetime to NULL in case there is no available date
  patch -Np1 -i ../null-icaltime.diff

  # Add support so that gnome-calendar run within Cinnamon by calling cinnamon-settings online-accounts
  patch -Np0 -i ../add_cinnamon_settings_online_support.patch

  # Fix: Set window icon name
  patch -Np0 -i ../set_window_icon_name.patch
}

build() {
  arch-meson $pkgname build -D documentation=true
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
