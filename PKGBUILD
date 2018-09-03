# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=wavemon-git
pkgver=0.8.2.343.324b151
pkgrel=1
pkgdesc='Ncurses-based monitoring application for wireless network devices'
url='https://github.com/uoaerg/wavemon'
arch=('x86_64')
license=('GPL3')
depends=('ncurses' 'libcap' 'libnl')
makedepends=('git')
provides=('wavemon')
conflicts=('wavemon')
source=(${pkgname}::git+https://github.com/uoaerg/wavemon)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|cut -dv -f2)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  sed -e '/^CFLAGS=/d' -i configure.ac
  sed -r 's|(/share)|\1/doc|g' -i Makefile.in
  sed -r 's|\?=|=|g' -i Makefile.in
  autoreconf -fiv
}

build() {
  cd ${pkgname}
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
