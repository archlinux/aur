# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Alexander Hunziker <alex.hunziker@gmail.com>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=babl-git
_pkgname=${pkgname%-git}
pkgver=0.1.57.r1369.2ca9b0c
pkgrel=1
pkgdesc="Dynamic, any to any, pixel format translation library."
arch=('i686' 'x86_64')
url="http://www.babl.org/babl"
license=('LGPL3')
depends=('glibc')
makedepends=('git')
provides=("babl=$pkgver")
conflicts=('babl')
source=('git+https://gitlab.gnome.org/GNOME/babl')
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname

  printf "%s.r%s.%s" \
  	$(cat configure.ac | grep '^m4_define(\[babl_.*_version\], \[[0-9]*\])' | tr -d '\n' | sed -e 's|^m4_define(\[babl_major_version\], \[||' -e 's|\])m4_define(\[babl_minor_version\], \[|.|' -e 's|\])m4_define(\[babl_micro_version\], \[|.|' -e 's|\])|\n|') \
  	$(git rev-list --count HEAD) \
  	$(git rev-parse --short HEAD)
}

prepare() {
  cd $_pkgname

  autoreconf -vif

  ./configure --prefix=/usr
}

build() {
  cd $_pkgname

  make
}

package() {
  cd $_pkgname

  make DESTDIR="$pkgdir" install
}

