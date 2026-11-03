# Maintainer: Elias Elwyn <a@jthvai.net>

pkgname=perl-alien-proj
_dist=Alien-proj
pkgver=1.31
pkgrel=3
pkgdesc='Compile the Proj library'
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')

url="https://metacpan.org/release/$_dist"
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/S/SL/SLAFFAN/$_dist-$pkgver.tar.gz"
        "cs2cs-version-string.patch")
sha256sums=('9d0169833a37d87423830055c2732533dc3907fc32eaa2eec43caf17a3d3e9e7'
            'a96b4762e86b0f9037e41db96e5838d8161ecd3e081da81342174ca544675a01')

arch=(any)
depends=(
  proj
  perl
  perl-alien-build
  perl-ffi-checklib
)
makedepends=(
  perl-alien-build-plugin-pkgconfig-ppwrapper
  perl-alien-sqlite
  perl-file-find-rule
  perl-file-which
  perl-path-tiny
  perl-pkgconfig
  perl-sort-versions
)
options=('!emptydirs')

prepare() {
  cd "$srcdir/$_dist-$pkgver"
  patch -Np1 -i ../cs2cs-version-string.patch
}

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL NO_PACKLIST=1 NO_PERLLOCAL=1
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
