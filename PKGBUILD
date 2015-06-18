# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: Ivan Sichmann Freitas <ivansichfreitas@gmail.com>

pkgname=vit
pkgver=1.2
pkgrel=2
pkgdesc="A terminal interface for Taskwarrior with Vim key bindings and colorization support"
arch=('any')
url="http://taskwarrior.org/projects/taskwarrior/wiki/Vit"
license=('GPL3')
depends=('perl-curses' 'task')
source=(http://taskwarrior.org/download/${pkgname}-${pkgver}.tar.gz)
sha512sums=('20d584c9414c50788390b3f90a8f2ea68204bcebd7466d27124f5c39b6fbdb56987bfb525148b4ed2e568838504183f80be001723fec99b4869600e2f2cb5e18')

prepare() {
  cd ${pkgname}-${pkgver}

  # use /usr/share/vit instead of /etc/vit
  sed -i "s|/etc|/share/vit|" Makefile.in vit.pl

  # use /usr/share/man instead of /usr/man
  sed -i "s|/man/|/share/man/|" Makefile.in vit.pl

  # use DESTDIR and do NOT use sudo for install
  sed -i "s|sudo ||;s| \(@prefix\)| \$(DESTDIR)/\1|" Makefile.in

  # allow custom perl location
  sed -ri "s|(#!/usr/bin/)perl -w|\1env perl|" vit.pl
  sed -i '/test "\$PERL" !=/,+4d' configure
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
