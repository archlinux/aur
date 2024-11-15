# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

_distname='CBOR-XS'

pkgname=perl-cbor-xs
pkgver=1.87
pkgrel=1
pkgdesc='Concise Binary Object Representation'
arch=('x86_64' 'i686')
license=('GPL-3.0-only')
options=('!emptydirs')
depends=('perl' 'perl-types-serialiser' 'perl-common-sense')
url="https://metacpan.org/release/${_distname}"
source=("https://cpan.metacpan.org/authors/id/M/ML/MLEHMANN/${_distname}-${pkgver}.tar.gz"
        "kill-canary.patch")
sha512sums=('ed63d0df608b0f983854e2be657171ddf937770b1ed13b78817b1cd044fe8e28e50b02f790810e615f8903fed9ea0f4560bfe4e1748bebd177056410cc060002'
            '9661c1d101968f575b4455c896b30968ba9a4d2d15dcc0305ebc210a769ce94881a2661c06c83464aede3df2e258ebea711976390a0986422a433089c574f54b')

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
