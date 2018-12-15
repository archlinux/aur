# Maintainer: Adria Arrufat

_pkgname=epiphany
pkgname=$_pkgname-git
pkgver=3.31.3+2+g29cbc2166
pkgrel=1
pkgdesc="A GNOME web browser based on the WebKit rendering engine."
url="http://www.gnome.org/projects/$_pkgname/"
arch=('i686' 'x86_64')
license=('GPL')
depends=(webkit2gtk gcr libdazzle)
makedepends=(meson docbook-xml startup-notification lsb-release
             gobject-introspection yelp-tools autoconf-archive appstream-glib git)
groups=(gnome)
replaces=(epiphany)
provides=(epiphany)
conflicts=(epiphany)
source=("git+https://gitlab.gnome.org/GNOME/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --always | sed 's/-/+/g'
}

build() {
  cd $_pkgname
  [ -d build ] && rm -rf build
  meson build --prefix=/usr --buildtype=release -Denable_https_everywhere=false
  ninja -C build
}

check() {
  cd $_pkgname
  ninja -C build test
}

package() {
  cd $_pkgname
  DESTDIR=${pkgdir} ninja -C build install
}
