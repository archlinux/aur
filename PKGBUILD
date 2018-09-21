# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname=gnome-calendar-linuxmint
_pkgname=gnome-calendar
pkgver=3.30.0
pkgrel=1
pkgdesc="Simple and beautiful calendar application designed to perfectly fit the GNOME desktop. With Linux Mint patches"
url="https://wiki.gnome.org/Apps/Calendar"
arch=('x86_64')
license=('GPL')
depends=('evolution-data-server' 
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
_commit=63ed4c48c84291ca70c747d6078090f8263088bf  # tags/3.30.0^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-calendar.git#commit=$_commit"
        "null-icaltime.diff"
        "add_cinnamon_settings_online_support.patch")
sha256sums=('SKIP'
            'c1aa738a4ff275f725d0aa5406312600503b2b59270448a9e6b30b82a924dc27'
            '2445f754a044dd1ccb8c948b5d5b43248b61ec3570fc76416f74148abc5abf4d')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname
  #Set datetime to NULL in case there is no available date
  patch -Np1 -i ../null-icaltime.diff
  
  #Add support so that gnome-calendar can call this when run within Cinnamon by calling cinnamon-settings online-accounts 
  patch -Np0 -i ../add_cinnamon_settings_online_support.patch
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
