# $Id$
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

_pkgname=procps-ng
pkgname=procps-ng-classic
pkgver=3.3.10
pkgrel=2
pkgdesc='Utilities for monitoring your system and its processes (with classic top)'
url='http://sourceforge.net/projects/procps-ng/'
license=('GPL' 'LGPL')
arch=('i686' 'x86_64')
depends=('ncurses' 'systemd')
source=("http://downloads.sourceforge.net/project/${_pkgname}/Production/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('a02e6f98974dfceab79884df902ca3df30b0e9bad6d76aee0fb5dce17f267f04')

groups=('base')

conflicts=('procps' 'sysvinit-tools' 'procps-ng')
provides=('procps' 'sysvinit-tools' 'procps-ng')
replaces=('procps' 'sysvinit-tools')

install=install

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  sed 's:<ncursesw/:<:g' -i watch.c
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --exec-prefix=/ \
    --sysconfdir=/etc \
    --libdir=/usr/lib \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --enable-watch8bit \
    --with-systemd \
    --disable-modern-top \

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # provided by util-linux
  rm "${pkgdir}/usr/bin/kill"
  rm "${pkgdir}/usr/share/man/man1/kill.1"
}
