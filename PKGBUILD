# Maintainer: Elias Elwyn <a@jthvai.net>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: carltonf <xiong[c05]@gmail.com>
# Contributor: Colin Pitrat <colin.pitrat@gmail.com>

pkgname=perl-pdl
_dist=PDL
pkgver=2.106
pkgrel=3
pkgdesc='The Perl Data Language'
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')

url="https://metacpan.org/dist/$_dist"
_author=ETJ
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/${_author:0:1}/${_author:0:2}/$_author/$_dist-$pkgver.tar.gz"
        perldl.conf)
sha256sums=('f500e740d327e221985ac35f38f5e1e42bf2e3a690c0ed927ac9ed17d9d8241b'
            'SKIP')

arch=(x86_64)
depends=(
  perl glibc
  perl-file-which
  perl-pod-parser
  #--- PDL::IO::Dumper
  sharutils # replaces Convert::UU
  #--- PDL::IO::FastRaw, PDL::IO::FlexRaw
  perl-file-map
)
makedepends=(
  perl-devel-checklib
  perl-extutils-depends
)
checkdepends=(
  perl-test-deep
  perl-test-exception
  perl-test-warn
)
optdepends=(
  perl-term-readkey
  'perl-inline: Inline::Pdlpp'
  'perl-inline-c: Inline::Pdlpp'
  'perl-devel-repl: pdl2'
  'perl-data-dump-streamer: pdl2 with Devel::REPL'
  'perl-sys-sigaction: pdl2 with Devel::REPL'
  'perl-term-readline-gnu: pdl2, perldl'

  # WARN: a transitive dependency does not build with gcc v15-16 (2026-11-07)
  # https://github.com/Starlink/perl-Starlink-AST/issues/2
  'perl-astro-fits-header: PDL::IO::FITS'

  'netpbm: PDL::IO::Pic'
  'ffmpeg: PDL::IO::Pic'
)
options=('!emptydirs')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1 PDLCONF="$srcdir/perldl.conf"
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  make test
}

package() {
  # Fixes first builds: "No such file or directory at blib/lib/PDL/Doc.pm line 741"
  mkdir --parents "$pkgdir/usr/lib/perl5/$(perl -e '$^V =~ /v(\d+\.\d+)\.\d+/; print $1')/vendor_perl/$_dist"

  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
