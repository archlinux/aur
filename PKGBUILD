# Maintainer: Elias Elwyn <a@jthv.ai>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: carltonf <xiong[c05]@gmail.com>
# Contributor: Colin Pitrat <colin.pitrat@gmail.com>

pkgname=perl-pdl
pkgver=2.085
pkgrel=1
pkgdesc='The Perl Data Language'
_dist=PDL
arch=(i686 x86_64)
url="https://metacpan.org/release/$_dist"
license=(GPL PerlArtistic)
depends=(
  perl
  perl-file-which
  perl-pod-parser
  #--- PDL::IO::Dumper
  sharutils # replaces Convert::UU
  #--- PDL::IO::FastRaw, PDL::IO::FlexRaw
  perl-file-map

  # NOTE: the following dependencies are optional, you may comment any
  # section - BEFORE RUNNING MAKEPKG - that you'd like to do without
  # The related modules likely will not be very useful without these
  # dependencies
  #
  # See https://metacpan.org/release/ETJ/PDL-2.085/source/DEPENDENCIES
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

  #--- PDL::GIS::Proj, PDL::Transform::Proj
  # WARN: if this is commented, also comment PROJ_* in perldl.conf
  proj
  perl-alien-proj

  #--- PDL::Graphics::TriD
  perl-opengl
  perl-opengl-glut

  #--- PDL::Graphics::PGPLOT
  pgplot
  perl-pgplot

  #--- PDL::Graphics::IIS (pick only one package)
  xgterm-bin
  # ds9
  # ds9-bin

  #--- PDL::GSL
  gsl

  #--- PDL::IO::FITS
  perl-astro-fits-header

  #--- PDL::IO::GD
  gd

  #--- PDL::IO::HDF
  # WARN: if this is commented, also comment HDF_* in perldl.conf
  hdf4
  perl-alien-hdf4

  #--- PDL::IO::Pic
  netpbm
  ffmpeg

  #--- PDL::Slatec (used by other modules)
  #--- PDL::Minuit
  perl-extutils-f77
)
makedepends=(
  perl-devel-checklib
  perl-extutils-depends

  # NOTE: the following dependencies are optional, you may comment any
  # section - BEFORE RUNNING MAKEPKG - that you'd like to do without

  #--- PDL::Slatec (used by other modules)
  #--- PDL::Minuit
  gcc-fortran
)
checkdepends=(
  perl-test-exception
  perl-test-warn
)
options=('!emptydirs' purge)
source=("https://cpan.metacpan.org/authors/id/E/ET/ETJ/$_dist-$pkgver.tar.gz"
        perldl.conf)
sha256sums=(8425595db6def04762fa6ee6b92485ea762914a2b1d694f9b7607f4e51e0b2c1
            SKIP)

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
  mkdir --parents "$pkgdir/usr/lib/perl5/5.38/vendor_perl/$_dist"

  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
