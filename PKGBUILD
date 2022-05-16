# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-cache-memcached-fast"
pkgver="0.27"
pkgrel='1'
pkgdesc="Perl client for memcached, in C language"
arch=('i686' 'x86_64' 'arm')
url="https://metacpan.org/release/Cache-Memcached-Fast"
license=('PerlArtistic')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/R/RA/RAZ/Cache-Memcached-Fast-${pkgver}.tar.gz")
sha512sums=('6e3f7cb6ae317312a16aad7888fb75ec03ff7be5b79aef1702c8bc8a1499995379b42c1afd6c587d419ea4dbe880836c874d4929f968f7a384ab152e5baa03fa')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/Cache-Memcached-Fast-${pkgver}"
}

build() {
  prepare_environment
  /usr/bin/perl Makefile.PL

  # parallel builds break due to a race during generation of a header
  # file
  make -j1
}

check() {
  prepare_environment
  make test
}

package() {
  prepare_environment
  make install
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
  find "$pkgdir" -type f -name '*.so' -exec strip {} \+ # 'strip' option doesn't work because files are read-only
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
