# Maintainer: Adria Arrufat <swiftscythe at gmail dot com>

_pkgname=epiphany
pkgname=$_pkgname-git
pkgver=44.0+67+gd591ec71b
pkgrel=1
pkgdesc="A GNOME web browser based on the WebKit rendering engine."
url="https://wiki.gnome.org/Apps/Web"
arch=('x86_64')
license=('GPL')
depends=(webkitgtk-6.0 gcr-4 gtk4 libdazzle libhandy libarchive libportal-gtk4 libadwaita)
makedepends=(cmake docbook-xml startup-notification lsb-release gobject-introspection
             yelp-tools git meson)
checkdepends=(xorg-server-xvfb aspell hspell hunspell nuspell libvoikko)
groups=(gnome)
replaces=(epiphany)
provides=(epiphany)
conflicts=(epiphany)
source=("git+https://gitlab.gnome.org/GNOME/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd $_pkgname
  [ -d build ] && rm -rf build
  meson build --prefix=/usr --buildtype=release
  ninja -C build
}

check() {
  cd $_pkgname
  dbus-run-session xvfb-run \
    -s '-screen 0 1920x1080x24 -nolisten local' \
    meson test -C build --print-errorlogs
}

package() {
  cd $_pkgname
  DESTDIR=${pkgdir} ninja -C build install
}
