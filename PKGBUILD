# $Id: PKGBUILD 134588 2015-06-02 17:41:10Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Tom K <tomk@runbox.com>

pkgname=perl-libapreq2
pkgver=2.16
pkgrel=2
pkgdesc="A safe, standards-compliant, high-performance library used for parsing HTTP cookies, query-strings and POST data."
arch=('i686' 'x86_64')
url="https://metacpan.org/release/libapreq2"
options=('!emptydirs')
depends=('mod_perl' 'apr-util' 'perl')
makedepends=('perl-extutils-xsbuilder')
license=("GPL")
source=(https://cpan.metacpan.org/authors/id/S/SH/SHAY/libapreq2-$pkgver.tar.gz
        link-in-apr-shared-objects.patch)
md5sums=('c0f4fbeee7514ea22a038933d0075f8e'
         '4cee6d940e95aeb47dd503b8e8a1c7dd')

prepare() {
  cd $srcdir/libapreq2-$pkgver
  patch -p1 < ../link-in-apr-shared-objects.patch
}

build() {
  cd  $srcdir/libapreq2-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL --with-apache2-apxs=/usr/bin/apxs --with-mm-opts="INSTALLDIRS=vendor"
  find . -type f -name Makefile -exec sed -i 's#-ldb-5.1#-ldb-5.2#' {} \;
  sed -i 's#-ldb-5.1#-ldb-5.2#' apreq2-config
  make LD_RUN_PATH="/usr/lib"  # build sets RPATH to non-sanitized path, force correct rpath
}

package() {
  cd  $srcdir/libapreq2-$pkgver
  make install DESTDIR=$pkgdir
  sed -i "s#$srcdir#/usr/src#" $pkgdir/usr/bin/apreq2-config
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
## template start; name=perl-binary-module-dependency; version=1;
#if [[ $(find "$pkgdir/usr/lib/perl5/" -name "*.so") ]]; then
#	_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
#	_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')
#	depends+=("perl>=$_perlver_min" "perl<$_perlver_max")
#fi
## template end;
}
