pkgname='perl-extutils-parsexs-aur'
pkgver='3.45'
pkgrel='1'
pkgdesc="Converts Perl XS code into C code"
arch=('any')
url='https://metacpan.org/release/ExtUtils-ParseXS'
license=('PerlArtistic' 'GPL')
depends=('perl')
options=('!emptydirs')
provides=(perl-extutils-parsexs=${pkgver})
#source=("http://search.cpan.org/CPAN/authors/id/X/XS/XSAWYERX/ExtUtils-ParseXS-$pkgver.tar.gz")
source=("http://search.cpan.org/CPAN/authors/id/X/XS/XSAWYERX/ExtUtils-ParseXS-3.44.tar.gz" 'https://src.fedoraproject.org/rpms/perl-ExtUtils-ParseXS/raw/rawhide/f/ExtUtils-ParseXS-3.44-Upgrade-to-3.45.patch')
sha256sums=('77effdf31af36ef656f09aa7c15356d238dab6d1afaa7278ae15c1b6bcf86266'
            '2661ce76168c04cb236e360ed0ae8587ebb6dfbc99070d7d41d09fce745caa35')
#_src_dir='$srcdir/ExtUtils-ParseXS-$pkgver'
_src_dir='$srcdir/ExtUtils-ParseXS-3.44'

build() {
  # Setting these env variables overwrites any command-line-options we don't want...
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  eval cd "$_src_dir"
  patch -p1 < "$srcdir/ExtUtils-ParseXS-3.44-Upgrade-to-3.45.patch"
  /usr/bin/perl Makefile.PL
  make
}

check () {
  eval cd "$_src_dir"
  make test
}

package () {
  eval cd "$_src_dir"
  make install

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
