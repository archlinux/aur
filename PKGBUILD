# Contributor: Swift Geek <swiftgeek «at» gmail.com>
pkgname=perl-module-build-withxspp
pkgver=0.14
pkgrel=1
pkgdesc="Module::Build::WithXSpp - XS++ enhanced flavour of Module::Build"
arch=('any')
url="https://metacpan.org/release/Module-Build-WithXSpp/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-extutils-cppguess')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/S/SM/SMUELLER/Module-Build-WithXSpp-${pkgver}.tar.gz")
md5sums=('f3d6ad08127f62eed9baef131870f450')

prepare() {
  export _src_dir="$srcdir/Module-Build-WithXSpp-$pkgver"
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
}

build() {
  cd "$_src_dir"
  /usr/bin/perl Build.PL
  ./Build
}

check () {
  cd "$_src_dir"
  ./Build test
}

package () {
  cd "$_src_dir"
  ./Build install
  perl Build.PL installdirs=vendor destdir="$pkgdir/"
  perl Build

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
