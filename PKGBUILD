# Maintainer: Sam Burgos < santiago dot burgos1089 at gmail dot com >

pkgname=gnome-calendar-linuxmint
_pkgname=gnome-calendar
pkgver=3.32.0
pkgrel=3
pkgdesc="Simple and beautiful calendar application designed to perfectly fit the GNOME desktop. With Linux Mint patches"
url="https://wiki.gnome.org/Apps/Calendar"
arch=('x86_64')
license=('GPL')
depends=('evolution-data-server'
    'geoclue2' 
    'gsettings-desktop-schemas'
    'libdazzle')
makedepends=('appstream-glib' 
    'evolution'
    'git'
    'gtk-doc'
    'meson'
    'python')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_commit=643622069d939529eafb7aa94d95905795e6fb94  # master
source=("git+https://gitlab.gnome.org/GNOME/gnome-calendar.git#commit=$_commit"
        "null-icaltime.diff"
        "add_cinnamon_settings_online_support.patch"
        "set_window_icon_name.patch")
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
  
  # Add support so that gnome-calendar can call this when run within Cinnamon by calling cinnamon-settings online-accounts 
  patch -Np0 -i ../add_cinnamon_settings_online_support.patch
  
  # Fix: Set window icon name
  patch -Np0 -i ../set_window_icon_name.patch 
}

build() {
  arch-meson $_pkgname build \
    --buildtype=debugoptimized \
    -D documentation=true
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
