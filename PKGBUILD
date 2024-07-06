pkgname=perl-data-dumper-simple
pkgver=0.11
pkgrel=1
pkgdesc="Easily dump variables with names"
arch=('any')
url="http://search.cpan.org/dist/Data-Dumper-Simple/"
license=('perl')
depends=('perl-filter-simple')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/O/OV/OVID/Data-Dumper-Simple-$pkgver.tar.gz")
sha256sums=('3f3cfd278cbe118852d97a399de139a3dfce38c6e0f0c775a492d27e702f0c5e')

build() {
  _dir=$(find $srcdir -maxdepth 2 -type f -name 'Makefile.PL')
  if [ ! -z "$_dir" ]; then
    cd $(dirname "$_dir")
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
    make
  else
  _dir=$(find $srcdir -maxdepth 2 -type f -name 'Build.PL')
  if [ ! -z "$_dir" ]; then
    cd $(dirname "$_dir")
    PERL_MM_USE_DEFAULT=1 perl Build.PL INSTALLDIRS=vendor
    ./Build
  else
    echo "error: failed to detect build method for $pkgname"
    echo "you may be able to fix this by editing the PKGBUILD"
    return 1
  fi fi
}

package() {
  _dir=$(find $srcdir -maxdepth 2 -type f -name 'Makefile.PL')
  if [ ! -z "$_dir" ]; then
    cd $(dirname "$_dir")
    make install DESTDIR="${pkgdir}"

  else
  _dir=$(find $srcdir -maxdepth 2 -type f -name 'Build.PL')
  if [ ! -z "$_dir" ]; then
    cd $(dirname "$_dir")
    ./Build install destdir=${pkgdir}

  else
    echo "error: failed to detect build method for $pkgname"
    echo "you may be able to fix this by editing the PKGBUILD"
    return 1
  fi fi

  # remove perllocal.pod and .packlist
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
