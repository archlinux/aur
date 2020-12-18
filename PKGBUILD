# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

_distname='CBOR-XS'

pkgname=perl-cbor-xs
pkgver=1.83
pkgrel=1
pkgdesc='Concise Binary Object Representation'
arch=('x86_64' 'i686')
license=('GPL')
options=('!emptydirs')
depends=('perl' 'perl-types-serialiser' 'perl-common-sense')
url="https://metacpan.org/release/${_distname}"
source=("https://cpan.metacpan.org/authors/id/M/ML/MLEHMANN/${_distname}-${pkgver}.tar.gz"
        "kill-canary.patch")
sha512sums=('280c820d247c09c3b77722b369dd23667c846b04109e78ec9f4ce408f033082351596b3652b861f936460a5a2157019eeb3ca51f3093e10cfb7b3ef9cc4565b6'
            '930bea1d5cfad6bfdf09db9a6532ce4eb584adda3182d34d00f547bc918a0c9eb7cefbd2ace5a8eb7acda9275f4143961b0581747d6cc795988891e99c638ead')

prepare() {
  cd "${srcdir}/${_distname}-${pkgver}"
  patch -p1 < "${srcdir}/kill-canary.patch"
}

build() {
  cd "${srcdir}/${_distname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT='1' PERL_AUTOINSTALL='--skipdeps'
  perl Makefile.PL INSTALLDIRS='vendor'
  make
}

check() {
  cd "${srcdir}/${_distname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "${srcdir}/${_distname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  make install DESTDIR="${pkgdir}"
  find "${pkgdir}" \( -name .packlist -or -name perllocal.pod \) -delete
}

# vim:set ts=2 sw=2 et:
