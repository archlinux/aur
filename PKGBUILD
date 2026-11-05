# Maintainer: Elias Elwyn <a@jthvai.net>
# Contributor: René Wagner <rwagner at rw-net dot de>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

pkgname=perl-net-cups
_dist=Net-CUPS
pkgver=0.64
pkgrel=3
pkgdesc='Common Unix Printing System Interface'
license=('Artistic-1.0-Perl OR GPL-1.0-or-later')

url="https://metacpan.org/dist/$_dist"
_author=NINE
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/${_author:0:1}/${_author:0:2}/$_author/$_dist-$pkgver.tar.gz")
sha256sums=('d7bc77ff0f62bf874c843c590eb12a80bbd44749a2fb74dbed445c35d0e85a85')

arch=(x86_64)
depends=(
  'perl'
  'e2fsprogs>=1.43.4'
  'glibc>=2.25'
  'krb5>=1.13.7'
  'libcups>=2.2.3'
  'zlib>=1:1.2.11'
  'cups-filters'
)
options=('!emptydirs')

prepare() {
  cd "$srcdir/$_dist-$pkgver"
  # Replace all instances of CUPS_IMAGE_ with CF_IMAGE_ in the source files
  find . -type f -exec sed -i 's/CUPS_IMAGE_/CF_IMAGE_/g' {} +
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
