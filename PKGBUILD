# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: JokerBoy <jokerboy at punctweb dot ro>

pkgname=ls++-git
pkgver=0.348.71.5c591e1
pkgrel=1
epoch=1
pkgdesc='Colorized LS on steroids'
url='https://github.com/trapd00r/ls--/'
arch=('any')
license=('GPL2')
depends=('perl-term-extendedcolor')
makedepends=('git')
backup=('etc/ls++.conf')
options=(!emptydirs)
source=(${pkgname}::git+https://github.com/trapd00r/ls--.git)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  _lsver=$(grep 'VERSION =' ls++|sed -r 's/\$VERSION = (.+);/\1/'|cut -d\' -f2)
  echo "${_lsver}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}
  PERL_MM_USE_DEFAULT=1 \
    PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='${pkgdir}'" \
    PERL_MB_OPT="--installdirs vendor --destdir '${pkgdir}'" \
    MODULEBUILDRC=/dev/null \
    perl Makefile.PL
  make
}

package() {
  cd ${pkgname}
  make install
  install -Dm 644 ls++.conf "${pkgdir}/etc/ls++.conf"
}

# vim: ts=2 sw=2 et:
