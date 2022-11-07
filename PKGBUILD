# Maintainer: getzze at gmail dot com
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Giorgio Gilestro <giorgio@gilest.ro>

pkgname=python-nautilus-1
_pkgbase=nautilus-python
pkgver=1.2.3
pkgrel=8
pkgdesc="Python bindings for the Nautilus Extension API"
arch=(x86_64)
url="https://wiki.gnome.org/Projects/NautilusPython"
license=(GPL2)
depends=(nautilus-typeahead python-gobject)
makedepends=(gtk-doc)
conflicts=(nautilus-python python-nautilus)
provides=(nautilus-python python-nautilus)
source=(https://download.gnome.org/sources/${_pkgbase}/${pkgver%.*}/${_pkgbase}-$pkgver.tar.xz
        gcc10.patch)
sha256sums=('073ce0297282259937ab473d189b97a04f42b97197c9292fc3bde9d135282098'
            '291aac3fc44837aa310e03c0cea2e1fccb882b4dd20afbb2796d1c410af4a55f')

prepare() {
  cd ${_pkgbase}-$pkgver

  # https://gitlab.gnome.org/GNOME/nautilus-python/-/merge_requests/7
  patch -Np1 -i ../gcc10.patch
}

build() {
  cd ${_pkgbase}-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-gtk-doc \
              PYTHON=python3
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${_pkgbase}-$pkgver
  make DESTDIR="$pkgdir" install
}
