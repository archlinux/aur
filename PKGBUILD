# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname=gnome-calendar-linuxmint
_pkgname=gnome-calendar
pkgver=3.28.2
pkgrel=2
pkgdesc="Simple and beautiful calendar application designed to perfectly fit the GNOME desktop. With Linux Mint patches"
url="https://wiki.gnome.org/Apps/Calendar"
arch=(x86_64)
license=(GPL)
depends=(gsettings-desktop-schemas libdazzle)
makedepends=(python appstream-glib git meson gtk-doc evolution evolution-data-server)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_commit=c4d1f984758e77787ef97b71fe2dede8477809c2  # tags/3.28.2^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-calendar.git#commit=$_commit"
        null-icaltime.diff
        add_cinnamon_settings_online_support.patch)
sha256sums=('SKIP'
            'c1aa738a4ff275f725d0aa5406312600503b2b59270448a9e6b30b82a924dc27'
            '2445f754a044dd1ccb8c948b5d5b43248b61ec3570fc76416f74148abc5abf4d')

prepare() {
  cd $_pkgname
  #Set datetime to NULL in case there is no available date
  patch -Np1 -i ../null-icaltime.diff
  
  #Add support so that gnome-calendar can call this when run within Cinnamon by calling cinnamon-settings online-accounts 
  patch -Np0 -i ../add_cinnamon_settings_online_support.patch
}

build() {
  arch-meson $_pkgname build -D gtk_doc=true
  ninja -C build
}

check() {
  cd build
  meson test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
