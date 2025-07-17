# Maintainer: Elias Elwyn <a@jthv.ai>

pkgname=perl-alien-hdf4
_dist=Alien-HDF4
pkgver=0.06
pkgrel=5
pkgdesc='Encapsulate install info for HDF4'
license=('GPL-1.0-or-later OR Artistic-1.0-Perl')

url="https://metacpan.org/release/$_dist"
source=("$pkgname-$pkgver.tar.gz::https://cpan.metacpan.org/authors/id/E/ET/ETJ/$_dist-$pkgver.tar.gz"
        "$_dist-$pkgver.patch")
sha256sums=('19e143a3692c2c25a595e23834c2b318b912be1a92aa40ccd3e730cd097c152f'
            'ca8c5c82eb503113707782ae56488ccee82d24165909fdad892cf0e0750190f3')

arch=(any)
depends=(
  hdf4
  perl
)
makedepends=(
  perl-io-all
  perl-extutils-depends
)
checkdepends=(
  perl-test-simple
)
options=('!emptydirs')

prepare(){
  cd "$srcdir/$_dist-$pkgver"
  # Use shared libraries instead, as static ones are not available in
  # aur/hdf4
  # https://github.com/PDLPorters/Alien-HDF4/issues/6
  # https://gitweb.gentoo.org/repo/gentoo.git/tree/dev-perl/Alien-HDF4/files/Alien-HDF4-0.50.0-shared.patch
  patch --strip=1 <"../../$_dist-$pkgver.patch"
}

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
}
