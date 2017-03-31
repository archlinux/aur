# Maintainer: Stefan Göbel <aur —at— subtype —dot— de>

pkgname='perl-dist-zilla-plugins-cjm'
_module='Dist-Zilla-Plugins-CJM'
_author='C/CJ/CJM'
pkgver='4.27'
pkgrel='1'
pkgdesc='A collection of Dist::Zilla plugins by CJM.'
arch=('any')
url="https://metacpan.org/release/$_module"
license=('PerlArtistic' 'GPL')
options=('!emptydirs' 'purge')
depends=('perl-dist-zilla')
source=(
   "http://search.cpan.org/CPAN/authors/id/$_author/$_module-$pkgver.tar.gz"
   'fix-recommendedprereqs-t.patch'
)
sha256sums=(
   '86fd4e68b3e444a2ecb8990136362fb14060c6c46abddddb497aa94c26e8d921'
   '0e96d3f444f6db0172b66f3eb5cea6b846a9e2c70fb154e2e76dc322517b25f5'
)

prepare() {
   cd "$_module-$pkgver"
   patch -p0 -uN -i '../fix-recommendedprereqs-t.patch'
}

build() {
   (
      unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
      export PERL_MM_USE_DEFAULT='1' PERL_AUTOINSTALL='--skipdeps'
      cd "$_module-$pkgver"
      perl Makefile.PL INSTALLDIRS='vendor'
      make
   )
}

check() {
   (
      cd "$_module-$pkgver"
      unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
      export PERL_MM_USE_DEFAULT='1'
      make test
   )
}

package() {
   (
      cd "$_module-$pkgver"
      unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
      make install INSTALLDIRS='vendor' DESTDIR="$pkgdir"
      find "$pkgdir" -name .packlist     -delete
      find "$pkgdir" -name perllocal.pod -delete
      find "$pkgdir" -type d -empty      -delete
   )
}

#:indentSize=3:tabSize=3:noTabs=true:mode=shellscript:maxLineLen=87: