# Maintainer: Elias Elwyn <a@jthvai.net>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: carltonf <xiong[c05]@gmail.com>
# Contributor: Colin Pitrat <colin.pitrat@gmail.com>

pkgname=perl-pdl
_dist=PDL
pkgver=2.105
pkgrel=1
pkgdesc='The Perl Data Language'
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')

url="https://metacpan.org/release/$_dist"
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/E/ET/ETJ/$_dist-$pkgver.tar.gz"
        perldl.conf)
sha256sums=('5cf69e1571a58d376bf65ce4ddec38f2bbf939083c4c5989f91ef213a59b00b6'
            'SKIP')

arch=(i686 x86_64)
depends=(
  perl glibc
  perl-file-which
  perl-pod-parser
  #--- PDL::IO::Dumper
  sharutils # replaces Convert::UU
  #--- PDL::IO::FastRaw, PDL::IO::FlexRaw
  perl-file-map

  # NOTE: the following dependencies are optional, you may comment any
  # section - BEFORE RUNNING MAKEPKG - that you'd like to do without.
  # They must be included here as they affect which modules are built.
  # The related modules will not be very useful without these dependencies.
  #
  # See https://metacpan.org/release/ETJ/PDL-2.095/source/DEPENDENCIES
  # for more information

  #-- Uncategorised
  perl-term-readkey

  #--- Inline::Pdlpp
  perl-inline
  perl-inline-c

  #--- pdl2, perldl
  # perl-devel-repl # pdl2 shell alternative backend
  perl-term-readline-gnu # XS performance for perldl
  perl-sys-sigaction

  #--- PDL::Graphics::PGPLOT
  pgplot
  perl-pgplot

  #--- PDL::IO::FITS
  # WARN: a dependency does not build with gcc v15-16 (2026-06-07)
  # https://github.com/Starlink/perl-Starlink-AST/issues/2
  # https://github.com/asb-capfan/TkZinc/issues/26
  perl-astro-fits-header

  #--- PDL::IO::Pic
  netpbm
  ffmpeg
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
options=('!emptydirs')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL PDLCONF="$srcdir/perldl.conf"
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  # Fixes first builds: "No such file or directory at blib/lib/PDL/Doc.pm line 741"
  mkdir --parents "$pkgdir/usr/lib/perl5/$(perl -e '$^V =~ /v(\d+\.\d+)\.\d+/; print $1')/vendor_perl/$_dist"

  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
