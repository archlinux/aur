# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname="perl-cache-memcached-fast"
pkgver="0.26"
pkgrel='1'
pkgdesc="Perl client for memcached, in C language"
arch=('i686' 'x86_64' 'arm')
url="https://metacpan.org/release/Cache-Memcached-Fast"
license=('PerlArtistic')
options=('!emptydirs')
source=("https://cpan.metacpan.org/authors/id/R/RA/RAZ/Cache-Memcached-Fast-${pkgver}.tar.gz")
sha512sums=('aea565be2d1aaae186c6d985d88e444fa39311338a851f7f05b013affcab0bfcabd258a3df08849b9429b7168ff0d1e59ab27b1e843b217093b2b64786e890b1')

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
