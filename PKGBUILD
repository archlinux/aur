# Maintainer: Jose Riha < jose1711 gmail com >

pkgname=perl-curses-panels-menus-forms
_dist=Curses
pkgver=1.46
pkgrel=1
pkgdesc="Character screen handling and windowing (built with panels, menus and forms support)"
arch=('i686' 'x86_64')
url="https://metacpan.org/dist/Curses"
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')
depends=('perl' 'ncurses' 'glibc')
options=('!emptydirs')
source=("https://www.cpan.org/authors/id/G/GI/GIRAFFED/${_dist}-${pkgver}.tar.gz")
sha256sums=('9631d6e3e2859c85913d8b8724f61fbebb9e932e9e50aa0493a4e0276660a3f9')
provides=('perl-curses')
conflicts=('perl-curses')

build() {
  cd "${_dist}-${pkgver}"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL PANELS MENUS FORMS INSTALLDIRS=vendor
  # avoid picking up perl's own CORE/form.h
  sed -i 's%.*<form.h>.*%#include "/usr/include/form.h"%' c-config.h
  make
}

check() {
  cd "${_dist}-${pkgver}"
  make test
}

package() {
  cd "${_dist}-${pkgver}"
  make pure_install doc_install DESTDIR="$pkgdir"
  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
