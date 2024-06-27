# Contributor: zeppelinlg <zeppelinlg DOT quenot AT gmail DOT com>
pkgname='perl-http-proxy'
pkgver='0.304'
pkgrel='3'
pkgdesc="HTTP proxy"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
makedepends=('perl-libwww' 'perl-test-simple')
url='http://search.cpan.org/dist/HTTP-Proxy'
source=("http://mirror.ibcp.fr/pub/CPAN/authors/id/B/BO/BOOK/HTTP-Proxy-${pkgver}.tar.gz" "HTTP-Proxy-0.304-Support-IPv6.patch" "HTTP-Proxy-0.304-Fix-Empty-Read.patch" "HTTP-Proxy-0.304-Fix-Test.patch")
md5sums=('09ac64c5f67b7d8baff4ea135d74af48'
         'd5065310dd4c4235cfd5421a167b8d1f'
         '0f95f4272188d3f570d5543abb305282'
         'b11bb3e0b53587a5105d03fc194968d4')
_dist_dir="HTTP-Proxy-${pkgver}"

prepare() {
  cd "$_dist_dir"
  # Fix bug #120275. https://rt.cpan.org/Public/Bug/Display.html?id=120275
  patch -Np1 -i "${srcdir}/HTTP-Proxy-0.304-Support-IPv6.patch"
  # Fix bug. http://www.cpantesters.org/cpan/report/b7d0a086-d278-11e5-a2ee-9fa967b6c32e
  # https://github.com/book/HTTP-Proxy/issues/7
  patch -Np1 -i "${srcdir}/HTTP-Proxy-0.304-Fix-Empty-Read.patch"
  #Patch from https://rt.cpan.org/Public/Bug/Display.html?id=123067
  patch -Np1 -i "${srcdir}/HTTP-Proxy-0.304-Fix-Test.patch"
}

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

  cd "$_dist_dir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_dist_dir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_dist_dir"
  make install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

